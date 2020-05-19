package com.wsl.search;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

@Repository
public class SearchKeywordDAO {
	
	@Resource(name="skMapper")
	private SearchKeywordMapper mapper;
	
	// search_keyword 테이블에서 해당 keyword의 레코드 반환.
	// 없는 keyword의 경우 codeNo를 0으로 세팅 후 SearchKeywordVO 반환.
	public SearchKeywordVO getSearchKeywordVO(String keyword) {
		SearchKeywordVO vo = new SearchKeywordVO();
		vo.setCodeNo(0);
		
		if(mapper.isRegisteredSearchKeyword(keyword)==1) {
			vo = mapper.getSearchKeywordVO(keyword);
		}
		
		return vo;
	}
	
	// codeNo, keyword만 넘기면 됨. count, datetime은 디폴트 0, SYSDATE
	public void searchKeywordInsert(SearchKeywordVO vo) {
		mapper.searchKeywordInsert(vo);
	}

}
