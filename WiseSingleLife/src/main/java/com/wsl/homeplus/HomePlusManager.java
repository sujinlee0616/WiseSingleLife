package com.wsl.homeplus;
import java.net.URLEncoder;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wsl.search.SearchKeywordVO;

@Component
public class HomePlusManager {
	
	@Autowired
	private HomePlusDAO dao;
	
	public List<HomePlusVO> getDataBySearch(SearchKeywordVO skvo){
		List<HomePlusVO> list = new ArrayList<HomePlusVO>();
		try{
			String encoded = URLEncoder.encode(skvo.getKeyword()).replaceAll("%","%25");
			Document hpdoc = Jsoup.connect("http://www.homeplus.co.kr/app.search.HeaderSearch.ghs?comm=usr.header.search.basic4&search_query="
								+ encoded).get();
			Elements li = hpdoc.select("ul.fix-ty2 li");
			
			HomePlusVO vo = new HomePlusVO();
			
			String code = "";
			String unit = "";
			String temp = "";
			
			int cnt = 0;
			int rank = 1;
			
			try{
				for(int j = 0; j < li.size(); j++){
				Element item = li.get(j);
				System.out.println("상품갯수:"+j);
				
				//rank 
				System.out.println("rank:"+rank);
				vo.setRate(rank);
				rank++;
				
				//codeno
				try{
					int codeno = skvo.getCodeNo();
					vo.setCodeno(codeno);
				}catch (Exception e) {
					System.out.println("codeno erro");
				}
				//상품명
				try{
					temp = item.selectFirst(".exh-comtxt .name").text();
					vo.setName(temp);
					System.out.println(temp);
				}catch(Exception e){
					System.out.println("name error");
				}
				//상품가격
				try{
					temp = item.selectFirst(".buy").text();
					String temp3 = "";
					if (temp.contains(",")) {
						int idx = temp.indexOf(",");
						String temp1 = temp.substring(0, idx);
						String temp2 = temp.substring(idx + 1);
						temp3 = temp1 + temp2;
						System.out.println(temp3);
					} else {
						temp3 = temp;
					}
					int price = Integer.parseInt(temp3);
					vo.setPrice(price);
				} catch (Exception e) {
					System.out.println("price error");
				}
				//상품코드
				try{
					/*code = item.selectFirst(".exh-comtxt .zone-btn .input-number").html();*/
					code = item.selectFirst(".exh-comtxt").html();
					String code1 = "jsGoodDetail('";
					int target_num = code.indexOf(code1);
					String coding = "hp"+code.substring(target_num+14,(code.substring(target_num).indexOf("', ''); return")+target_num)); 
					System.out.println("code:"+coding);
					vo.setProductcode(coding);
					}catch (Exception e) {
					System.out.println("code error");
				}
				try{
					String imgcode = item.selectFirst(".exh-comimg").html();
					System.out.println(imgcode);
					String imgcode1 = "</span><img src=";
					int target = imgcode.indexOf(imgcode1);
					String imgcoding = "http:"+imgcode.substring(target+17,(imgcode.substring(target).indexOf("blank176")+target-9));
					System.out.println("imgcode:"+imgcoding);
					vo.setImg(imgcoding);
					}catch (Exception e) {
					System.out.println("img error");
				}
				//개당 or G당 가격
				try{
					unit = item.selectFirst(".unit").text();
					System.out.println(unit);
				}catch (Exception e) {
					System.out.println("unit error");
					unit=null;
				}
				vo.setUnitprice(unit);
				// 리뷰,평점
				try{
					temp = item.selectFirst(".user-eval").text();
					int idx1 = temp.indexOf("(");
					int idx2 = temp.indexOf("건)");
					int review = Integer.parseInt(temp.substring(idx1+1,idx2));
					int idx = temp.indexOf("점");
					int rate = Integer.parseInt(temp.substring(0,idx));
					System.out.println(review);
					System.out.println(rate);
					vo.setReviewcount(review);
					vo.setRate(rate);							
				}catch (Exception ex) {
					System.out.println("Review,Rate error");
				}
				cnt++;
				System.out.print(cnt);
//				dao.HomeplusInsert(vo);
				}
			}catch (Exception e) {
				rank--;
			}
			Thread.sleep(1000);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
}
