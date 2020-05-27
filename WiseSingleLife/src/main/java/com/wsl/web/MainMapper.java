package com.wsl.web;

import org.apache.ibatis.annotations.Select;

import com.wsl.search.SearchKeywordVO;

import java.util.*;

public interface MainMapper {

	// search_keyword 테이블에서 count 높은 순으로 가져오는 방식 ==> 계속 누적돼서 테스트용으로 사용한 "시금치"가 제일 많음
	/*@Select("SELECT * "
		   +"FROM (SELECT * FROM search_keyword "
		   +"ORDER BY count DESC, datetime DESC) "
		   +"WHERE rownum<=10")
	public List<SearchKeywordVO> getPopularTop10();*/
	
	// search_count 테이블에서 일주일동안 제일 많이 검색한 키워드를 가져오는 방식
	@Select("SELECT keyword,count "
		   +"FROM (SELECT keyword,COUNT(*) as count FROM (SELECT * FROM search_count WHERE regdate BETWEEN SYSDATE-7 AND SYSDATE) "
		   +"GROUP BY keyword "
		   +"ORDER BY COUNT(*) DESC) "
		   +"WHERE rownum <=10")
	public List<SearchKeywordVO> getPopularTop10();
}
