package com.wsl.product_detail;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MartAllDataVO {
/*
 	PRODUCTCODE    VARCHAR2(4000) 
	NAME           VARCHAR2(4000) 
	PRICE          NUMBER         
	UNITPRICE      VARCHAR2(4000) 
	RATE           NUMBER         
	REVIEWCOUNT    NUMBER         
	LOOKUP         NUMBER         
	LOOKUPTIME     DATE           
	IMG            VARCHAR2(4000)
 */
	private String productcode;
	private String name;
	private int price;
	private String unitprice;
	private double rate;
	private int reviewcount;
	private int lookup;
	private Date lookuptime;
	private String img;
	
}
