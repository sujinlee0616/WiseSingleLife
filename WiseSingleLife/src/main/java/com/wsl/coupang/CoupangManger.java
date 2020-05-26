package com.wsl.coupang;

import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.*;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;
import com.wsl.coupang.*;
import com.wsl.search.*;
import com.wsl.vo.*;

@EnableAsync
@Component
public class CoupangManger {

	@Autowired
	private CoupangDAO dao;

	// 공용 DB에 연결되는 DaO
	@Async
	public void sListData(SearchKeywordVO skvo) {
		//System.out.println("호출확인");
		try {
			String star = "";
			String count = "";
			String discount = "";
			String base = " ";
			String state_code = "";
			String weight = " ";
			String volume = " ";
			String product = " ";
			String unit = " ";
			String img = " ";

			Document doc = Jsoup
					.connect("http://www.coupang.com/np/search?component=&q=" + skvo.getKeyword() + "&channel=user")
					.data("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
					.data("Accept-Encoding", "br, gzip, deflate").data("Host", "www.coupang.com")
					.userAgent(
							"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15")
					.data("Accept-Language", "ko-kr").data("Connection", "keep-alive").get();

			// 상품 이름 ( 무게+ 수량+ 이름 )
			Elements name = doc.select("div.name");
			// 이미지
			Elements image = doc.select("dl.search-product-wrap dt.image img");
			// 할인율
			Elements discount_percentage = doc.select("div.price-wrap div.price span span");
			// 상품코드
			Elements code = doc.select("ul#productList > li");
			// 별점
			Elements rating_star = doc.select("div.other-info div > span.star");
			// 전체 리뷰 개수
			Elements total_count = doc.select("div.other-info div > span.rating-total-count");
			// base_price : 판매가격
			Elements base_price = doc.select("div.price-wrap div.price em strong");
			// 단위 당 가격
			Elements unit_price = doc.select("div.price-wrap div.price span.unit-price");

			for (int i = 0; i < code.size(); i++) {

				try {
					String tname = name.get(i).text();
					// 상품 코드
					state_code = code.get(i).attr("id");
					// 이미지
					try {
						img = image.get(i).attr("src");
					} catch (Exception ex) {
						img = "null";
					}
					// 할인율
					try {
						discount = discount_percentage.get(i).text();
					} catch (Exception ex) {
						discount = "null";
					}
					// 판매 가격
					try {
						String temp = base_price.get(i).text();
						base = temp.replaceAll(",", "");
					} catch (Exception ex) {
						base = "null";
					}
					// 할인 전 가격
					try {
						String temp = base_price.get(i).text();
						base = temp.replaceAll(",", "");
					} catch (Exception ex) {
						base = "null";
					}
					try {
						unit = unit_price.get(i).text();
					} catch (Exception ex) {
						unit = "null";
					}
					// 별점
					try {
						star = rating_star.get(i).text();
					} catch (Exception ex) {
						star = "null";
					}
					// 리뷰 카운트
					try {
						count = total_count.get(i).text();
					} catch (Exception ex) {
						count = "null";
					}

					/*
					 * String weight =" "; String volume =" "; String product
					 * =" "; String unit =" ";
					 */
					String[] Tsize = tname.split(",");
					try {
						if (Tsize.length == 3) {
							// 상품 이름
							product = Tsize[0];
							// 무게
							weight = Tsize[1];
							// 갯수
							volume = Tsize[2];
						}
						if (Tsize.length == 2) {
							product = Tsize[0];
							volume = Tsize[1];
						}
						if (Tsize.length == 1) {
							product = Tsize[0];
						}
					} catch (Exception ex) {
						product = tname;
						weight = "null";
						volume = "null";
					}

					/*System.out.println("====================");
					System.out.println("검색 번호 " + skvo.getCodeNo());
					System.out.println("tag(검색어) : " + skvo.getKeyword());
					System.out.println("상품코드 : " + state_code);

					System.out.println("rank :" + (i + 1));
					System.out.println("=====================");
					System.out.println("할인율 : " + discount);
					System.out.println("판매 가격 " + base);
					System.out.println("단위당 가격 : " + unit);
					System.out.println("별점 :" + star);
					System.out.println("총 리뷰수 : " + count);*/

					// 저장
					CoupangVO vo = new CoupangVO();
					// (( 키워드, 검색코드, 상품코드, Rank )) 검색 조건 저장
					vo.setTags(skvo.getKeyword());
					vo.setCodeNo(skvo.getCodeNo());
					vo.setProductCode(state_code);
					vo.setRank(i + 1);
					// (( 이름, 수량, 이미지 )) 상품 조건 저장
					vo.setName(product);
					vo.setQuantity(volume);
					vo.setImg(img);
					// (( 가격, 할인율, 단위당 가격 )) 상품 가격 저장
					vo.setBaseprice(Integer.parseInt(base));
					vo.setDiscount(discount);
					vo.setUnitprice(unit);
					// 판매 가격
					// (별점 , 리뷰수) 리뷰 저장
					if (star == "null") {
						vo.setRate(0);
					} else {
						vo.setRate(Double.valueOf(star));
					}
					//System.out.println("별점 확인 " + star);
					if (count == "null") {
						//System.out.println(count);
						vo.setReviewcount(0);
					} else {
						String reviewC = count.substring(1, count.indexOf(")"));
						//System.out.println(reviewC);
						vo.setReviewcount(Integer.parseInt(reviewC));
					}

					try {
						dao.InsertCoupang(vo);
					} catch (Exception e) {}
					Thread.sleep(100);
				} catch (Exception ex) {}
			}

		} catch (Exception ex) {}
	}
}
