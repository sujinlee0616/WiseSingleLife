package com.wsl.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wsl.search.SearchKeywordVO;

@Repository
public class MainDAO {
	@Autowired
	private MainMapper mapper;
	
	public List<SearchKeywordVO> getPopularTop10() {
		return mapper.getPopularTop10();
	}
}
