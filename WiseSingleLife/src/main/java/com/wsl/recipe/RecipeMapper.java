package com.wsl.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface RecipeMapper {
	
	@Select("SELECT DISTINCT * FROM ("
			+ "SELECT * FROM recipe WHERE title LIKE '%'||#{keyword}||'%'"
			+ ") WHERE rownum <= 16")
	public List<RecipeVO> getRecipeListByTitleSearch(Map map);
	
	@Select("SELECT DISTINCT * FROM recipe_ingredient_amount "
			+ "WHERE mname LIKE '%'||#{keyword}||'%'")
	public List<RecipeVO> getRecipeListByIngredient(Map map);
	
	@Select("SELECT DISTINCT * FROM recipe WHERE chef LIKE '%'||#{keyword}||'%'")
	public List<RecipeVO> getRecipeListByChef(Map map);
	
	@Select("SELECT COUNT(*) FROM recipe_ingredient_amount WHERE mname LIKE '%'||#{keyword}||'%'")
	public int isRegisteredIngredient(String keyword);

}
