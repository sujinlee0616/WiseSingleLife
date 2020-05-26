package com.wsl.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.emart.EmartDAO;
import com.wsl.search.SearchKeywordVO;

@Controller
public class MainController {
	@Autowired
	private MainDAO dao;
	
	@RequestMapping("main.do")
	public String main_page(Model model)
	{
		List<SearchKeywordVO> list=dao.getPopularTop10();
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
	public String search_react(){
		return "searchReact";
	}

	@RequestMapping("detail.do")
	public String detail_page(){
	
		return "search/detail";
	}
	
}