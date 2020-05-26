package com.wsl.board2;
/*
 *  RNO     NOT NULL NUMBER       
	BNO              NUMBER       
	NAME    NOT NULL VARCHAR2(50) 
	CONTENT NOT NULL CLOB         
	REGDATE          DATE  
 */

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO2 {
	private int rno;
	private int bno; // board테이블의 no
	private String name;
	private String content;
	private Date regdate;
}
