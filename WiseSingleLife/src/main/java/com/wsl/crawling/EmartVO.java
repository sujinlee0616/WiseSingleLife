package com.wsl.crawling;

import java.util.*;

import lombok.Getter;
import lombok.Setter;
/*
	PRODUCTCODE NOT NULL VARCHAR2(4000) 
	CODENO      NOT NULL NUMBER         
	NAME        NOT NULL VARCHAR2(4000) 
	PRICE       NOT NULL NUMBER         
	UNITPRICE            VARCHAR2(4000) 
	RATE                 NUMBER(2,1)    
	REVIEWCOUNT          NUMBER         
	TAGS                 VARCHAR2(4000) 
	LOOKUP      NOT NULL NUMBER         
	LOOKUPTIME  NOT NULL DATE           
	RANK        NOT NULL NUMBER         
	IMG                  VARCHAR2(4000) 
 */
@Getter
@Setter
public class EmartVO {
	
	private String productcode;  // 1.상품코드
	private int codeno; // 2.검색어 코드
	private String name; // 3.상품이름
	private int price; // 4.총가격
	private String unitprice; // 5.100g당 가격
	private double rate; // 6.별점
	private int reviewcount; // 7.리뷰숫자
	private String tags; // 8.태그
	private int lookup; // 9.조회수
	private Date lookuptime; // 10.조회한 날짜
	private int rank; // 11.순서
	private String img; // 12.이미지
}
