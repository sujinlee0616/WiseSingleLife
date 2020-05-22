package com.wsl.recipe;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO {
	
	@Resource(name="recipeMapper")
	private RecipeMapper mapper;
	
	public List<RecipeVO> getRecipeListByTitleSearch(String keyword) {
		return mapper.getRecipeListByTitleSearch(keyword);
	}
	
	public List<RecipeVO> getRecipeListByIngredient(String keyword) {
		return mapper.getRecipeListByIngredient(keyword);
	}
	
	public List<RecipeVO> getRecipeListByChef(String keyword) {
		return mapper.getRecipeListByChef(keyword);
	}
	
	public int isRegisteredIngredient(String keyword) {
		return mapper.isRegisteredIngredient(keyword);
	}

}
