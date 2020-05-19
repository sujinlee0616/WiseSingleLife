package com.wsl.search;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchKeywordVO {

	private int codeNo;
	private String keyword;
	private int count;
	private Date datetime;
	
}