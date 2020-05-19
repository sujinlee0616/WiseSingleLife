package com.wsl.homeplus;
import java.util.*;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
public class HomePlusVO {
	private String productcode;
	
	//추후 삭제 인스턴스 
	private int codeno;
	
	private String name;
	private int price;
	private String unitprice;
	private int rate;
	private int reviewcount;
	private int lookup;
	private Date lookuptime;
	
	//추후 삭제 인스턴스 
	private int rank;
	private String img;
}
