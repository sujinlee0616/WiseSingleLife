package com.wsl.coupang;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wsl.emart.EmartVO;
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
	
	
	@Select("SELECT a.rank, b.* FROM keyword_mart_mapper a, coupang b"
			+ " WHERE a.codeno=#{codeno} AND a.productcode=b.productcode"
			+ " ORDER BY rank ASC")
	public List<CoupangVO> getCoupangVOListByCodeNo(int codeNo);
	
	@Select("SELECT a.*, RANK() OVER(ORDER BY score DESC, a.price ASC) AS rank"
			+ " FROM (SELECT coupang.*, rate*log(10,reviewcount+1) AS score"
			+ " FROM coupang WHERE name LIKE '%'||#{keyword}||'%') a")
	public List<CoupangVO> getCoupangVOListByKeyword(String keyword);
		
}
