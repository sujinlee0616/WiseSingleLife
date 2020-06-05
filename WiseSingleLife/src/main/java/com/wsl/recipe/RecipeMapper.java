package com.wsl.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface RecipeMapper {
	
	@Select("SELECT DISTINCT no,poster,title,mname from recipe_ingredient_amount"
			+ " WHERE mname=#{mname}")
	public List<RecipeRecommendVO> getRecipeRecommendListByMname(String mname);
	
	@Select("SELECT no, title, poster, chef FROM ("
			+ "SELECT rownum AS num, no, title, poster, chef FROM recipe_view "
			+ "WHERE title like '%'||#{keyword}||'%') "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> getRecipeListByTitleSearch(Map map);
	
	@Select("SELECT no, title, poster, chef, mname, imgsrc, amount FROM ("
			+ "SELECT rownum AS num, no, title, poster, chef, mname, imgsrc, amount "
			+ "FROM recipe_ingredient_amount "
			+ "WHERE mname like '%'||#{keyword}||'%') "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> getRecipeListByIngredient(Map map);
	
	@Select("SELECT no, title, poster, chef FROM ("
			+ "SELECT rownum AS num, no, title, poster, chef FROM recipe_view "
			+ "WHERE chef like '%'||#{keyword}||'%') "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<RecipeVO> getRecipeListByChef(Map map);
	
	@Select("SELECT COUNT(*) FROM recipe_ingredient_amount WHERE mname LIKE '%'||#{keyword}||'%'")
	public int isRegisteredIngredient(String keyword);
	
	@Select("SELECT CEIL(COUNT(*)/#{rowsize}) FROM recipe_view "
			+ "WHERE title like '%'||#{keyword}||'%'")
	public int recipeTitleSearchTotalPage(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/#{rowsize}) FROM recipe_ingredient_amount "
			+ "WHERE mname like '%'||#{keyword}||'%'")
	public int recipeIngredientSearchTotalPage(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/#{rowsize}) FROM recipe_view "
			+ "WHERE chef like '%'||#{keyword}||'%'")
	public int recipeChefSearchTotalPage(Map map);
	
	@Select("SELECT Distinct(no), title, poster,mname FROM " + 
			"Recipe_ingredient_amount WHERE mname = '#{keyword}' AND title like '%'||#{keyword}||'% '")
	public List<RecipeVO> getRecipeListOfRecommend(String keyword);

}
