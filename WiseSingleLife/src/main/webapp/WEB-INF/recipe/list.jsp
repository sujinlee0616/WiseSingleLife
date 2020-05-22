<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ================================== FILTERS AND SAVE BTN================================== -->	
	<section class="ftco-search bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-12 search-wrap">
					<h2 class="heading h5 d-flex align-items-center pr-4"><span class="ion-ios-search mr-3"></span>상세검색</h2>
					<form action="recipe.do" class="search-property">
						<div class="row">
							<div class="col-md-2 pl-0">
								<div class="form-group">
									<div class="form-field">
										<div class="select-wrap">
											<div class="icon"><span class="ion-ios-arrow-down"></span></div>
											<select name="category" id="" class="form-control">
                                                <option value="레시피">레시피</option>
												<option value="재료">재료</option>
												<option value="셰프">셰프</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<input class="img_slider_search" name="keyword" type="search" placeholder="검색어를 입력하세요.">
							<button class="sliderBtn">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
    
    
	
	<!-- ================================== PROMOTION VER2 ================================== -->
	<c:if test="${ list ne null }">
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center mb-5 pb-3">
					<div class="col-md-7 heading-section text-center ftco-animate">
						<span class="subheading">${ category }로 검색한 결과</span>
					  <h2 class="mb-4">${ keyword }</h2>
					</div>
				</div>
				<div class="row d-flex">
					<c:forEach var="vo" items="${ list }">
						<div class="col-md-3 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch">
							  <a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000355090" target="_blank" class="block-20" style="background-image: url('${ vo.poster }');">
							  </a>
							  <div class="text mt-3 d-block">
									<a href="http://emart.ssg.com/planshop/detail.ssg?dispCmptId=6000355090" target="_blank">
										<h3 class="heading mt-3 event">${ vo.title }</h3>
									</a>
							  </div>
							</div>
						  </div>
					</c:forEach>
				</div>
			</div>
		</section>
	</c:if>
</body>
</html>