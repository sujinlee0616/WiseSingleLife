package com.wsl.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO {
	
	@Autowired
	private RecipeMapper mapper;
	
	public List<RecipeVO> getRecipeListByTitleSearch(String title) {
		return mapper.getRecipeListByTitleSearch(title);
	}

}
