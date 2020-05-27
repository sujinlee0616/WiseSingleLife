package com.wsl.recipe2;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeDetailController {

	@Autowired
	private RecipeDetailDAO dao;
	
	@RequestMapping("recipe_detail.do")
	public String recipe_detail(Model model, String no) 
	{
		
		RecipeDetailVO vo=dao.recipeDetailData(Integer.parseInt(no));
		model.addAttribute("vo",vo);
		System.out.println("vo="+vo); // null값
		
		return "recipe/detail";
	}
}
