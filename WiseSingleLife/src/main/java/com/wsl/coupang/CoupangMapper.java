package com.wsl.coupang;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wsl.search.SearchKeywordVO;
import java.util.*;

public interface CoupangMapper {

	@Select("SELECT * FROM search_keyword")
	public List<SearchKeywordVO> keywordAllData();
	
	@Insert("INSERT INTO coupang("
			+"PRODUCTCODE,TAGS,NAME,"
			+"PRICE,UNITPRICE,RATE,REVIEWCOUNT,DISCOUNTRATE,"
			+"IMG )"
		+"VALUES( "
			+"#{productCode}"
			+",#{tags}"
			+",#{name}"
			+",#{baseprice}"
			+",#{unitprice}"
			+",#{rate}"
			+",#{reviewcount}"
			+",#{discount}"
			+",#{img})"
		)
	public void InsertCoupang(CoupangVO vo);
	
	@Insert("INSERT INTO keyword_mart_mapper VALUES(#{codeNo},#{productCode},#{rank})")
	public void keywordMartMapperInsert(CoupangVO vo);
		
}
