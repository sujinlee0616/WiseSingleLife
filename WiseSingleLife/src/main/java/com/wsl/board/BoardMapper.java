package com.wsl.board;

import java.util.*;

import org.apache.ibatis.annotations.Select;

public interface BoardMapper {
	@Select("SELECT no,author,title,content,regdate,hit,num "
			+ "FROM (SELECT no,author,title,content,regdate,hit,rownum as num "
			+ "FROM (SELECT no,author,title,content,regdate,hit "
			+ "FROM board ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(Map map);
	
	@Select("SELECT CEIL (COUNT(*)/15.0) FROM board")
	public int boardTotalPage();
}
