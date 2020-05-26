package com.wsl.emart;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.search.*;

import java.util.*;

@Controller
public class EmartController {
	
	@Resource(name="emartDAO")
	private EmartDAO dao;
	@Resource(name="searchKeywordDAO")
	private SearchKeywordDAO skdao;
	
	/*@RequestMapping("search.do")
	public String emart_searchdata(Model model) {
		
		List<EmartVO> emList=new ArrayList<EmartVO>();
		String keyword="¹Ù³ª³ª";
		SearchKeywordVO vo=skdao.getSearchKeywordVO(keyword);
		if(vo.getCodeNo()==0) {
			emList=dao.emartSearchData(keyword);
		}
		else {
			emList=dao.emartSearchData2(vo.getCodeNo());
		}
		
		
		for(EmartVO evo:emList) {
			if(evo.getName().length()>6) {
				evo.setName(evo.getName().substring(0,7));
			}
		}
		model.addAttribute("emList", emList);
		return "search";
	}*/
}
