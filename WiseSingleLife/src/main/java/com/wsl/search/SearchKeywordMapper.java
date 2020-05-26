package com.wsl.search;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

@Component
public interface SearchKeywordMapper {
	
	@Select("SELECT COUNT(*) FROM search_keyword WHERE keyword=#{keyword}")
	public int isRegisteredSearchKeyword(String keyword);
	
	@Select("SELECT * FROM search_keyword WHERE keyword=#{keyword}")
	public SearchKeywordVO getSearchKeywordVO(String keyword);
	
	@SelectKey(keyProperty="codeNo",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(codeno)+1,1) AS codeno FROM search_keyword")
	@Insert("INSERT INTO search_keyword VALUES(#{codeNo},#{keyword},0,SYSDATE)")
	public void searchKeywordInsert(SearchKeywordVO skvo);
	
	@Update("UPDATE search_keyword SET count=count+1 WHERE codeno=#{codeno}")
	public void searchKeywordCountIncrement(int codeno);

}
