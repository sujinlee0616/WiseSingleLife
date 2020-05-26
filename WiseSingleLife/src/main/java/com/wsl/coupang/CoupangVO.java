package com.wsl.coupang;

import java.util.Date;

public class CoupangVO {

	private int lookup;
	private Date lookuptime;
	
	private String name;
	private String weight;
	private String quantity="";
	
	//이미지
	private String img="";
	//할인율
	private String discount="";
	// 할인 전 가격
	private int baseprice;
	// 유닛 가격
	private String unitprice="";
	// 판매 가격
	private int saleprice=0;
	
	private String tags="";
	// 검색키워드
	
	private int codeNo;
	private int rank;
	private String productCode;
	// 리뷰
	private double rate=0.0;
	private int reviewcount=0;
	
	public int getLookup() {
		return lookup;
	}
	public void setLookup(int lookup) {
		this.lookup = lookup;
	}
	public Date getLookuptime() {
		return lookuptime;
	}
	public void setLookuptime(Date lookuptime) {
		this.lookuptime = lookuptime;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public int getBaseprice() {
		return baseprice;
	}
	public void setBaseprice(int baseprice) {
		this.baseprice = baseprice;
	}
	public String getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public int getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getReviewcount() {
		return reviewcount;
	}
	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}
	
}
