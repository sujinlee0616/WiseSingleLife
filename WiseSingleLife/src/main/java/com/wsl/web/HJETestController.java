package com.wsl.web;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wsl.coupang.CoupangDAO;
import com.wsl.coupang.CoupangVO;
import com.wsl.emart.EmartDAO;
import com.wsl.emart.EmartVO;
import com.wsl.homeplus.HomePlusDAO;
import com.wsl.homeplus.HomePlusVO;
import com.wsl.lottemart.LotteMartDAO;
import com.wsl.lottemart.LotteMartVO;
import com.wsl.search.SearchKeywordDAO;
import com.wsl.search.SearchKeywordVO;

@RestController
@RequestMapping("hje/")
public class HJETestController {
	@Autowired
	private SearchKeywordDAO skdao;
	@Autowired
	private EmartDAO emdao;
	@Autowired
	private LotteMartDAO lmdao;
	@Autowired
	private HomePlusDAO hpdao;
	@Autowired
	private CoupangDAO cpdao;
	
	@RequestMapping("search.do")
	public String hje_search(String keyword) {
		keyword="오레오";  /////////임시
		SearchKeywordVO vo=skdao.getSearchKeywordVO(keyword);
		
		List<EmartVO> emlist=new ArrayList<EmartVO>();
		List<LotteMartVO> lmlist=new ArrayList<LotteMartVO>();
		List<HomePlusVO> hplist=new ArrayList<HomePlusVO>();
		List<CoupangVO> cplist=new ArrayList<CoupangVO>();
		
		// 0이면 키워드로 검색, 0이 아니면 코드번호로 검색
		if(vo.getCodeNo()==0) {
			emlist=emdao.getEmartVOListByKeyword(keyword);
			lmlist=lmdao.getLotteMartVOListByKeyword(keyword);
			hplist=hpdao.getHomePlusDataFromMapperByKeyword(keyword);
			cplist=cpdao.getCoupangVOListByKeyword(keyword);
		}
		else {
			emlist=emdao.getEmartVOListByCodeNo(vo.getCodeNo());
			lmlist=lmdao.getLotteMartVOListByCodeNo(vo.getCodeNo());
			hplist=hpdao.getHomePlusDataFromMapperByCodeNo(vo.getCodeNo());
			cplist=cpdao.getCoupangVOListByCodeNo(vo.getCodeNo());
		}
		
		
		// ####################### JSON #############################
		
		// emart
		JSONArray emarr=new JSONArray();
		for(EmartVO emvo:emlist) {
			JSONObject emobj=new JSONObject();
			emobj.put("productcode", emvo.getProductcode());
			emobj.put("codeno", emvo.getCodeno());
			emobj.put("name", emvo.getName());
			emobj.put("price", emvo.getPrice());
			emobj.put("unitprice", emvo.getUnitprice());
			emobj.put("rate", emvo.getRate());
			emobj.put("reviewcount", emvo.getReviewcount());
			emobj.put("tags", emvo.getTags());
			emobj.put("lookup", emvo.getLookup());
			emobj.put("lookuptime", emvo.getLookuptime().toString());
			emobj.put("rank", emvo.getRank());
			emobj.put("img", emvo.getImg());
			
			emarr.add(emobj);
		}
		
		// LotteMart
		JSONArray lmarr=new JSONArray();
		for(LotteMartVO lmvo:lmlist) {
			JSONObject lmobj=new JSONObject();
			lmobj.put("productcode", lmvo.getProductCode());
			lmobj.put("codeno", lmvo.getCodeNo());
			lmobj.put("name", lmvo.getName());
			lmobj.put("price", lmvo.getPrice());
			lmobj.put("unitprice", lmvo.getUnitPrice());
			lmobj.put("discountrate", lmvo.getDiscountRate());
			lmobj.put("brand", lmvo.getBrand());
			lmobj.put("mpurchase", lmvo.getMPurchase());
			lmobj.put("rate", lmvo.getRate());
			lmobj.put("reviewcount", lmvo.getReviewCount());
			lmobj.put("lookup", lmvo.getLookup());
			lmobj.put("lookuptime", lmvo.getLookuptime().toString());
			lmobj.put("rank", lmvo.getRank());
			lmobj.put("img", lmvo.getImg());
			lmobj.put("originprice", lmvo.getOriginPrice());
			
			lmarr.add(lmobj);
		}
		
		// HomePlus
		JSONArray hparr=new JSONArray();
		for(HomePlusVO hpvo:hplist) {
			JSONObject hpobj=new JSONObject();
			hpobj.put("productcode", hpvo.getProductcode());
			hpobj.put("codeno", hpvo.getCodeno());
			hpobj.put("name", hpvo.getName());
			hpobj.put("price", hpvo.getPrice());
			hpobj.put("unitprice", hpvo.getUnitprice());
			hpobj.put("rate", hpvo.getRate());
			hpobj.put("reviewcount", hpvo.getReviewcount());
			hpobj.put("lookup", hpvo.getLookup());
			hpobj.put("lookuptime", hpvo.getLookuptime().toString());
			hpobj.put("rank", hpvo.getRank());
			hpobj.put("img", hpvo.getImg());
			
			hparr.add(hpobj);
		}
		
		// Coupang
		JSONArray cparr=new JSONArray();
		for(CoupangVO cpvo:cplist) {
			JSONObject cpobj=new JSONObject();
			cpobj.put("productcode", cpvo.getProductCode());
			cpobj.put("codeno", cpvo.getCodeNo());
			cpobj.put("name", cpvo.getName());
			cpobj.put("discount", cpvo.getDiscountrate());
			cpobj.put("baseprice", cpvo.getPrice());
			cpobj.put("unitprice", cpvo.getUnitprice());
			cpobj.put("quantity", cpvo.getQuantity());
			cpobj.put("rate", cpvo.getRate());
			cpobj.put("reviewcount", cpvo.getReviewcount());
			cpobj.put("tags", cpvo.getTags());
			cpobj.put("lookup", cpvo.getLookup());
			cpobj.put("lookuptime", cpvo.getLookuptime().toString());
			cpobj.put("rank", cpvo.getRank());
			cpobj.put("img", cpvo.getImg());
			
			cparr.add(cpobj);
		}
		
		
		JSONObject allobj=new JSONObject();
		allobj.put("em", emarr);
		allobj.put("lm", lmarr);
		allobj.put("hp", hparr);
		allobj.put("cp", cparr);
		
		String result=allobj.toJSONString();
		System.out.println(result);
		
		// {"em":[{},{},{},..],"hp":[{},{},{},..], ...}
		return result;
	}
}