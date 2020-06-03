package com.wsl.mongo;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.StringTokenizer;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
	@Autowired
	private SearchDAO dao;
	
	@RequestMapping("searchtest_insert.do")
	public String searchtest_insert(String keyword) throws UnsupportedEncodingException {
		
		//System.out.println("keyword"+keyword);
        String decodedString = URLDecoder.decode(keyword, "UTF-8");
        //System.out.println("decodedString:"+decodedString);
		//keyword="라면,만두,떡"; ///////// 임시

		SearchVO vo=new SearchVO();
		vo.setKeyword(decodedString);
		dao.searchInsert(vo);

		return "main";
	} 
	
	@RequestMapping("searchtest_select.do")
	public String searchtest_select(String keyword) {
		keyword="포도"; //// 임시
		
		// keyword가 포함된 검색묶음을 가져와서 list에 저장 
		// ["라면","김치","치즈"]
		List<SearchVO> list=dao.searchListData(keyword);
		
		/*for(SearchVO vo:list) {
			System.out.println(vo.getKeyword());
		}*/
		
		
		// 라면 김치 치즈 
		String text="";
		for(SearchVO vo:list){
			String strKeyword=vo.getKeyword();
			strKeyword=strKeyword.substring(1,strKeyword.lastIndexOf("]"));
			System.out.println(strKeyword);
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
		
//		rGraph(1);
		
		return "main";
	}
	
	
	
}