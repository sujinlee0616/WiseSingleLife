package com.wsl.recipe;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Vector;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.wsl.mongo.SearchVO;

@RestController
public class RecipeRestController {
	
	@Autowired
	private RecipeDAO dao;
	
	@RequestMapping("jhsRecommend.do")
	public String jhsRecommend(String keyword) {	
		List<RecipeRecommendVO> totalList = new ArrayList<RecipeRecommendVO>();
		
		String keywords="";
		try {
			keywords = URLDecoder.decode(keyword,"UTF-8");
		} catch (UnsupportedEncodingException e) {}
		keywords = keywords.replaceAll("[\\[\\]\"]", "");
		
		String[] mnames = keywords.split(",");
		for(String mname : mnames) {
			List<RecipeRecommendVO> list = dao.getRecipeRecommendListByMname(mname);
			if(totalList.size()==0) {
				totalList = list;
			} else {
				adding : for(RecipeRecommendVO adding : list) {
					for(RecipeRecommendVO origin : totalList) {
						if(origin.getNo()==adding.getNo()) {
							origin.setMname(origin.getMname()+","+adding.getMname());
							origin.setCount(origin.getCount()+1);
							continue adding;
						}
					}
					totalList.add(adding);
				}
			}
		}
		
		Vector<RecipeRecommendVO> result = new Vector<RecipeRecommendVO>();
		for(RecipeRecommendVO vo : totalList) { 
			if(vo.getTitle().contains(mnames[0]))
				result.add(vo);
		}
		
		Collections.sort(result);
		return new Gson().toJson(result);
	}
	
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

		return new Gson().toJson(map);
	}
	
	@RequestMapping("recipeRecommend.do")
	public String recipeRecommend(String keyword) throws UnsupportedEncodingException {
		String result="";
		
		List<RecipeVO> recipelist = new ArrayList<RecipeVO>();
		ArrayList<String> strlist = new ArrayList<String>();
		
		String decodedString = URLDecoder.decode(keyword, "UTF-8");
		//System.out.println(decodedString);
		
		decodedString = decodedString.substring(1,decodedString.lastIndexOf("]"));
		StringTokenizer st = new StringTokenizer(decodedString,",");
		while(st.hasMoreTokens()) {
			String temp = st.nextToken();
			//System.out.println(temp);
			strlist.add(temp);
		}
		for(int i=0; i<=strlist.size();i++){
			recipelist = dao.getRecipeListOfRecommend(strlist.get(i));
			recipelist.addAll(recipelist);
		}

		
		return result;
	}

}
