package com.wsl.lottemart;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

@Repository
public class LotteMartDAO {
	
	@Resource(name="lmMapper")
	private LotteMartMapper mapper;

}
