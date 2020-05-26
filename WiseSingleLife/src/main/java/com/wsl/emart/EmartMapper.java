package com.wsl.emart;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wsl.lottemart.LotteMartVO;

import java.util.*;

public interface EmartMapper {
	
	// ============================= ũ�Ѹ� ==================================
	
	// search_keyword
	@Select("SELECT * FROM search_keyword")
	public List<SearchKeywordVO> searchKeywordData();
	
	// insert
	@Insert("INSERT INTO emart VALUES("
		   +"#{productcode},#{name},#{price},#{unitprice},"
		   +"#{rate},#{reviewcount},#{tags},0,SYSDATE,"
		   +"#{img})")
	public void insertEmartData(EmartVO vo);
	
	//  ===================================================================
	
	/*@Select("SELECT img,name,price,unitprice,num "
		   +"FROM (SELECT img,name,price,unitprice,rownum as num "
		   +"FROM emart WHERE name LIKE '%'||#{keyword}||'%') "
		   +"WHERE num BETWEEN 1 AND 3")
	public List<EmartVO> emartSearchData(String keyword);*/ 
	
	
	/*@Select("SELECT * FROM emart, "
			+ "(SELECT * FROM keyword_mart_mapper "
			+ "WHERE codeno=#{codeno} AND productcode LIKE 'em%' "
			+ "AND rank<=10 "
			+ "ORDER BY rank) km "
			+ "WHERE emart.productcode=km.productcode")
	public List<EmartVO> emartSearchData2(int codeno);*/
	
	@Insert("INSERT INTO keyword_mart_mapper VALUES(#{codeno},#{productcode},#{rank})")
	public void keywordMartMapperInsert(EmartVO vo);
	
	
	@Select("SELECT a.rank, b.* FROM keyword_mart_mapper a, emart b"
			+ " WHERE a.codeno=#{codeno} AND a.productcode=b.productcode"
			+ " ORDER BY rank ASC")
	public List<EmartVO> getEmartVOListByCodeNo(int codeNo);
	
	@Select("SELECT a.*, RANK() OVER(ORDER BY score DESC, a.price ASC) AS rank"
			+ " FROM (SELECT emart.*, rate*log(10,reviewcount+1) AS score"
			+ " FROM emart WHERE name LIKE '%'||#{keyword}||'%') a")
	public List<EmartVO> getEmartVOListByKeyword(String keyword);
	
}
