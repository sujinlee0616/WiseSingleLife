package com.wsl.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UNGTestController {

	@RequestMapping("graph.do")
	public String temp(){
		
		return "graph";
	}
}
