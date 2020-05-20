package com.wsl.web;

import java.util.List;

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
	public void CWH_search(String keyword) {
		
		SearchKeywordVO vo = skdao.getSearchKeywordVO(keyword);
		
		if(vo.getCodeNo()==0) {
			System.out.println("keyword : " + keyword);
			System.out.println("==================================");
			
			List<HomePlusVO> list = hpdao.getHomePlusDataFromMapperByKeyword(keyword);
			for(HomePlusVO hpvo : list) {
				System.out.println(hpvo.getRank() + " "+hpvo.getName());
			}
			System.out.println("==================================");
		} else {
			System.out.println("codeNo : " + vo.getCodeNo());
			System.out.println("keyword : " + vo.getKeyword());
			System.out.println("==================================");
			
			double average = hpdao.getHomePlusAverageByReviewCount(vo.getCodeNo());
			List<HomePlusVO> list = hpdao.getHomePlusDataFromMapperByCodeNo(vo.getCodeNo());
			for(HomePlusVO hpvo : list) {
				
				System.out.println(hpvo.getRank() + " " + hpvo.getName()+"리뷰숫자 "+hpvo.getReviewcount());
			}
			System.out.println("==================================");
			System.out.println("이 그룹의 평균은 = " + average);
		}
	}


}
