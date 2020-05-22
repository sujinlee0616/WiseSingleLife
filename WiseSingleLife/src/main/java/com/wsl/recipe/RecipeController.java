package com.wsl.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeDAO dao;
	
	@RequestMapping("recipe.do")
	public String recipe_list(Model model, String category, String keyword) {
		if(category!=null && keyword!=null) {
			model.addAttribute("category",category);
			model.addAttribute("keyword",keyword);
			
			switch (category) {
				case "레시피" : {
					List<RecipeVO> list = dao.getRecipeListByTitleSearch(keyword);
					model.addAttribute("list", list);					
					break;
				}
				case "재료" : {
					if(dao.isRegisteredIngredient(keyword)==1) {
						List<RecipeVO> list = dao.getRecipeListByIngredient(keyword);
						model.addAttribute("list", list);
					} else {
						List<RecipeVO> list = dao.getRecipeListByTitleSearch(keyword);
						model.addAttribute("list", list);
					}
					break;
				}
				case "셰프" : {
					List<RecipeVO> list = dao.getRecipeListByChef(keyword);
					model.addAttribute("list", list);					
					break;
				}
			}
		}
		
		return "recipe/list";
	}

}
