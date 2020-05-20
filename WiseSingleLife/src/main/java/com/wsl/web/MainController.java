package com.wsl.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.emart.EmartDAO;

@Controller
public class MainController {
	@RequestMapping("main.do")
	public String main_page()
	{
		return "main/main";
	}
	
	@RequestMapping("search.do")
	public String search_page()
	{
		return "search";
	}
}
