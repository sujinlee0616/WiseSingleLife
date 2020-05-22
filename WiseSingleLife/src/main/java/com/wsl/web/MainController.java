package com.wsl.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.emart.EmartDAO;

@Controller
public class MainController {
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
	
	@RequestMapping("board.do")
	public String board_list()
	{
		return "board/list";
	}
		
	@RequestMapping("aaa.do")
	public String search_react(){
		return "searchReact";
	}

	@RequestMapping("search/detail.do")
	public String detail_page(){
	
		return "search/detail";
	}
}