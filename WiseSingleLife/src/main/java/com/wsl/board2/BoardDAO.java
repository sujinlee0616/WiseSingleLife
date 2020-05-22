package com.wsl.board2;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Resource(name="boardMapper")
	private BoardMapper mapper;
	
	// 게시판 상세정보
	public BoardVO boardDetailData(int no) {
		return mapper.boardDetailData(no);
	}
	
	// 조회수 증가
	public void hitIncrement(int no) {
		mapper.hitIncrement(no);
	}
	
	// 총 글 수
	public int boardContentsCount() {
		return mapper.boardContentsCount();
	}
	
	
	
	// ############################## 댓글 ###############################
	
	// 해당 게시글의 댓글
	public List<ReplyVO> boardReplyData(int bno) {
		return mapper.boardReplyData(bno);
	}
	
	// 해당 게시글의 댓글 총 개수 
	public int boardReplyCount(int bno) {
		return mapper.boardReplyCount(bno);
	}
}
