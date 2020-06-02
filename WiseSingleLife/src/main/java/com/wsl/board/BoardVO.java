package com.wsl.board;

import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int no; // 글 번호
	private String author; // 글쓴이
	private String title; // 글제목
	private String content; // 글내용
	private String pwd;
	private Date regdate;
	private int hit;
	private int replyCnt;
//	private int group_id;
//	private int group_step;
//	private int group_tab;
//	private int root;
//	private int depth;
//	private String notice;
//	private int cmtCount; // 댓글 개수
}