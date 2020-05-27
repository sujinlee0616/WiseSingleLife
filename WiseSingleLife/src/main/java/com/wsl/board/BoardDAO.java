package com.wsl.board;

import java.util.*;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Resource(name="boardMapper")
	BoardMapper mapper;
	
	public List<BoardVO> boardListData(Map map)
	{
		return mapper.boardListData(map);
	}
	public int boardTotalPage()
	{
		return mapper.boardTotalPage();
	}
	public void boardInsert(BoardVO vo)
	{
		mapper.boardInsert(vo);
	}
	
	public BoardVO boardDetailData(int no)
	{
		mapper.boardHitIncrement(no);
		return mapper.boardDetailData(no);
	}
	
	public BoardVO boardUpdateData(int no)
	{
		return mapper.boardDetailData(no);
	}
	
	public String boardGetPwd(int no)
	{
		return mapper.boardGetPwd(no);
	}
	
	public void boardUpdate(BoardVO vo)
	{
		mapper.boardUpdate(vo);
	}
	
	public void boardDelete(int no)
	{
		mapper.boardDelete(no);
	}
}
