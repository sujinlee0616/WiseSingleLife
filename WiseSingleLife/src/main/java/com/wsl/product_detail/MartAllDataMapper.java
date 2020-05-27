package com.wsl.product_detail;

import org.apache.ibatis.annotations.Select;

import com.wsl.product_detail.*;
public interface MartAllDataMapper {

	@Select("SELECT * FROM martalldata "
		   +"WHERE productcode like '%'||#{productcode}")
	public MartAllDataVO SearchDetail(String productcode);
	
}
