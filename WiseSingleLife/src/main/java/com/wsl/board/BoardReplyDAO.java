package com.wsl.board;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

@Repository
public class BoardReplyDAO {
	@Resource(name="boardReplyMapper")
	BoardReplyMapper mapper;
	
	public void replyInsert(BoardReplyVO vo)
	{
		mapper.replyInsert(vo);
	}
	
	public List<BoardReplyVO> replyListData(int no)
	{
		return mapper.replyListData(no);
	}
	
	public void replyUpdate(BoardReplyVO vo)
	{
		mapper.replyUpdate(vo);
	}
}
