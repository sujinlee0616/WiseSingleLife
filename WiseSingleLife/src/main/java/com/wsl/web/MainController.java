package com.wsl.web;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.wsl.product_detail.*;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wsl.emart.EmartDAO;
import com.wsl.mongo.SearchDAO;
import com.wsl.mongo.SearchVO;
import com.wsl.search.SearchKeywordVO;

@EnableAsync
@Controller
public class MainController {
	@Autowired
	private MainDAO maindao;
	
	@Autowired
	private MartAllDataDAO dao;
	@Autowired
	private SearchDAO sdao;
	
	@RequestMapping("main.do")
	public String main_page(Model model)
	{
		List<SearchKeywordVO> list=maindao.getPopularTop10();
		/*wordCloud(list);*/
		
		/*model.addAttribute("list", list);*/
		
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
	
	@RequestMapping("search_react.do")
	public String search_react(Model model, String keyword){
		System.out.println(keyword);
		if(keyword != null){
			model.addAttribute("keyword",keyword);
		}else {
			model.addAttribute("keyword","null");
		}
		return "SearchReact";
	}

	@RequestMapping("detail.do")
	public String detail_page(Model model,String productcode,String codeno){
		System.out.println("codeno값 확인 : "+codeno);
		MartAllDataVO vo = dao.SearchDetail(productcode);	
		List<Detail_RecipeVO> rlist = new ArrayList<Detail_RecipeVO>();
		Detail_SearchKeyVO svo = new Detail_SearchKeyVO();
		String temp=" ";
		boolean RecipeCheck=true;
		// 브랜드 출력
		try{
			if(vo.getName().indexOf(" ") != -1){
				temp = vo.getName().substring(0,vo.getName().indexOf(" "));
			}else if(vo.getName().indexOf("_")!= -1){
				temp =vo.getName().substring(0,vo.getName().indexOf("_"));
			}
			svo = dao.productKeyowrd(codeno);
		}catch(Exception ex){
			System.out.println("확인 : "+ex.getMessage());
			ex.printStackTrace();
			temp ="#";
		}
		System.out.println(temp);
		// 상품 코드와 관련된 전체 상품 수
		try{
			vo.setProductsCount(dao.ProductAllCount(codeno));
			vo.setKeyword(svo.getKeyword());
			vo.setSearchCount(svo.getCount());
			vo.setBrand(temp);
		}catch(Exception ex){
			ex.printStackTrace();
			vo.setProductsCount(1);
			vo.setKeyword("없음");
			vo.setRecipeCount(0);
		}
		try {
		List<Integer> list = dao.rno(codeno);
		for(int i : list){
			Detail_RecipeVO rvo = dao.RecipeList_detail(i);
			rlist.add(rvo);
		}
		System.out.println(rlist.size());
		}catch(Exception ex) {
			RecipeCheck=true;
		}
		model.addAttribute("check",RecipeCheck);
		model.addAttribute("rlist",rlist);
		model.addAttribute("MaData_vo", vo);
		return "search/detail";
	}
	
	
	@Async
	public void wordCloud(List<SearchKeywordVO> list) {
		for(int i=0;i<10;i++) {
			String keyword=list.get(i).getKeyword();
			
			// keyword가 포함된 검색묶음을 가져와서 list에 저장 
			// ["라면","김치","치즈"]
			List<SearchVO> slist=sdao.searchListData(keyword);
			
			/*for(SearchVO vo:slist) {
				System.out.println(vo.getKeyword());
			}*/
			
			
			// 라면 김치 치즈 
			String text="";
			for(SearchVO vo:slist){
				String strKeyword=vo.getKeyword();
				strKeyword=strKeyword.substring(1,strKeyword.lastIndexOf("]"));
				//System.out.println(strKeyword);
				StringTokenizer st=new StringTokenizer(strKeyword, ",");
				while(st.hasMoreTokens()) {
					String temp=st.nextToken();
					temp=temp.substring(1,temp.lastIndexOf("\""));
					text+=temp+"\n";
				}
			}
			
			// txt 파일 생성 => R에서 분석하기 위해
			String fileName="c:\\data\\search.txt";
			try {
				// ANSI로 저장
				OutputStreamWriter out=new OutputStreamWriter(new FileOutputStream(fileName),"MS949");
				out.write(text);
				out.close();
			} catch(Exception ex) {
				ex.printStackTrace();
			}
			
			sdao.rGraph(i+1);
		}
	}
	
}