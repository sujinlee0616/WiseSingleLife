package com.wsl.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.wsl.product_detail.*;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.emart.EmartDAO;
import com.wsl.search.SearchKeywordVO;

@Controller
public class MainController {
	@Autowired
	private MainDAO maindao;
	
	@Autowired
	private MartAllDataDAO dao;
	
	@RequestMapping("main.do")
	public String main_page(Model model)
	{
		List<SearchKeywordVO> list=maindao.getPopularTop10();
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@RequestMapping("search.do")
	public String search_page()
	{
		return "search";
	}
	
	/*@RequestMapping("board.do")	
	public String board_list()	
	{	
		return "board/list";	
	}*/
	
	@RequestMapping("aaa.do")
	public String search_react(Model model, String keyword){
		
		model.addAttribute("keyword", keyword);
		return "searchReact";
	}

	@RequestMapping("detail.do")
	public String detail_page(Model model,String productcode){
		MartAllDataVO vo = dao.SearchDetail(productcode);	
		Detail_SearchKeyVO svo = new Detail_SearchKeyVO();
		String temp=" ";
		// 브랜드 출력
		try{
			if(vo.getName().indexOf(" ") != -1){
				temp = vo.getName().substring(0,vo.getName().indexOf(" "));
			}else if(vo.getName().indexOf("_")!= -1){
				temp =vo.getName().substring(0,vo.getName().indexOf("_"));
			}
			svo = dao.productKeyowrd(productcode);
		}catch(Exception ex){
			temp ="#";
		}
		System.out.println(temp);
		// 상품 코드와 관련된 전체 상품 수
		try{
			vo.setProductsCount(dao.ProductAllCount(productcode));
			vo.setKeyword(svo.getKeyword());
			vo.setSearchCount(svo.getCount());
			vo.setBrand(temp);
		}catch(Exception ex){
			ex.printStackTrace();
			vo.setProductsCount(1);
			vo.setKeyword("없음");
			vo.setRecipeCount(0);
		}
		List<Integer> list = dao.rno();
		for(int i : list){
			System.out.println(i);
		}
		model.addAttribute("MaData_vo", vo);
		return "search/detail";
	}
	
}