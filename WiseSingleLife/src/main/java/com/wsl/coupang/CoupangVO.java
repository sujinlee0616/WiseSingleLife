package com.wsl.coupang;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CoupangVO {

	private String productCode;
	private String name;
	private int price=0;
	private String unitprice="";
	private String quantity="";
	private String discountrate="";
	private double rate=0.0;
	private int reviewcount=0;
	private String tags="";
	private int lookup;
	private Date lookuptime;
	private String img="";
	
	private int codeNo;
	private int rank;
	
}
