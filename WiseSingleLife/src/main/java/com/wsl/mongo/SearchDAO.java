package com.wsl.mongo;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;

@Repository
public class SearchDAO {
	@Autowired
	private MongoTemplate mt;
	
	// 검색 단어 insert
	public void searchInsert(SearchVO vo) {
		Query query=new Query();
		query.with(new Sort(Sort.Direction.DESC, "no"));
		SearchVO svo=mt.findOne(query, SearchVO.class, "search");
		
		vo.setNo(svo.getNo()+1);
		vo.setRegdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		
		mt.insert(vo, "search");
	}
	
	
	public List<SearchVO> searchListData(String keyword) {
		List<SearchVO> list=new ArrayList<SearchVO>();
		BasicQuery query=new BasicQuery("{keyword:{$regex:\".*"+keyword+"*\"}}");
		list=mt.find(query, SearchVO.class,"search");
		
		return list;
	}
}
