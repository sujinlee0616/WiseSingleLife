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
<<<<<<< HEAD
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
=======
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
    <!-- boardCSS -->
    <link rel="stylesheet" href="css/board.css">
    <link rel="stylesheet" href="css/swiper.min.css">
    <!-- MainCSS -->
	<link rel="stylesheet" href="css/main.css">
	<!-- Board CSS -->
    <link rel="stylesheet" href="css/board.css">
>>>>>>> branch 'dev' of https://github.com/sujinlee0616/WiseSingleLife
  </head>
  <body>
    <!-- ================================ NAVBAR ================================ -->
    <tiles:insertAttribute name="nav"/>
    <!-- END nav -->

<<<<<<< HEAD
	<!-- ================================ IMAGE SLIDER ================================ -->
    <section class="home-slider owl-carousel">
	  <div class="slider-item" style="background-image:url(images/grocery_store_1.jpg);">
		<div class="container">
			<h1 class="slider_txt1">슬기로운 자취생활</h1>
			<h5 class="slider_txt2">프로 자취러를 위한 식료품 가격비교 서비스</h5>
			<div class="slider_search_area">
				<input class="img_slider_search" type="search" placeholder="검색어를 입력하세요.">
				<button class="sliderBtn">검색</button>
			</div>
		</div>
		<!-- overlay 대신 bg-img를 이미지 자체를 수정해서 투명도 높은 검은색 레이어 하나 올리자 -->
      	<!-- <div class="overlay"></div> -->
      </div>

	  <div class="slider-item" style="background-image:url(images/grocery_store_2.jpg);">
		<div class="container">
			<h1 class="slider_txt1">슬기로운 자취생활</h1>
			<h5 class="slider_txt2">프로 자취러를 위한 식료품 가격비교 서비스</h5>
			<div class="slider_search_area">
				<input class="img_slider_search" type="search" placeholder="검색어를 입력하세요.">
				<button class="sliderBtn">검색</button>
			</div>
		</div>
		<!-- overlay 대신 bg-img를 이미지 자체를 수정해서 투명도 높은 검은색 레이어 하나 올리자 -->
      	<!-- <div class="overlay"></div> -->
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
		  <a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000355090" target="_blank" class="block-20" style="background-image: url('images/images_1.jpg');">
		  </a>
		  <div class="text mt-3 d-block">
			<h3 class="heading mt-3">
				<a href="#">[이마트] 이번 주 이마트 전단 광고</a>
			</h3>
			<!-- <div class="meta mb-3">
			  <div><a href="#">Dec 6, 2018</a></div>
			  <div><a href="#">Admin</a></div>
			  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
			</div> -->
		  </div>
		</div>
	  </div>
	  <div class="col-md-3 d-flex ftco-animate">
		<div class="blog-entry align-self-stretch">
		  <a href="http://emart.ssg.com/event/eventDetail.ssg?promId=1100526737" target="_blank" class="block-20" style="background-image: url('images/images_2.jpg');">
		  </a>
		  <div class="text mt-3">
			<h3 class="heading mt-3">
				<a href="#">[이마트] 홈핑&홈크닉은 Emartmall life</a>
			</h3>
			<!-- <div class="meta mb-3">
			  <div><a href="#">Dec 6, 2018</a></div>
			  <div><a href="#">Admin</a></div>
			  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
			</div> -->
		  </div>
		</div>
	  </div>
	  <div class="col-md-3 d-flex ftco-animate">
		<div class="blog-entry align-self-stretch">
		  <a href="http://www.homeplus.co.kr/app.exhibition.eplacard.Eplacard.ghs?comm=usr.eplacard.inf&WT.ac=Main_GNB_leaflet" target="_blank" class="block-20" style="background-image: url('images/images_3.jpg');">
		  </a>
		  <div class="text mt-3">
			<h3 class="heading mt-3"><a href="#">[홈플러스] 이번 주 홈플러스 전단</a></h3>
			<!-- <div class="meta mb-3">
			  <div><a href="#">Dec 6, 2018</a></div>
			  <div><a href="#">Admin</a></div>
			  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
			</div> -->
		  </div>
		</div>
	  </div>
	  <div class="col-md-3 d-flex ftco-animate">
		<div class="blog-entry align-self-stretch">
		  <a href="blog-single.html" class="block-20" style="background-image: url('images/images_4.jpg');">
		  </a>
		  <div class="text mt-3">
			<h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
			<!-- <div class="meta mb-3">
			  <div><a href="#">Dec 6, 2018</a></div>
			  <div><a href="#">Admin</a></div>
			  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
			</div> -->
		  </div>
		</div>
	  </div>
	  <div class="col-md-3 d-flex ftco-animate">
		<div class="blog-entry align-self-stretch">
		  <a href="blog-single.html" class="block-20" style="background-image: url('images/images_5.jpg');">
		  </a>
		  <div class="text mt-3 d-block">
			<h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
			<!-- <div class="meta mb-3">
			  <div><a href="#">Dec 6, 2018</a></div>
			  <div><a href="#">Admin</a></div>
			  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
			</div> -->
		  </div>
		</div>
	  </div>
	  <div class="col-md-3 d-flex ftco-animate">
		<div class="blog-entry align-self-stretch">
		  <a href="blog-single.html" class="block-20" style="background-image: url('images/images_6.jpg');">
		  </a>
		  <div class="text mt-3">
			<h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
			<!-- <div class="meta mb-3">
			  <div><a href="#">Dec 6, 2018</a></div>
			  <div><a href="#">Admin</a></div>
			  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
			</div> -->
		  </div>
		</div>
	  </div>
	  <div class="col-md-3 d-flex ftco-animate">
		<div class="blog-entry align-self-stretch">
		  <a href="blog-single.html" class="block-20" style="background-image: url('images/image_7.jpg');">
		  </a>
		  <div class="text mt-3">
			<h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
			<!-- <div class="meta mb-3">
			  <div><a href="#">Dec 6, 2018</a></div>
			  <div><a href="#">Admin</a></div>
			  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
			</div> -->
		  </div>
		</div>
	  </div>
	  <div class="col-md-3 d-flex ftco-animate">
		<div class="blog-entry align-self-stretch">
		  <a href="blog-single.html" class="block-20" style="background-image: url('images/image_6.jpg');">
		  </a>
		  <div class="text mt-3">
			<h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
			<!-- <div class="meta mb-3">
			  <div><a href="#">Dec 6, 2018</a></div>
			  <div><a href="#">Admin</a></div>
			  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
			</div> -->
		  </div>
		</div>
	  </div>
	</div>
	
	</div>
	</section>	

	
=======
	<!-- ================================ CONTENT ================================ -->
	<tiles:insertAttribute name="content"/>
	<!-- ======================== END CONTENT ====================== -->
>>>>>>> branch 'dev' of https://github.com/sujinlee0616/WiseSingleLife

	<!-- ================================== FOOTER ================================== -->
    <tiles:insertAttribute name="footer"/>
    <!-- ============================= END FOOTER =============================== -->
    
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<<<<<<< HEAD
  <script src="${pageContext.request.contextPath}/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js/main.js"></script>
=======
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <!-- Swipper Slider JS -->
  <script src="js/swiper.min.js"></script>
  
  <!-- 실시간 인기검색어 -->
  <script>
		$(function () {
			$('.popular_keyword li').hover(function(){
				$('.popular_keyword li:not(this)').removeClass('on');
				$(this).addClass('on');
			});

		});
  </script>
  
  <script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
  </script>
>>>>>>> branch 'dev' of https://github.com/sujinlee0616/WiseSingleLife
    
  </body>
</html>