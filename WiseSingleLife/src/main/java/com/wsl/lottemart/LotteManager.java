package com.wsl.lottemart;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wsl.search.SearchKeywordVO;

@Component
public class LotteManager {
	
	@Autowired
	private LotteMartDAO dao;
	
	public List<LotteMartVO> getDataBySearch(SearchKeywordVO skvo) {
		List<LotteMartVO> list = new ArrayList<LotteMartVO>();
		
		try {
			Document srchDoc = Jsoup.connect("https://www.lotteon.com/search/search/search.ecn?render=search&platform=pc&q="+skvo.getKeyword()).get();
			String rawHtml = srchDoc.html();
			String srchRes = rawHtml.substring(rawHtml.indexOf("#srchTabProduct"));
			srchRes = srchRes.substring(srchRes.indexOf("<"));
			srchRes = srchRes.substring(0,srchRes.indexOf("noResultHtml")-4);
			srchRes = srchRes.replaceAll("\\\\\"", "\"");
			srchRes = srchRes.replaceAll("(\\\\r|\\\\n)", "");
			srchRes = srchRes.replaceAll("\\\\/", "/");
			
			Document dataDoc = Jsoup.parse(srchRes);
			Elements datas = dataDoc.select("li.srchProductItem");
			int rank = 1;
			for(Element data : datas) {
				try {
					System.out.println(skvo.getCodeNo() + " " + skvo.getKeyword());
					LotteMartVO vo = new LotteMartVO();
					vo.setCodeNo(skvo.getCodeNo());
					try {
						String productCode = data.selectFirst("a").attr("href");
						productCode = productCode.substring(productCode.indexOf("product/")+8,productCode.indexOf("?"));
						if(productCode.startsWith("/displayad")) continue;
						System.out.println("productCode : " + productCode);
						vo.setProductCode("LM-" + productCode);
					} catch (Exception e) {}
					
					String brand;
					try {
						brand = data.selectFirst("strong.srchProductUnitVendor").text();
						System.out.println("brand : " + brand);
						vo.setBrand(brand);
						
						try {
							String name = data.selectFirst("div.srchProductUnitTitle").text().substring(brand.length());
							System.out.println("name : " + name);
							vo.setName(name);
						} catch (Exception e) {}
					} catch (Exception e) {}
					
					try {
						String discountRate = data.selectFirst("span.srchdiscountPercent em").text();
						System.out.println("discountRate : " + discountRate);
						vo.setDiscountRate(discountRate);
						
						String strOriginPrice = data.selectFirst("del.srchOriginalPrice").text();
						int originPrice = Integer.parseInt(strOriginPrice.replaceAll("[^0-9]", ""));
						System.out.println("originPrice : " + originPrice);
						vo.setOriginPrice(originPrice);
					} catch (Exception e) {}
					
					try {
						String strPrice = data.selectFirst("span.srchCurrentPrice").text();
						System.out.println("price : " + strPrice);
						int price = Integer.parseInt(strPrice.replaceAll("[^0-9]", ""));
						vo.setPrice(price);
					} catch (Exception e) {}
					
					try {
						String unitPrice = data.selectFirst("span.srchPerPrice").text();
						System.out.println("unitPrice : " + unitPrice);
						vo.setUnitPrice(unitPrice);
					} catch (Exception e) {}
					
					try {
						String img = data.selectFirst("div.srchThumbImageWrap img").attr("src");
						System.out.println("img : " + img);
						vo.setImg(img);
					} catch (Exception e) {}
					
					Element rating;
					try {
						rating = data.selectFirst("span.srchRatingScore");
						double rate = Double.parseDouble(rating.text().substring(0,rating.text().indexOf("(")));
						System.out.println("rate : " + rate);
						vo.setRate(rate);
						
						try {
							String strRvCnt = rating.selectFirst("strong").text();
							int reviewCount = Integer.parseInt(strRvCnt.replaceAll("[^0-9]", ""));
							System.out.println("reviewCount : " + reviewCount);
							vo.setReviewCount(reviewCount);
						} catch (Exception e) {}
					} catch (Exception e) {}
					
					try {
						String strMP = data.selectFirst("strong.srchProductMonthlyPurchaseCount").text();
						int mPurchase = Integer.parseInt(strMP.replaceAll(",", ""));
						System.out.println("mPurchase : " + mPurchase);
						vo.setMPurchase(mPurchase);
					} catch (Exception e) {}
					
					System.out.println("rank : " + rank);
					vo.setRank(rank);
					
					System.out.println("================");
					//dao.lotterMartInsert(vo);
					rank++;
					Thread.sleep(10);
					//if(true) return list;
				} catch (Exception e) {}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}