package com.wsl.crawling;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmartDAO {
	@Autowired
	private EmartMapper mapper;
	
	
	// search_keyword
	public List<SearchKeywordVO> searchKeywordData() {
		return mapper.searchKeywordData();
	}
	
	// insert
	public void insertEmartData(EmartVO vo) {
		mapper.insertEmartData(vo);
	}
}
