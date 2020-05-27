package com.wsl.board;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface BoardMapper {
	@Select("SELECT no,author,title,content,regdate,hit,num "
			+ "FROM (SELECT no,author,title,content,regdate,hit,rownum as num "
			+ "FROM (SELECT no,author,title,content,regdate,hit "
			+ "FROM board ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(Map map);
	
	@Select("SELECT CEIL (COUNT(*)/15.0) FROM board")
	public int boardTotalPage();
	
	@SelectKey(keyProperty="no",resultType=int.class,before=true,
		statement="SELECT NVL(MAX(no)+1,1) as no FROM board")
	@Insert("INSERT INTO board(no,title,author,content,pwd) VALUES("
			+ "#{no},#{title},#{author},#{content},#{pwd})")
	public void boardInsert(BoardVO vo);
	
	@Select("SELECT * FROM board "
			+ "WHERE no=#{no}")
	public BoardVO boardDetailData(int no);
	
	@Update("UPDATE board SET "
			+ "hit=hit+1 "
			+ "WHERE no=#{no}")
	public void boardHitIncrement(int no);
	
	@Select("SELECT pwd FROM board "
			+ "WHERE no=#{no}")
	public String boardGetPwd(int no);
	
	@Update("UPDATE board SET "
			+ "author=#{author},title=#{title},content=#{content} "
			+ "WHERE no=#{no}")
	public void boardUpdate(BoardVO vo);
	/*
	 * DELETE FROM replyBoard
		WHERE bno=#{bno}
	 */
	@Delete("DELETE FROM board "
			+ "WHERE no=#{no}")
	public void boardDelete(int no);
}
