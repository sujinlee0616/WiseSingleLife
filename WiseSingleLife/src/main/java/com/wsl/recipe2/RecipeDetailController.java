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
	public String recipe_detail(Model model,int no) 
	{
		RecipeDetailVO vo=dao.recipeDetailData(no);
		model.addAttribute("vo",vo);
		System.out.println("vo="+vo); 
		// 문제점) list에는 데이터가 있으나 detail 데이터가 없는 경우가 너무 많음 
		// ==> list에서 그런 애들 보여주지 않도록 처리해줘야 
		
		return "recipe/detail";
	}
}
