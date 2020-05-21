package com.wsl.lottemart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class LotteMartDAO {
	
	@Resource(name="lmMapper")
	private LotteMartMapper mapper;
	
	public List<LotteMartVO> getLotteMartVOListByCodeNo(int codeNo) {
		return mapper.getLotteMartVOListByCodeNo(codeNo);
	}
	
	public List<LotteMartVO> getLotteMartVOListByKeyword(String keyword) {
		return mapper.getLotteMartVOListByKeyword(keyword);
	}
	
	public void lotteMartInsert(LotteMartVO vo) {
		mapper.keywordMartMapperInsert(vo);
		mapper.lotteMartInsert(vo);
	}

}
