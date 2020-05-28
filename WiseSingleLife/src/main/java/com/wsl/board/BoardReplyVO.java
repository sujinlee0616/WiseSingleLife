package com.wsl.board;

import java.util.Date;

import lombok.Setter;

import lombok.Getter;

/*
 * CREATE TABLE BoardReply(
    rno NUMBER PRIMARY KEY,
    no NUMBER,
    id VARCHAR2(20) NOT NULL,
    pwd VARCHAR2(20) NOT NULL,
    msg CLOB NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    group_id NUMBER,
    group_step NUMBER DEFAULT 0,
    group_tab NUMBER DEFAULT 0,
    root NUMBER DEFAULT 0,
    depth NUMBER DEFAULT 0,
    CONSTRAINT br_no_fk FOREIGN KEY(no)
    REFERENCES board(no)
);
 */
@Getter
@Setter
public class BoardReplyVO {
	private int rno;
	private int no;
	private String id;
	private String pwd;
	private String msg;
	private Date regdate;
	private int group_id;
	private int group_step;
	private int group_tab;
	private int root;
	private int depth;
	private String dbday;
}
