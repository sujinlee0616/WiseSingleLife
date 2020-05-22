package com.wsl.search;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Repository;

import com.wsl.coupang.CoupangManger;
import com.wsl.emart.EmartManager3;
import com.wsl.homeplus.HomePlusManager;
import com.wsl.lottemart.LotteManager;

@Repository
public class SearchKeywordDAO {
	
	@Resource(name="skMapper")
	private SearchKeywordMapper mapper;
	
	@Autowired
	private LotteManager lmMgr;
	@Autowired
	private CoupangManger cpMgr;
	@Autowired
	private EmartManager3 emMgr;
	@Autowired
	private HomePlusManager hpMgr;
	
	// search_keyword 테이블에서 해당 keyword의 레코드 반환.
	// 없는 keyword의 경우 codeNo를 0으로 세팅 후 SearchKeywordVO 반환.
	public SearchKeywordVO getSearchKeywordVO(String keyword) {
		SearchKeywordVO vo = new SearchKeywordVO();
		vo.setCodeNo(0);
		
		// keyword가 있으면 해당 키워드의 레코드 반환하고 count(해당 키워드의 검색 횟수) 증가.
		if(mapper.isRegisteredSearchKeyword(keyword)==1) {
			vo = mapper.getSearchKeywordVO(keyword);
			mapper.searchKeywordCountIncrement(vo.getCodeNo());
		} else {
			// keyword가 없는 경우 해당 키워드를 search_keyword 테이블에 추가.
			SearchKeywordVO skvo = new SearchKeywordVO();
			skvo.setKeyword(keyword);
			mapper.searchKeywordInsert(skvo);
			
			// 새로 추가된 키워드에 대한 데이터 수집은 비동기로 처리.(안 그러면 크롤링 다 끝날 때 까지 vo 반환이 안 되기 때문)
			// 각 클래스에 @EnableAsync 올리고 해당 메소드에 @Async 올리면 스프링이 쓰레드 만들어서 돌려줌.
			lmMgr.crawlingDataBySearchKeyword(skvo);
			cpMgr.sListData(skvo);
			emMgr.emartData(skvo);
			hpMgr.getDataBySearch(skvo);
		}
		
		return vo;
	}

}
