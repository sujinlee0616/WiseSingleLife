package com.wsl.product_detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MartAllDataDAO {

	// martAllData
	@Autowired
	private MartAllDataMapper MAData_mapper;
	
	public MartAllDataVO SearchDetail(String productcode){
		System.out.println(productcode);
		return MAData_mapper.SearchDetail(productcode);
	}
}
