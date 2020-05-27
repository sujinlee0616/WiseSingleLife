package com.wsl.search;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchCountVO {
	private int no;
	private String keyword;
	private Date regdate;
}
