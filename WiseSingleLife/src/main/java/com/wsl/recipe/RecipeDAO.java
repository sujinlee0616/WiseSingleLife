package com.wsl.recipe;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO {
	
	@Resource(name="recipeMapper")
	private RecipeMapper mapper;
	
	public List<RecipeRecommendVO> getRecipeRecommendListByMname(String mname) {
		return mapper.getRecipeRecommendListByMname(mname);
	}
	
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
	
	public int recipeTitleSearchTotalPage(Map map) {
		return mapper.recipeTitleSearchTotalPage(map);
	}
	
	public int recipeIngredientSearchTotalPage(Map map) {
		return mapper.recipeIngredientSearchTotalPage(map);
	}
	
	public int recipeChefSearchTotalPage(Map map) {
		return mapper.recipeChefSearchTotalPage(map);
	}
	
	public List<RecipeVO> getRecipeListOfRecommend(String keyword){
		return mapper.getRecipeListOfRecommend(keyword);
	}

}
