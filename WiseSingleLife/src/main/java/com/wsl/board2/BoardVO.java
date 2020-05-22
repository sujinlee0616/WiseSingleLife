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

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int no;
	private String title;
	private String author;
	private String content;
	private String pwd;
	private Date regdate;
	private int hit;
	private String img;
}
