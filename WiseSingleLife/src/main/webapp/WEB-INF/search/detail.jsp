<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<div class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${MaData_vo.img});">
					</div>
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
									<h1>${MaData_vo.price }원</h1>
									<span style="color:red;">
										${MaData_vo.unitprice }
									</span>
								</td>
							</tr>
							<tr class="tags">
								<td>
									<a href="#"><h4 style="color: orange;">#${MaData_vo.keyword }</h4></a>
								</td>
							</tr>
							<tr>
								<td class="block-23-detail">
									상품코드 : <b>${MaData_vo.productcode }</b>
								</td>
							</tr>
							<tr>
								<td>등록일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${MaData_vo.lookuptime}"></fmt:formatDate></td>
							</tr>
							<tr>
								<td>
									<a href="#" class="btn bnt-sm btn-info" style="text-align: right;" onclick="history.back();">목록으로</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<c:forEach var="rvo" items="list">
						<div class="col-md-3">
							<img src="https://shopping-phinf.pstatic.net/main_5761002/5761002283.20150128173135.jpg?type=f200">
							<div>
								<h4>제목</h4>
							</div>
							<div>
								<sub>등록한 사람</sub>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	<section class="ftco-section ftco-counter-detail" id="section-counter-detail">
    		<div class="row justify-content-center">
    			<div class="col-md-10">
		    	<div class="row">
		    		<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<!-- Codeno 와 관련된 레시피 카운트 -->
		                <span>SearchCount</span>
		                <strong class="number">${MaData_vo.searchCount }</strong>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              <!-- 평점 -->
		                <span>RATE</span>
		                <strong class="number" id="rate">${MaData_vo.rate}</strong>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              <!-- 전체 리뷰 수 -->
		                <span>ReviewCount</span>
		                <strong class="number">${MaData_vo.reviewcount}</strong>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              <!-- (codeno가 같은) 전체 상품 수 -->
		                <span>Products</span>
		                <strong class="number" >${MaData_vo.productsCount }</strong>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    </section>
  <!-- loader -->
  <!--  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
	-->
  </body>
</html>