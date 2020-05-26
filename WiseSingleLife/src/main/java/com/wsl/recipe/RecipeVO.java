package com.wsl.recipe;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecipeVO {
	
	private int no;
	private String title;
	private String poster;
	private String chef;
	private String link;
	
	// 재료 관련
	private String mname;	// 레시피가 포함하고 있는 재료 이름
	private String imgsrc;	// 재료 이미지
	private String amount;	// 재료 계량

}
