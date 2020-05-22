package com.wsl.web;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wsl.homeplus.*;
import com.wsl.search.SearchKeywordDAO;
import com.wsl.search.SearchKeywordVO;

@RestController
@RequestMapping("hp/")
public class CWHTestController {
	
	@Autowired
	private HomePlusDAO hpdao;
	
	@Autowired
	private SearchKeywordDAO skdao;
	
	
	@RequestMapping("search.do")
	public String CWH_search(String keyword) {
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
		return result;
	}
}
