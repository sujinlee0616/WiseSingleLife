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
	
	@RequestMapping("recipe_list.do")
	public String recipe_list(Model model, String category, String keyword) {
		if(category!=null && keyword!=null) {
			model.addAttribute("category","레시피");
			model.addAttribute("keyword","홍초");
			
			List<RecipeVO> list = dao.getRecipeListByTitleSearch(keyword);
			model.addAttribute("list", list);
		}
		
		return "recipe_list";
	}

}
