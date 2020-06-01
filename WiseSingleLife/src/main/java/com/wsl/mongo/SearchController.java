package com.wsl.mongo;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.util.List;
import java.util.StringTokenizer;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
	@Autowired
	private SearchDAO dao;
	
	@RequestMapping("searchtest_insert.do")
	public String searchtest_insert(String keyword) {
		keyword="라면,만두,떡"; ///////// 임시
		SearchVO vo=new SearchVO();
		vo.setKeyword(keyword);
		dao.searchInsert(vo);
		return "main";
	} 
	
	@RequestMapping("searchtest_select.do")
	public String searchtest_select(String keyword) {
		keyword="라면"; //// 임시
		
		// keyword가 포함된 검색묶음을 가져와서 list에 저장 
		// 라면,김치,치즈  
		List<SearchVO> list=dao.searchListData(keyword);
		
		// "," 잘라서 text에 저장
		// 라면 김치 치즈 
		String text="";
		for(SearchVO vo:list){
			StringTokenizer st=new StringTokenizer(vo.getKeyword(), ",");
			while(st.hasMoreTokens()) {
				text+=st.nextToken()+"\n";
			}
		}
		
		// txt 파일 생성 => R에서 분석하기 위해
		String fileName="c:\\data\\search.txt";
		try {
			/*FileWriter fw=new FileWriter(fileName);
			fw.write(text);
			fw.close();*/
			
			// ANSI로 저장
			OutputStreamWriter out=new OutputStreamWriter(new FileOutputStream(fileName),"MS949");
			out.write(text);
			out.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "main";
	}
}