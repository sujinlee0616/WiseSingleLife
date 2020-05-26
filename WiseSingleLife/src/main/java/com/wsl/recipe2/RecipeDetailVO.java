package com.wsl.recipe2;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecipeDetailVO {
	private int no;
	private String poster;
	private String title;
	private String chef;
	private String chef_poster;
	private String chef_profile;
	private String info1;
	private String info2;
	private String info3;
	private String content;
	private String foodmake;
	
}

/*
 *  NO                    NUMBER         
	POSTER       NOT NULL VARCHAR2(300)  
	TITLE        NOT NULL VARCHAR2(300)  
	CHEF         NOT NULL VARCHAR2(100)  
	CHEF_POSTER  NOT NULL VARCHAR2(200)  
	CHEF_PROFILE NOT NULL VARCHAR2(100)  
	INFO1                 VARCHAR2(20)   
	INFO2                 VARCHAR2(20)   
	INFO3                 VARCHAR2(20)   
	CONTENT      NOT NULL VARCHAR2(4000) 
	FOODMAKE              CLOB           
 */
