package com.wsl.emart;

import org.apache.ibatis.annotations.Select;
import java.util.*;

public interface EmartMapper {
	
	@Select("SELECT img,name,price,unitprice,num "
		   +"FROM (SELECT img,name,price,unitprice,rownum as num "
		   +"FROM emart WHERE name LIKE '%'||#{keyword}||'%') "
		   +"WHERE num BETWEEN 1 AND 3")
	public List<EmartVO> emartSearchData(String keyword); 
	
	/*
	 * SELECT * FROM emart,
(SELECT * FROM keyword_mart_mapper
WHERE codeno=116 AND productcode LIKE 'em%'
AND rank<=10
ORDER BY rank) km
WHERE emart.productcode=km.productcode;
	 */
	@Select("SELECT * FROM emart, "
			+ "(SELECT * FROM keyword_mart_mapper "
			+ "WHERE codeno=#{codeno} AND productcode LIKE 'em%' "
			+ "AND rank<=10 "
			+ "ORDER BY rank) km "
			+ "WHERE emart.productcode=km.productcode")
	public List<EmartVO> emartSearchData2(int codeno);
	
}
