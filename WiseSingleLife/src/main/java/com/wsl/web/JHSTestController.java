package com.wsl.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wsl.lottemart.LotteMartDAO;
import com.wsl.search.SearchKeywordDAO;
import com.wsl.search.SearchKeywordVO;

@RestController
@RequestMapping("jhs/")
public class JHSTestController {
	
	@Autowired
	private SearchKeywordDAO skdao;
	
	@Autowired
	private LotteMartDAO lmdao;
	
	@RequestMapping("search.do")
	public void jhs_search(String keyword) {
		SearchKeywordVO vo = skdao.getSearchKeywordVO(keyword);
		if(vo.getCodeNo()==0) {
			System.out.println("검색 결과 없음");
		} else {
			System.out.println("codeNo : " + vo.getCodeNo());
			System.out.println("keyword : " + vo.getKeyword());
		}
	}

}
