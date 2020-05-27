package com.wsl.recipe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
public class RecipeRestController {
	
	@Autowired
	private RecipeDAO dao;
	
	@RequestMapping("recipe/search.do")
	public String recipe_search(String category, int page, String keyword) {
		int end = RecipeConst.ROWSIZE*page;
		int start = end - RecipeConst.ROWSIZE + 1;
		
		Map map = new HashMap();
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("rowsize", RecipeConst.ROWSIZE);
		
		int totalpage = 0;
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		
		switch (category) {
			case "레시피": {
				totalpage = dao.recipeTitleSearchTotalPage(map);
				list = dao.getRecipeListByTitleSearch(map);
				break;
			}
			case "재료": {
				if (dao.isRegisteredIngredient(keyword) != 0) {
					totalpage = dao.recipeIngredientSearchTotalPage(map);
					list = dao.getRecipeListByIngredient(map);
	
				} else {
					totalpage = dao.recipeTitleSearchTotalPage(map);
					list = dao.getRecipeListByTitleSearch(map);
				}
				break;
			}
			case "셰프": {
				totalpage = dao.recipeChefSearchTotalPage(map);
				list = dao.getRecipeListByChef(map);
				break;
			}
		}
		
		map.clear();
		map.put("totalpage", totalpage);
		map.put("list", list);
		
		System.out.println(new Gson().toJson(map));

		return new Gson().toJson(map);
	}

}
