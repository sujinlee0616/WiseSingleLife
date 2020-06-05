<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Royal Estate - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
</head>
<body>

	<!-- END nav -->
	<section class="ftco-section ftc-no-pb">
		<div class="container">
			<div class="row no-gutters">
				<div
					class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center"
					style="background-image: url(${MaData_vo.img});"></div>
				<div class="col-md-7 wrap-about pb-md-5 ftco-animate">
					<div class="heading-section heading-section-wo-line mb-5 pl-md-5">
						<div class="pl-md-5 ml-md-5">
							<span class="subheading">${MaData_vo.brand }</span>
							<h2 class="mb-4">${MaData_vo.name }</h2>
						</div>
					</div>
					<table class="table px-md-5 ml-md-5">
						<tr class="text-left">
							<td class="td1 price">
								<h1>${MaData_vo.price }원</h1> <span style="color: red;">
									${MaData_vo.unitprice } </span>
							</td>
						</tr>
						<tr>
							<td class="block-23-detail">
								<ul>
									<li><b>${MaData_vo.productcode }</b></li>
									<li>등록일 : <fmt:formatDate pattern="yyyy-MM-dd"
											value="${MaData_vo.lookuptime}"></fmt:formatDate></li>
								</ul>
							</td>
						</tr>
						<tr class="tags">
							<td><a href="#"><h4 style="color: orange;">#${MaData_vo.keyword}</h4></a></td>
						</tr>
						<tr>
							<td><a href="#" class="btn bnt-sm btn-info"
								style="text-align: right;" onclick="history.back();">목록으로</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section ftco-counter-detail"
		id="section-counter-detail">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="row">
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<!-- Codeno 와 관련된 레시피 카운트 -->
								<span>SearchCount</span> <strong class="number">${MaData_vo.searchCount }</strong>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<!-- 평점 -->
								<span>RATE</span><strong class="number" id="rate">${MaData_vo.rate}</strong>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<!-- 전체 리뷰 수 -->
								<span>ReviewCount</span> <strong class="number">${MaData_vo.reviewcount}</strong>
							</div>
						</div>
					</div>
					<div
						class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<!-- (codeno가 같은) 전체 상품 수 -->
								<span>Products</span> <strong class="number">${MaData_vo.productsCount }</strong>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%--<section>
	  <div class="swiper-container">
				<c:forEach var="detail_rvo" items="${rlist }">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="${detail_rvo.poster}">
                    <div>
                    	<p>${detail_rvo.title }</p>
                    </div>
                </div>
           </div>
                </c:forEach>
     </div>
     </section> --%>
	<!--<section>
		<div class="container">
			<div class="row">
				<c:forEach var="detail_rvo" items="${rlist }">
				<div class="col-md-3">
					<div class="info-detail-recipe">
						<img src="${detail_rvo.poster}">
					</div>
					<div class="text">
						<p class="block-23-detail"><strong>${detail_rvo.title}</strong>&nbsp;&nbsp;&nbsp;<sub>${detail_rvo.chef}</sub></p>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>
	-->
	<!--  <section class="ftco-section-detail testimony-section-detail bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 ftco-animate">
					<div class="col-md-12">
						<div class="carousel-testimony owl-carousel ftco-owl">
							<div class="item">
								<div class="testimony-wrap py-4 pb-5">
									<div class="about-author d-flex p-4 bg-light">
						              <div class="bio align-self-md-center mr-4">
						               <img src="images/person_1.jpg" alt="Image placeholder" class="img-thumbnail mb-4">
										</div>
										<div class="desc align-self-md-center">
							                <h3>Lance Smith</h3>
							   			</div>
							         </div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	-->
	<!-- loader -->
	<!--  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
	-->
</body>
</html>