package com.wsl.recipe;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface RecipeMapper {
	
	@Select("SELECT * FROM recipe WHERE title LIKE '%'||#{title}||'%'")
	public List<RecipeVO> getRecipeListByTitleSearch(String title);

}
