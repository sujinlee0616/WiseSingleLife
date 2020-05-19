package com.wsl.homeplus;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

@Repository
public class HomePlusDAO {
	@Resource(name="hpMapper")
	private HomePlusMapper mapper;
}
