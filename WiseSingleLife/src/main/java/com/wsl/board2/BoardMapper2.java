package com.wsl.board2;
/*
 *  NO         NUMBER         
	TITLE      VARCHAR2(1000) 
	AUTHOR     VARCHAR2(1000) 
	CONTENT    CLOB           
	PWD        VARCHAR2(10)   
	REGDATE    DATE           
	HIT        NUMBER         
	IMG        VARCHAR2(1000) 
 */

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface BoardMapper2 {
	// 게시판 상세정보
	@Select("SELECT * FROM board "
		   +"WHERE no=#{no}")
	public BoardVO2 boardDetailData(int no);
	
	// 조회수 증가
	@Update("UPDATE board SET "
		   +"hit=hit+1 "
		   +"WHERE no=#{no}")
	public void hitIncrement(int no);
	
	
	
	
	// ############################## 댓글 ###############################
	
	// 해당 게시글의 댓글
	@Select("SELECT * FROM board_reply "
		   +"WHERE bno=#{bno}")
	public List<ReplyVO2> boardReplyData(int bno);
	
	// 해당 게시글의 댓글 총 개수 
	@Select("SELECT COUNT(*) FROM board_reply "
		   +"WHERE bno=#{bno}")
	public int boardReplyCount(int bno);
}
