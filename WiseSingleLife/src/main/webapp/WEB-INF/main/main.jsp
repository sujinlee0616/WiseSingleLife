<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <title>Royal Estate - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- MainCSS -->
	<link rel="stylesheet" href="css/main.css">
  </head>
  <body>
    <!-- ================================ NAVBAR ================================ -->
    <tiles:insertAttribute name="nav"/>
    <!-- END nav -->

	<!-- ================================ IMAGE SLIDER ================================ -->
    <section class="home-slider owl-carousel">
	  <div class="slider-item" style="background-image:url(images/grocery_store_1.jpg);">
		<div class="container">
			<h1 class="slider_txt1">슬기로운 자취생활</h1>
			<h5 class="slider_txt2">프로 자취러를 위한 식료품 가격비교 서비스</h5>
			<div class="slider_search_area">
				<form action="search.do" method="get">
					<input class="img_slider_search" name="keyword" type="search" placeholder="검색어를 입력하세요.">
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
						<li class="pop on" id="pop1">
							<a href="#">
								<div class="num">1</div>
								<span class="pk">파인애플</span>
								<span class="rank_chg">▲</span>
							</a>
						</li>
						<li class="pop" id="pop2">
							<a href="#">
								<div class="num">2</div>
								<span class="pk">삼겹살</span>
								<span class="rank_chg">-</span>
							</a>
						</li>
						<li class="pop" id="pop3">
							<a href="#">
								<div class="num">3</div>
								<span class="pk">딸기</span>
								<span class="rank_chg">▼</span>
							</a>
						</li>
						<li class="pop" id="pop4">
							<a href="#">
								<div class="num">4</div>
								<span class="pk">인절미떡</span>
								<span class="rank_chg">-</span>
							</a>
						</li>
						<li class="pop"  id="pop5">
							<a href="#">
								<div class="num">5</div>
								<span class="pk">하리보 젤리</span>
								<span class="rank_chg">-</span>
							</a>
						</li>
						<li class="pop" id="pop6">
							<a href="#">
								<div class="num">6</div>
								<span class="pk">허니 뻥이요</span>
								<span class="rank_chg">▲</span>
							</a>
						</li>
						<li class="pop" id="pop7">
							<a href="#">
								<div class="num">7</div>
								<span class="pk">파인애플</span>
								<span class="rank_chg">▲</span>
							</a>
						</li>
						<li class="pop" id="pop8">
							<a href="#">
								<div class="num">8</div>
								<span class="pk">참외</span>
								<span class="rank_chg">▼</span>
							</a>
						</li>
						<li class="pop" id="pop9">
							<a href="#">
								<div class="num">9</div>
								<span class="pk">삼다수</span>
								<span class="rank_chg">▲</span>
							</a>
						</li>
						<li class="pop" id="pop10">
							<a href="#">
								<div class="num">10</div>
								<span class="pk">신라면</span>
								<span class="rank_chg">▲</span>
							</a>
						</li>
					</ol>
				</div>
				<!-- 연관검색어 (우측) -->
				<div class="col-md-6 rk_area ftco-animate">
					<p class="mt-5">그래프 담당자님 여기다가 그래프 넣으시면 됩니다</p>
				</div>
			</div>
		</div>
	</section>
	
	<!-- ================================== PROMOTION VER2 ================================== -->	
	<section class="ftco-section">
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

	<!-- ================================== FOOTER ================================== -->
    <tiles:insertAttribute name="footer"/>
  
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  
  <!-- 실시간 인기검색어 -->
  <script>
		$(function () {
			$('.popular_keyword li').hover(function(){
				$('.popular_keyword li:not(this)').removeClass('on');
				$(this).addClass('on');
			});

		});
  </script>
    
  </body>
</html>
