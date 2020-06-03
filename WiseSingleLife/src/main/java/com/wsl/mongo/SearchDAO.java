package com.wsl.mongo;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import org.rosuda.REngine.Rserve.RConnection;
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
	
	public void rGraph(int no) {
		try {
			// R 연결 -> Rserve가 동작하고 있어야 연결 가능
			RConnection rc=new RConnection();  // default:localhost
			
			// import
			rc.voidEval("library(rJava)");
			rc.voidEval("library(KoNLP)");
			rc.voidEval("library(wordcloud)");
			rc.voidEval("library(RColorBrewer)");
			
			String path = "c:\\wslImage"; //폴더 경로
			File Folder = new File(path);

			// wslImage 디렉토리가 없을경우 디렉토리를 생성
			if (!Folder.exists()) {
				try{
				    Folder.mkdir(); //폴더 생성
				    System.out.println("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
				}        
		    } else {
				System.out.println("이미 폴더가 생성되어 있습니다.");
			}
			
			// 그림그릴 준비 - 저장위치에 그림을 png로 그려라
			rc.voidEval("png(\"C:/wslImage/"+no+".png\",width=550,height=450)");
			
			// voidEval : 명령어를 보냄 
			// 한줄씩 읽어서 실행
			rc.voidEval("data<-readLines(\"c:/data/search.txt\")");
			
			// 단어의 횟수
			rc.voidEval("data2<-table(data)");
			
			// wordcloud
			rc.voidEval("wordcloud(names(data2),freq=data2,scale = c(5,1),rot.per = 0.25,min.freq = 1,random.order = F,random.color = T,colors = brewer.pal(11,\"Dark2\"))");
			
			rc.voidEval("dev.off()");
			rc.close();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
