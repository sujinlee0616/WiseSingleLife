package com.wsl.search;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface SearchKeywordMapper {
	
	@Select("SELECT COUNT(*) FROM search_keyword WHERE keyword=#{keyword}")
	public int isRegisteredSearchKeyword(String keyword);
	
	@Select("SELECT * FROM search_keyword WHERE keyword=#{keyword}")
	public SearchKeywordVO getSearchKeywordVO(String keyword);
	
	@Insert("INSERT INTO search_keyword VALUES(#{codeno},#{keyword},0,SYSDATE)")
	public void searchKeywordInsert(SearchKeywordVO vo);

}
