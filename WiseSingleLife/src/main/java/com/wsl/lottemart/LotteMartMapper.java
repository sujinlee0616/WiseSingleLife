package com.wsl.lottemart;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Component
public interface LotteMartMapper {
	
	@Select("SELECT a.rank, b.* FROM keyword_mart_mapper a, lottemart b"
			+ " WHERE a.codeno=#{codeno} AND a.productcode=b.productcode"
			+ " ORDER BY rank ASC")
	public List<LotteMartVO> getLotteMartVOListByCodeNo(int codeNo);
	
	@Select("SELECT a.*, RANK() OVER(ORDER BY score DESC, a.price ASC) AS rank"
			+ " FROM (SELECT lottemart.*, rate*log(10,reviewcount+1) AS score"
			+ " FROM lottemart WHERE name LIKE '%'||#{keyword}||'%') a")
	public List<LotteMartVO> getLotteMartVOListByKeyword(String keyword);
	
	@Insert("INSERT INTO keyword_mart_mapper VALUES(#{codeNo},#{productCode},#{rank})")
	public void keywordMartMapperInsert(LotteMartVO vo);
	
	@Insert("INSERT INTO lottemart VALUES(#{productCode},#{name},#{price},#{unitPrice},"
			+ "#{discountRate},#{brand},#{mPurchase},#{rate},#{reviewCount},0,"
			+ "SYSDATE,#{img},#{originPrice})")
	public void lotteMartInsert(LotteMartVO vo);

}
