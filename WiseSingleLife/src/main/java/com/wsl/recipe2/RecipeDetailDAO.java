package com.wsl.recipe2;

import javax.annotation.Resource;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDetailDAO {
	
	@Resource(name="recipeDetailMapper")
	private RecipeDetailMapper mapper;
	
	// 디테일 상세정보 
	public RecipeDetailVO recipeDetailData(int no)
	{
		return mapper.recipeDetailData(no);
	}

}
