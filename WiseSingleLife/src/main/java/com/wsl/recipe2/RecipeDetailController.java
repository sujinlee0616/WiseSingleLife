package com.wsl.recipe2;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeDetailController {
	
	/*@Autowired
	private RecipeDAO dao;*/
	
	@RequestMapping("recipe_detail.do")
	public String recipe_detail() {
		
		return "recipe/detail";
	}
}
