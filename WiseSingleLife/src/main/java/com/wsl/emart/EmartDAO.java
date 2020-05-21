package com.wsl.emart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EmartDAO {
	
	@Resource(name="emMapper")
	private EmartMapper mapper;
	
	// =========================== ũ�Ѹ� ===========================
	// search_keyword
	public List<SearchKeywordVO> searchKeywordData() {
		return mapper.searchKeywordData();
	}
	
	// insert
	public void insertEmartData(EmartVO vo) {
		mapper.keywordMartMapperInsert(vo);
		mapper.insertEmartData(vo);
	}
	
	// ============================================================
	
	public List<EmartVO> emartSearchData(String keyword) {
		return mapper.emartSearchData(keyword);
	}
	
	public List<EmartVO> emartSearchData2(int codeno){
		return mapper.emartSearchData2(codeno);
	}
	
}
