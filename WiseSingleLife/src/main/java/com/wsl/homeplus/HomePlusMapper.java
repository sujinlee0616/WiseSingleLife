package com.wsl.homeplus;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.*;


@Component
public interface HomePlusMapper {

	@Select("SELECT mapper.rank, hp.* FROM keyword_mart_mapper mapper,homeplus hp "
			+"WHERE mapper.codeNo=#{codeNo} AND mapper.productcode=hp.productcode "
			+"ORDER BY rank ASC")
	public List<HomePlusVO> getHomePlusDataFromMapperByCodeNo(int codeNo);
	
	@Select("SELECT a.*, Rank() OVER(ORDER BY score DESC, a.price ASC) as rank "
			+"FROM (SELECT homeplus.*, rate*log(10,reviewcount+1) as score "
			+"FROM homeplus WHERE name LIKE '%'||#{keyword}||'%') as  a")
	public List<HomePlusVO> getHomePlusDataFromMapperByKeyword(String keyword);
	
	
	@Select("select ROUND(AVG(reviewcount),2) from homeplustokeyword "  
			+"WHERE codeno=#{codeNo} group by codeno")
	public double getHomePlusAverageByReviewCount(int codeNo);
	
	@Insert("INSERT INTO keyword_mart_mapper VALUES(#{codeno},#{productcode},#{rank})")
	public void keywordMartMapperInsert(HomePlusVO vo);
	
	@Insert("INSERT INTO homeplus VALUES(#{productcode},#{name},#{price},#{unitprice},"
			+ "#{rate},#{reviewcount},0,SYSDATE,#{img})")
	public void homeplusInsert(HomePlusVO vo);
	
}
