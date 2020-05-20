package com.wsl.coupang;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wsl.search.SearchKeywordVO;
import com.wsl.vo.*;
import java.util.*;

public interface CoupangMapper {

	@Select("SELECT * FROM search_keyword")
	public List<SearchKeywordVO> keywordAllData();
	
	@Insert("INSERT INTO coupang("
			+"PRODUCTCODE,TAGS,CODENO,RANK,NAME,"
			+"BASEPRICE,UNITPRICE,RATE,REVIEWCOUNT,DISCOUNT,"
			+"IMG )"
		+"VALUES( "
			+"#{productCode}"
			+",#{tags}"
			+",#{codeNo}"
			+",#{rank}"
			+",#{name}"
			+",#{basePrice}"
			+",#{unit_price}"
			+",#{rate}"
			+",#{review_count}"
			+",#{discount}"
			+",#{img}"
		)
	public void InsertCoupang(CoupangVO vo);
		
}
