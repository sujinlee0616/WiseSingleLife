package com.wsl.crawling;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchKeywordVO {
	private int codeno; // 검색어 코드
	private String keyword; // 검색어 이름
	private int count; // 조회수
	private Date datetime; // 조회날짜
}
