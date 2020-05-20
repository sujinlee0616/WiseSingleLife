package com.wsl.crawling;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface EmartMapper {
	
	// search_keyword
	@Select("SELECT * FROM search_keyword")
	public List<SearchKeywordVO> searchKeywordData();
	
	// insert
	@Insert("INSERT INTO emart VALUES("
		   +"#{productcode},#{codeno},#{name},#{price},#{unitprice},"
		   +"#{rate},#{reviewcount},#{tags},0,SYSDATE,"
		   +"#{rank},#{img})")
	public void insertEmartData(EmartVO vo);
}
