package com.wsl.board;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class BoardReplyDAO {
	@Resource(name="boardReplyMapper")
	BoardReplyMapper mapper;
	// 댓글 작성
	public void replyInsert(BoardReplyVO vo)
	{
		mapper.replyInsert(vo);
	}
	// 댓글 리스트출력
	public List<BoardReplyVO> replyListData(int no)
	{
		return mapper.replyListData(no);
	}
	// 수정하기
	public void replyUpdate(BoardReplyVO vo)
	{
		mapper.replyUpdate(vo);
	}
	
	// 대댓글 작성, 두 개 이상의 sql문장을 처리하기때문에 오류방지 차원에서 트랜잭션을 사용한다.
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void reReplyInsert(int pno,BoardReplyVO vo)
	{
		BoardReplyVO pvo=mapper.replyParentInfoData(pno);
		mapper.replyGroupStepIncrement(pvo);
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step()+1);
		vo.setGroup_tab(pvo.getGroup_tab()+1);
		vo.setRoot(pno);
		mapper.reReplyInsert(vo);
		mapper.replyDepthIncrement(pno);
	}
	
	// 댓글 삭제, 역시 tranaction으로 예외처리를 해준다
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public void replyDelete(int rno)
	{
		BoardReplyVO vo=mapper.replyInfoData(rno); // depth와 root를 받앗다.
		if(vo.getDepth()==0)
		{
			mapper.replyDelete(rno);
		}
		else
		{
			BoardReplyVO rvo= new BoardReplyVO();
			rvo.setRno(rno);
			rvo.setMsg("관리자가 삭제한 메세지입니다.");
			mapper.replyUpdate(rvo);
		}
		mapper.replyDepthDecrement(vo.getRoot());
		
	}
	// 해당 댓글비번가져오기
	public String replyGetPwd(int rno)
	{
		return mapper.replyGetPwd(rno);
	}
	// 댓글갯수
	public String replyCount(int no)
	{
		return mapper.replyCount(no);
	}
}
