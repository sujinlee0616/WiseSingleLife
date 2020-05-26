package com.wsl.emart;
/*
 *  PRODUCTCODE NOT NULL VARCHAR2(4000) 
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

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmartVO {
	private String productcode;
	private int codeno;
	private String name;
	private int price;
	private String unitprice="";
	private double rate=0.0;
	private int reviewcount=0;
	private String tags="";
	private int lookup;
	private Date lookuptime;
	private int rank;
	private String img="";
}
