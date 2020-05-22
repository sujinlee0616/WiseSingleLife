package com.wsl.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface RecipeMapper {
	
	@Select("SELECT * FROM recipe WHERE title LIKE '%'||#{keyword}||'%'")
	public List<RecipeVO> getRecipeListByTitleSearch(String keyword);
	
	@Select("SELECT * FROM recipe WHERE no IN "
			+ "(SELECT rno FROM recipe_keyword_mapper WHERE codeno=("
			+ "SELECT no FROM ingredients WHERE mname LIKE #{keyword}))")
	public List<RecipeVO> getRecipeListByIngredient(String keyword);
	
	@Select("SELECT * FROM recipe WHERE chef LIKE '%'||#{keyword}||'%'")
	public List<RecipeVO> getRecipeListByChef(String keyword);
	
	@Select("SELECT COUNT(*) FROM ingredients WHERE mname LIKE #{keyword}")
	public int isRegisteredIngredient(String keyword);

}
