package com.wsl.graph;

import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Component;

@Component
public class R_graphManager {
	
	public void rGraph(String codeno){
		
		try {
			RConnection rc = new RConnection();
			rc.voidEval("library(rJava");
			rc.voidEval("library(koNLP");
			rc.voidEval("library(DBI)");
			rc.voidEval("library(RJDBC)");
			rc.voidEval("drv<-JDBC(\"oracle.jdbc.OracleDriver\")");
			rc.voidEval("conn<-dbConnect(drv,'jdbc:oracle:thin@//localhost:1521:/XE',\"hr\",\"happy\")");
			// 그래프 이미지 출력
			rc.voidEval("png(\"C");
		} catch (Exception e) {
			System.out.println("R-Error : "+e.getMessage());
			e.printStackTrace();
		}
		
		
		
	}

}
