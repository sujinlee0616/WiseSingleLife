package com.wsl.product_detail;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.wsl.product_detail.*;
public interface MartAllDataMapper {

	/*
	 	마트별 상품 정보
	 */
	@Select("SELECT * FROM emart "
		   +"WHERE productcode like '%'||#{productcode}")
	public MartAllDataVO EmartDetail(String productcode);
	
	@Select("SELECT * FROM coupang "
			   +"WHERE productcode like '%'||#{productcode}")
	public MartAllDataVO CoupangDetail(String productcode);
	
	@Select("SELECT * FROM homeplus "
			   +"WHERE productcode like '%'||#{productcode}")
	public MartAllDataVO HomeplusDetail(String productcode);
	
	@Select("SELECT * FROM lottemart "
			   +"WHERE productcode like '%'||#{productcode}")
	public MartAllDataVO LotteMartDetail(String productcode);
	/*
	 	===========================================================
	 */
	// 총 상품 수 (keyword 관련)
	@Select("SELECT count(*) FROM keyword_mart_mapper "+
			"where codeno =#{codno}")
	public int ProductAllCount(String productcode);
	
	//키워드 (keyword)
	@Select("SELECT * FROM search_keyword "+
			"where codeno =#{codeno}")
	public Detail_SearchKeyVO ProductKeyword(String productcode);
	// 레시피 관련 정보
	@Select("SELECT count(*) from recipe_keyword_mapper "
		  + "WHERE codeno=#{codeno}")
	public int RecipeCount(String productcode);
	//
	@Select("SELECT rno from recipe_keyword_mapper "
		  + "WHERE codeno = #{codeno} and rownum <4")
	public List<Integer> RnoList(String productcode);
	
	@Select("SELECT * FROM recipe "
		   +"WHERE no =#{no}")
	public Detail_RecipeVO RecipeList_detail(int no);
}
