<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="main.do">슬기로운 자취생활</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
		  </button>
		  <!-- ===== MENUS ===== -->
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="search.do" class="nav-link">가격비교</a></li>
	          <li class="nav-item"><a href="recipe.do" class="nav-link">레시피</a></li>
	          <li class="nav-item"><a href="board.do" class="nav-link">게시판</a></li>
	          <!-- <li class="nav-item cta"><a href="contact.html" class="nav-link ml-lg-2"><span class="icon-user"></span> Sign-In</a></li>
	          <li class="nav-item cta cta-colored"><a href="contact.html" class="nav-link"><span class="icon-pencil"></span> Sign-Up</a></li> -->
	        </ul>
	      </div>
		</div>
	</nav>
    <!-- END nav -->

	<!-- ================================== FILTERS AND SAVE BTN================================== -->	
	<section class="ftco-search bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-12 search-wrap">
					<h2 class="heading h5 d-flex align-items-center pr-4"><span class="ion-ios-search mr-3"></span>상세검색</h2>
					<form action="#" class="search-property">
						<div class="row">
							<div class="col-md-2 pl-0">
								<div class="form-group">
									<div class="form-field">
										<div class="select-wrap">
											<div class="icon"><span class="ion-ios-arrow-down"></span></div>
											<select name="" id="" class="form-control">
                                                <option value="pop">재료</option>
												<option value="asc">레시피 이름</option>
												<option value="desc">셰프 이름</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							
                            <!-- BUTTON
							<div class="col-md-2 align-self-end">
								<div class="form-group">
									<div class="form-field">
										<input type="submit" value="저장" class="form-control btn btn-primary">
									</div>
								</div>
							</div>-->
							
							<form action="search.do" method="get">
								<input class="img_slider_search" name="keyword" type="search" placeholder="검색어를 입력하세요.">
								<button class="sliderBtn">검색</button>
							</form>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
    
    
	
	<!-- ================================== PROMOTION VER2 ================================== -->	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">재료로 검색한 결과</span>
				  <h2 class="mb-4">시금치</h2>
				</div>
			</div>
			<div class="row d-flex">
				<c:forEach begin="1" end="12">
					<div class="col-md-3 d-flex ftco-animate">
						<div class="blog-entry align-self-stretch">
						  <a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000355090" target="_blank" class="block-20" style="background-image: url('https://recipe1.ezmember.co.kr/cache/recipe/2020/04/02/f94a91c3e171469938dfff2661782c2a1_m.png');">
						  </a>
						  <div class="text mt-3 d-block">
								<a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000355090" target="_blank">
									<h3 class="heading mt-3 event">임성근의 폭탄달걀찜, 달걀피클, 노른자장 - 알토란 276회</h3>
								</a>
						  </div>
						</div>
					  </div>
				</c:forEach>
			</div>
		</div>
	</section>	

	<!-- ================================== FOOTER ================================== -->
    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md">
            <div class="ftco-footer-widget">
              <h2 class="ftco-heading-2">최종 프로젝트 '슬기로운 자취생활'</h2>
			  <p class="mb-0"><b>팀원:
			  	</b><a href="https://github.com/sigk77">김용희,</a> 
				<a href="https://github.com/pch9501">박찬휘, </a>
				<a href="https://github.com/sujinlee0616/">이수진, </a>
				<a href="https://github.com/caskercasker">조우현, </a>
				<a href="https://github.com/juhongseon">주홍선, </a>
				<a href="https://github.com/ung6039">최웅, </a>
				<a href="https://github.com/hajieun1218">하지은</a> 
				(가나다순)</p>
			  <p class="mb-0"><b>Github Repository:</b><a href="https://github.com/sujinlee0616/WiseSingleLife" target="_blank">이 곳</a>을 클릭하세요.</p>
            </div>
          </div>          
        </div>
      </div>
    </footer>
  
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
