package com.wsl.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeDAO dao;
	
	@RequestMapping("recipe_react_list.do")
	public String react_recipe_list() {
		return "recipe/react_list";
	}

	@RequestMapping("recipe.do")
	public String recipe_list(Model model, String category, String keyword) {
		if (category != null && keyword != null) {
			model.addAttribute("category", category);
			model.addAttribute("keyword", keyword);
			model.addAttribute("curpage", 1);

			Map map = new HashMap();
			map.put("keyword", keyword);
			map.put("start", 1);
			map.put("end", RecipeConst.ROWSIZE);
			map.put("rowsize", RecipeConst.ROWSIZE);

			switch (category) {
				case "레시피": {
					List<RecipeVO> list = dao.getRecipeListByTitleSearch(map);
					model.addAttribute("list", list);
	
					int totalpage = dao.recipeTitleSearchTotalPage(map);
					model.addAttribute("totalpage", totalpage);
					break;
				}
				case "재료": {
					if (dao.isRegisteredIngredient(keyword) != 0) {
						List<RecipeVO> list = dao.getRecipeListByIngredient(map);
						model.addAttribute("list", list);
	
						int totalpage = dao.recipeIngredientSearchTotalPage(map);
						model.addAttribute("totalpage", totalpage);
	
					} else {
						List<RecipeVO> list = dao.getRecipeListByTitleSearch(map);
						model.addAttribute("list", list);
	
						int totalpage = dao.recipeTitleSearchTotalPage(map);
						model.addAttribute("totalpage", totalpage);
					}
					break;
				}
				case "셰프": {
					List<RecipeVO> list = dao.getRecipeListByChef(map);
					model.addAttribute("list", list);
	
					int totalpage = dao.recipeChefSearchTotalPage(map);
					model.addAttribute("totalpage", totalpage);
					break;
				}
			}
		}

		return "recipe/list";
	}

	@RequestMapping("recipe_more.do")
	public String recipe_more(Model model, String category, int page, String keyword) {
		System.out.println("recipe_more call...");
		int end = RecipeConst.ROWSIZE*page;
		int start = end - RecipeConst.ROWSIZE + 1;
		
		Map map = new HashMap();
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		switch (category) {
			case "레시피": {
				List<RecipeVO> list = dao.getRecipeListByTitleSearch(map);
				model.addAttribute("list", list);
				break;
			}
			case "재료": {
				if (dao.isRegisteredIngredient(keyword) != 0) {
					List<RecipeVO> list = dao.getRecipeListByIngredient(map);
					model.addAttribute("list", list);
	
				} else {
					List<RecipeVO> list = dao.getRecipeListByTitleSearch(map);
					model.addAttribute("list", list);
				}
				break;
			}
			case "셰프": {
				List<RecipeVO> list = dao.getRecipeListByChef(map);
				model.addAttribute("list", list);
				break;
			}
		}

		return "recipe_more";
	}

}
