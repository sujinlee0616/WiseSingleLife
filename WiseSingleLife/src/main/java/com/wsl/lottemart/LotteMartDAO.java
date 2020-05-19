package com.wsl.lottemart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LotteMartDAO {
	
	@Resource(name="lmMapper")
	private LotteMartMapper mapper;
	
	@Autowired
	private LotteManager manager;
	
	public List<LotteMartVO> getLotteMartVOListByCodeNo(int codeNo) {
		return mapper.getLotteMartVOListByCodeNo(codeNo);
	}
	
	public List<LotteMartVO> getLotteMartVOListByKeyword(String keyword) {
		return mapper.getLotteMartVOListByKeyword(keyword);
	}

}
