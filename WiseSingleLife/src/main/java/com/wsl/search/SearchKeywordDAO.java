package com.wsl.search;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wsl.lottemart.LotteManager;

@Repository
public class SearchKeywordDAO {
	
	@Resource(name="skMapper")
	private SearchKeywordMapper mapper;
	
	@Autowired
	private LotteManager lmMgr;
	
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
			
			// 새로 추가된 키워드에 대한 데이터 수집은 쓰레드로 처리.(안 그러면 크롤링 다 끝날 때 까지 vo 반환이 안 되기 때문)
			new Thread(new Runnable() {
				@Override
				public void run() {
					// 새로 추가된 키워드에 대한 레코드 가져옴. 이 정보를 각 마트별 매니저에게 넘기면서 호출.
					// 상품을 크롤링하고 테이블에 중복 없이 데이터 집어넣고 매핑 테이블에 채우는 것 까지 매니저에서 처리.
					SearchKeywordVO skvo = mapper.getSearchKeywordVO(keyword);
					
					lmMgr.crawlingDataBySearchKeyword(skvo);
				}
			}).run();
		}
		
		return vo;
	}

}
