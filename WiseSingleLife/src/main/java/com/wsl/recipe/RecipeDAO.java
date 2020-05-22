package com.wsl.recipe;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO {
	
	@Resource(name="recipeMapper")
	private RecipeMapper mapper;
	
	public List<RecipeVO> getRecipeListByTitleSearch(Map map) {
		return mapper.getRecipeListByTitleSearch(map);
	}
	
	public List<RecipeVO> getRecipeListByIngredient(Map map) {
		return mapper.getRecipeListByIngredient(map);
	}
	
	public List<RecipeVO> getRecipeListByChef(Map map) {
		return mapper.getRecipeListByChef(map);
	}
	
	public int isRegisteredIngredient(String keyword) {
		return mapper.isRegisteredIngredient(keyword);
	}

}
