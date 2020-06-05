package com.wsl.recipe;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
public class RecipeRecommendVO implements Comparable {
	
	private int no;
	private String poster;
	private String title;
	private String mname;
	private int count = 1;
	
	public int compareTo(Object o) {
		int sub = this.count - ((RecipeRecommendVO) o).count;
		
		if(sub>0) {
			return -1;
		} else if(sub<0) {
			return 1;
		} else {
			return 0;
		}
	}

}
