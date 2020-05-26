package com.wsl.web;

import org.apache.ibatis.annotations.Select;

import com.wsl.search.SearchKeywordVO;

import java.util.*;

public interface MainMapper {

	@Select("SELECT * "
		   +"FROM (SELECT * FROM search_keyword "
		   +"ORDER BY count DESC) "
		   +"WHERE rownum<=10")
	public List<SearchKeywordVO> getPopularTop10();
}
