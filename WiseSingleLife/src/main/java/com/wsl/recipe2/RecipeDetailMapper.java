package com.wsl.recipe2;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface RecipeDetailMapper {

	// 레시피 상세정보 
	@Select("SELECT * FROM recipe_detail WHERE no=#{no}")
	public RecipeDetailVO recipeDetailData(int no);
}
