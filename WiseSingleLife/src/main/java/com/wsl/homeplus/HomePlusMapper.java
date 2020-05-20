package com.wsl.homeplus;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import com.wsl.lottemart.LotteMartVO;

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
	
}
