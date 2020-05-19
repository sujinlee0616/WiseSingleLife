<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
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
    <!-- SEARCH CSS -->
    <link rel="stylesheet" href="css/search.css">
  </head>
  <body>
    <!-- ================================ NAVBAR ================================ -->
    <tiles:insertAttribute name="nav"/>
    <!-- END nav -->

    <!-- ================================== FILTERS AND SAVE BTN================================== -->	
	<section class="ftco-search bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-12 search-wrap">
					<h2 class="heading h5 d-flex align-items-center pr-4"><span class="ion-ios-search mr-3"></span>상세검색</h2>
					<form action="#" class="search-property">
						<div class="row">
							<div class="col-md-2 align-items-end pl-0">
								<div class="form-group">
									<label for="#">마트</label>
									<div class="form-field">
										<div class="select-wrap">
											<div class="icon"><span class="ion-ios-arrow-down"></span></div>
											<select name="" id="" class="form-control">
												<option value="">전체</option>
												<option value="emart">이마트</option>
												<option value="homeplus">홈플러스</option>
												<option value="lotte">롯데마트</option>
												<option value="coupang">쿠팡</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<label for="#">정렬</label>
									<div class="form-field">
										<div class="select-wrap">
											<div class="icon"><span class="ion-ios-arrow-down"></span></div>
											<select name="" id="" class="form-control">
                                                <option value="pop">인기랭킹순</option>
												<option value="asc">가격낮은순</option>
												<option value="desc">가격높은순</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							
                            <!-- BUTTON -->
							<div class="col-md-2 align-self-end">
								<div class="form-group">
									<div class="form-field">
										<input type="submit" value="저장" class="form-control btn btn-primary">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
    
    <!-- ================================== CONTENTS================================== -->	    
    <section class="list-section mb-3 bg-light">
    	<div class="container">
			<!-- 결과 -->
			<div class="row">
				<table class="result">
					<tr class="mall_list">
						<td class="default">쇼핑몰 이름</td>
						<td class="td1">이마트</td>
						<td class="td2">롯데마트</td>
						<td class="td3">홈플러스</td>
						<td class="td4">쿠팡</td>
					</tr>
					<!-- ============================== ITEM1 ============================== -->
					<tr class="mall_result" id="product1">
						<td class="product_name">바나나 우유</td>
						<!-- =============== 1.이마트 =============== -->
						<td class="emart">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
							<!-- 더보기 버튼: 컨텐츠가 3개 초과일 경우 -->
							<button type="button" class="btn btn-block">+ 더 보기</button>
						</td>
						<!-- =============== 2.롯데마트 =============== -->
						<td class="lotte">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
						<!-- =============== 3.홈플러스 =============== -->
						<td class="homeplus">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
						<!-- =============== 4.쿠팡=============== -->
						<td class="coupang">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
					</tr>
					<!-- ============================== ITEM2 ============================== -->
					<tr class="mall_result" id="product1">
						<td class="product_name">삼양 까르보 불닭볶음면</td>
						<td class="emart">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shopping-phinf.pstatic.net/main_1304626/13046260762.20171221101956.jpg?type=f300">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">삼양 까르보 불닭볶음면 130g</p>
										<p class="price">950원</p>
									</a>
								</div>
							</div>
						</td>
						<td class="lotte">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20180912_218/syfood_153671034462456YVN_JPEG/19429203347270209_1392560495.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">삼양 까르보불닭볶음면 큰컵 105gx16입</p>
										<p class="price">16,800원</p>
									</a>
								</div>
							</div>
						</td>
						<td class="homeplus">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
						<td class="coupang">
							<div class="list_item">
								<div class="img">
									<a href="#">
										<img class="product_img" src="https://shop-phinf.pstatic.net/20200210_1/1581298075142K9f83_JPEG/18658813766617391_17493234.jpg?type=m510">
									</a>
								</div>
								<div class="info">
									<a href="#">
										<p class="product">매일유업 매일 바나나는 원래 하얗다 190ml</p>
										<p class="price">10,910원</p>
									</a>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<!-- 저장한 상품 -->
			<div class="row">
				<div class="saved">
					<h5 class="saved_title">저장한 상품</h5>
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
    
  </body>
</html>