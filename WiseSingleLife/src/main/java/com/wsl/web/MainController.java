package com.wsl.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.wsl.product_detail.*;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.emart.EmartDAO;

@Controller
public class MainController {
	
	@Autowired
	private MartAllDataDAO dao;
	
	@RequestMapping("main.do")
	public String main_page()
	{
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
	public String search_react(){
		return "searchReact";
	}

	@RequestMapping("detail.do")
	public String detail_page(Model model,String productcode){
		MartAllDataVO vo = dao.SearchDetail(productcode);
		
		model.addAttribute("MaData_vo", vo);
		return "search/detail";
	}
	
}