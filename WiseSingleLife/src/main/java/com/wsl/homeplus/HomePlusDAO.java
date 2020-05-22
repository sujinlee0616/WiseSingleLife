package com.wsl.homeplus;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wsl.lottemart.LotteMartVO;

@Repository
public class HomePlusDAO {
	@Resource(name="hpMapper")
	private HomePlusMapper mapper;
	
	
	public List<HomePlusVO> getHomePlusDataFromMapperByCodeNo (int codeNo){
		return mapper.getHomePlusDataFromMapperByCodeNo(codeNo);
	}
	
	public List<HomePlusVO> getHomePlusDataFromMapperByKeyword(String keyword){
		return mapper.getHomePlusDataFromMapperByKeyword(keyword);
	}
	
	public double getHomePlusAverageByReviewCount(int codeNo) {
		return mapper.getHomePlusAverageByReviewCount(codeNo);
	}
	
	public void homeplusInsert(HomePlusVO vo) {
		mapper.keywordMartMapperInsert(vo);
		mapper.homeplusInsert(vo);
	}

}
