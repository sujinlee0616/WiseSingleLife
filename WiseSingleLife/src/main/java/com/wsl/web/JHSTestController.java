package com.wsl.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wsl.lottemart.LotteMartDAO;
import com.wsl.lottemart.LotteMartVO;
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
			System.out.println("keyword : " + keyword);
			System.out.println("==================================");
			
			List<LotteMartVO> list = lmdao.getLotteMartVOListByKeyword(keyword);
			for(LotteMartVO lmvo : list) {
				System.out.println(lmvo.getRank() + " " + lmvo.getBrand() + " " + lmvo.getName());
			}
			System.out.println("==================================");
		} else {
			System.out.println("codeNo : " + vo.getCodeNo());
			System.out.println("keyword : " + vo.getKeyword());
			System.out.println("==================================");
			
			List<LotteMartVO> list = lmdao.getLotteMartVOListByCodeNo(vo.getCodeNo());
			for(LotteMartVO lmvo : list) {
				System.out.println(lmvo.getRank() + " " + lmvo.getBrand() + " " + lmvo.getName());
			}
			System.out.println("==================================");
		}
	}

}
