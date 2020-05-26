package com.wsl.coupang;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.wsl.search.*;

@Repository
public class CoupangDAO {

	@Resource(name="cpMapper")
	private CoupangMapper mapper;
	
	public List<SearchKeywordVO> keywordAllData(){
		return mapper.keywordAllData();
	}
	
	public void InsertCoupang(CoupangVO vo){
		mapper.keywordMartMapperInsert(vo);
		mapper.InsertCoupang(vo);
	}
	
	public List<CoupangVO> getCoupangVOListByCodeNo(int codeNo) {
		return mapper.getCoupangVOListByCodeNo(codeNo);
	}
	
	public List<CoupangVO> getCoupangVOListByKeyword(String keyword) {
		return mapper.getCoupangVOListByKeyword(keyword);
	}
}
