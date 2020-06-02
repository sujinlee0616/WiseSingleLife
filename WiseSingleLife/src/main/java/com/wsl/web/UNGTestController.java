package com.wsl.web;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.homeplus.*;
import com.wsl.search.*;

@Controller
public class UNGTestController {
	
	@Autowired
	private SearchKeywordDAO skdao;
	@Autowired
	private HomePlusDAO hpdao;
	@RequestMapping("graph.do")
	public String temp(String keyword,Model model){
		
		String result="";
		if(keyword==null){
			keyword="시금치";
			result = "NOKEYWORD";
		}else{
		SearchKeywordVO vo = skdao.getSearchKeywordVO(keyword);
		
		List<HomePlusVO> list = new ArrayList<HomePlusVO>();
		
		if(vo.getCodeNo()==0) {
			System.out.println("keyword : " + keyword);
			System.out.println("==================================");
			
			list = hpdao.getHomePlusDataFromMapperByKeyword(keyword);
			for(HomePlusVO hpvo : list) {
				System.out.println(hpvo.getRank() + " "+hpvo.getName());
			}
			System.out.println("==================================");
			} else {
			System.out.println("codeNo : " + vo.getCodeNo());
			System.out.println("keyword : " + vo.getKeyword());
			System.out.println("==================================");
			
			double average = hpdao.getHomePlusAverageByReviewCount(vo.getCodeNo());
			
			list = hpdao.getHomePlusDataFromMapperByCodeNo(vo.getCodeNo());
			for(HomePlusVO hpvo : list) {
				
				System.out.println(hpvo.getRank() + " " + hpvo.getName()+"리뷰숫자 "+hpvo.getReviewcount());
			}
			System.out.println("==================================");
			System.out.println("이 그룹의 평균은 = " + average);
		}
		
			JSONArray arr = new JSONArray();
			
			for(HomePlusVO hpvo:list){
				JSONObject json = new JSONObject();
				json.put("productcode", hpvo.getProductcode());
				//json.put("codeno", vo.getCodeNo());
				json.put("name", hpvo.getName());
				json.put("price", hpvo.getPrice());
				json.put("unitprice", hpvo.getUnitprice());
				json.put("rate", hpvo.getRate());
				json.put("reviewcount", hpvo.getReviewcount());
				json.put("lookup", hpvo.getLookup());
				json.put("lookuptime", hpvo.getLookuptime());
				json.put("img", hpvo.getImg());
				
				arr.add(json);
			}
			result = arr.toJSONString();
			}
		System.out.println(result);
		String test="고구마";
		model.addAttribute("test",test);
		model.addAttribute("result",result);
		
		return "search/TestGraph";
	}
}
