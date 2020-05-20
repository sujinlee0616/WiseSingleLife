package com.wsl.lottemart;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LotteMartVO {

	private String productCode;		
	private int codeNo;				
	private String name;			
	private int price;				
	private String unitPrice="";		
	private String discountRate="";	
	private String brand="";			
	private int mPurchase=0;			
	private double rate=0.0;			
	private int reviewCount=0;		
	private int lookup;				
	private Date lookuptime;		
	private int rank;				
	private String img="";				
	private int originPrice=0;		
	
}