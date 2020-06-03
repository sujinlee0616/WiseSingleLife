package com.wsl.recipe2;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.wsl.recipe.RecipeVO;

@RestController
public class RecipeDetailRestController {

	@Autowired
	private RecipeDetailDAO dao;
	
	@RequestMapping("recipe_detail_react_data.do")
	public String recipe_detail(int no) 
	{
		System.out.println("no="+no);
		Map map = new HashMap();
		
		RecipeDetailVO vo=new RecipeDetailVO();
		vo=dao.recipeDetailData(no);
		System.out.println("vo="+vo); 
		
		map.put("no", vo.getNo());
		map.put("title", vo.getTitle());
		map.put("chef", vo.getChef());
		map.put("info1", vo.getInfo1());
		map.put("info2", vo.getInfo2());
		map.put("info3", vo.getInfo3());
		map.put("intro", vo.getContent());
		map.put("recipe", vo.getFoodmake());
		
		return new Gson().toJson(map);
	}
	
}
