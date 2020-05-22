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
	
	@RequestMapping("recipe.do")
	public String recipe_list(Model model, String category, String keyword) {
		if(category!=null && keyword!=null) {
			model.addAttribute("category",category);
			model.addAttribute("keyword",keyword);
			
			switch (category) {
				case "레시피" : {
					Map map = new HashMap();
					map.put("keyword", keyword);
					map.put("start", 1);
					map.put("end", RecipeConst.ROWSIZE);
					
					List<RecipeVO> list = dao.getRecipeListByTitleSearch(map);
					model.addAttribute("list", list);					
					break;
				}
				case "재료" : {
					if(dao.isRegisteredIngredient(keyword)!=0) {
						Map map = new HashMap();
						map.put("keyword", keyword);
						map.put("start", 1);
						map.put("end", RecipeConst.ROWSIZE);
						
						List<RecipeVO> list = dao.getRecipeListByIngredient(map);
						model.addAttribute("list", list);
					} else {
						Map map = new HashMap();
						map.put("keyword", keyword);
						map.put("start", 1);
						map.put("end", RecipeConst.ROWSIZE);
						
						List<RecipeVO> list = dao.getRecipeListByTitleSearch(map);
						model.addAttribute("list", list);
					}
					break;
				}
				case "셰프" : {
					Map map = new HashMap();
					map.put("keyword", keyword);
					map.put("start", 1);
					map.put("end", RecipeConst.ROWSIZE);
					
					List<RecipeVO> list = dao.getRecipeListByChef(map);
					model.addAttribute("list", list);					
					break;
				}
			}
		}
		
		return "recipe/list";
	}

}
