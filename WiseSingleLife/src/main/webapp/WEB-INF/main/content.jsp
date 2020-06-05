<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function (){
	$('.pop').mouseover(function(){
		var no=$(this).attr("data-no");
		//console.log(no);
		$('#wcimg').html("<img src=\"/wslimg/"+no+".png\" width=\"530\" height=\"450\"/>");
	})
}) 
</script>
</head>
<body>
<!-- ================================ IMAGE SLIDER ================================ -->
    <section class="home-slider owl-carousel">
	  <div class="slider-item" style="background-image:url(images/grocery_store_1.jpg);">
		<div class="container">
			<h1 class="slider_txt1">슬기로운 자취생활</h1>
			<h5 class="slider_txt2">프로 자취러를 위한 식료품 가격비교 서비스</h5>
			<div class="slider_search_area">
				<form action="search_react.do" method="get">
					<input class="img_slider_search" name="keyword" type="search" placeholder="검색어를 입력하세요." required>
					<button class="sliderBtn">검색</button>
				</form>
			</div>
		</div>
      </div>
    </section>
	
	<!-- ================================== 인기검색어  ================================== -->	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">오늘 Hot한 상품은?!</span>
				  <h2 class="mb-4">실시간 인기검색어</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 pk_area ftco-animate">
					<!-- 인기검색어 (좌측) -->
					<ol class="popular_keyword mb-0">
						<c:forEach var="vo" items="${list }" varStatus="status">
							<c:if test="${status.count==1 }">
								<li class="pop on" id="pop${status.count}" data-no="${status.count }">
							</c:if>
							<c:if test="${status.count!=1 }">
								<li class="pop" id="pop${status.count}" data-no="${status.count }">
							</c:if>
								<a href="search_react.do?keyword=${vo.keyword }">
									<div class="num">${status.count }</div>
									<span class="pk">${vo.keyword }</span>
									<!-- <span class="rank_chg">▲</span> -->
								</a>
							</li>
						</c:forEach>
					</ol>
				</div>
				<!-- 연관검색어 (우측) -->
				<div class="col-md-6 rk_area ftco-animate">
					<p class="mt-5" id="wcimg">
						<img src="/wslimg/1.png" width="530" height="450"/>
					</p>
				</div>
			</div>
		</div>
	</section>
	
	<!-- ================================== PROMOTION VER2 ================================== -->	
	<section class="ftco-section bg-grey">
		<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">슬기로운 자취생활을 위한</span>
			  <h2 class="mb-4">마트별 할인소식</h2>
			</div>
		</div>
		<div class="row d-flex">
		  <div class="col-md-3 d-flex ftco-animate">
			<div class="blog-entry align-self-stretch">
			  <a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000355090" target="_blank" class="block-20" style="background-image: url('images/mart_event_1.png');">
			  </a>
			  <div class="text mt-3 d-block">
					<a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000355090" target="_blank">
						<h3 class="heading mt-3 event">[이마트] 이번 주 이마트 전단 광고</h3>
					</a>
			  </div>
			</div>
		  </div>
		  <div class="col-md-3 d-flex ftco-animate">
			<div class="blog-entry align-self-stretch">
			  <a href="https://www.lotteon.com/p/display/shop/seltDpShop/12919" target="_blank" class="block-20" style="background-image: url('images/mart_event_2.png');">
			  </a>
			  <div class="text mt-3">
					<a href="https://www.lotteon.com/p/display/shop/seltDpShop/12919" target="_blank">
						<h3 class="heading mt-3 event">[롯데마트] 이번 주 롯데마트 전단 광고</h3>
					</a>
			  </div>
			</div>
		  </div>
		  <div class="col-md-3 d-flex ftco-animate">
			<div class="blog-entry align-self-stretch">
			  <a href="http://www.homeplus.co.kr/app.exhibition.eplacard.Eplacard.ghs?comm=usr.eplacard.inf&WT.ac=Main_GNB_leaflet" target="_blank" class="block-20" style="background-image: url('images/mart_event_3.png');">
			  </a>
			  <div class="text mt-3">
					<a href="http://www.homeplus.co.kr/app.exhibition.eplacard.Eplacard.ghs?comm=usr.eplacard.inf&WT.ac=Main_GNB_leaflet"
					target="_blank">
						<h3 class="heading mt-3 event">[홈플러스] 이번 주 홈플러스 전단</h3>
					</a>
			  </div>
			</div>
		  </div>
		  <div class="col-md-3 d-flex ftco-animate">
			<div class="blog-entry align-self-stretch">
			  <a href="https://www.coupang.com/np/campaigns/82" target="_blank" class="block-20" style="background-image: url('images/mart_event_4.png');">
			  </a>
			  <div class="text mt-3">
					<a href="https://www.coupang.com/np/campaigns/82" target="_blank">
						<h3 class="heading mt-3 event">[쿠팡] 밤 12시까지 주문해도 내일 도착! 로켓배송</h3>
					</a>
			  </div>
			</div>
		  </div>
		  <div class="col-md-3 d-flex ftco-animate">
			<div class="blog-entry align-self-stretch">
			  <a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000155081" target="_blank" class="block-20" style="background-image: url('images/mart_event_5.png');">
			  </a>
			  <div class="text mt-3 d-block">
				<h3 class="heading mt-3 event">
					<a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000155081" target="_blank">[이마트] 과일 행사 중</a>
				</h3>
			  </div>
			</div>
		  </div>
			<div class="col-md-3 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch">
					<a href="https://www.lotteon.com/p/display/shop/seltDpShop/12917" target="_blank" class="block-20" style="background-image: url('images/mart_event_6.png');">
					</a>
					<div class="text mt-3 d-block">
						<h3 class="heading mt-3 event">
							<a href="https://www.lotteon.com/p/display/shop/seltDpShop/12917" target="_blank">[롯데마트] 기획전 모아보기</a>
						</h3>
					</div>
				</div>
			</div>
			<div class="col-md-3 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch">
					<a href="http://www.homeplus.co.kr/app.exhibition.cheapershop.CheaperShop.ghs?comm=usr.cheapershop&WT.ac=Main_GNB_ssaday" target="_blank" class="block-20" style="background-image: url('images/mart_event_7.png');">
					</a>
					<div class="text mt-3 d-block">
						<h3 class="heading mt-3 event">
							<a href="http://www.homeplus.co.kr/app.exhibition.cheapershop.CheaperShop.ghs?comm=usr.cheapershop&WT.ac=Main_GNB_ssaday" target="_blank">[홈플러스] 싸-데이 이번주 득템상품은?</a>
						</h3>
					</div>
				</div>
			</div>
			<div class="col-md-3 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch">
					<a href="https://www.coupang.com/np/coupangbenefit" target="_blank" class="block-20" style="background-image: url('images/mart_event_8.png');">
					</a>
					<div class="text mt-3">
						<a href="https://www.coupang.com/np/coupangbenefit" target="_blank"><h3 class="heading mt-3 event">[쿠팡] 이벤트/쿠폰 모음</h3></a>
					</div>
				</div>
			</div>
		</div>
		
		</div>
	</section>

</body>
</html>