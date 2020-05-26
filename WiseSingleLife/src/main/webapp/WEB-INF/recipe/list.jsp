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
												<option value="레시피" <c:if test="${ category eq '레시피' }">selected</c:if>>레시피</option>
												<option value="재료" <c:if test="${ category eq '재료' }">selected</c:if>>재료</option>
												<option value="셰프" <c:if test="${ category eq '셰프' }">selected</c:if>>셰프</option>
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
				<div class="row d-flex" id="recipeListMoreTarget">
					<c:forEach var="vo" items="${ list }">
						<div class="col-md-3 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch">
							  <a href="recipe/detail.do?no=${ vo.no }" class="block-20" style="background-image: url('${ vo.poster }');">
							  </a>
							  <div class="text mt-3 d-block">
									<a href="recipe/detail.do?no=${ vo.no }">
										<h3 class="heading mt-3 event">${ vo.title }</h3>
									</a>
									<h5>
										<c:if test="${ vo.imgsrc ne null }">
											<img src="${ vo.imgsrc }" style="width: 30px; height: 30px; border-radius: 5px;">
										</c:if>
										<c:if test="${ vo.mname ne null }">&nbsp;${ vo.mname }</c:if>
										<c:if test="${ vo.amount ne null }"> : ${ vo.amount }</c:if>
									</h5>
									<h6 class="text-right">${ vo.chef }</h6>
							  </div>
							</div>
						  </div>
					</c:forEach>
				</div>
			</div>
		</section>
		<div class="container">
			<div class="row" style="margin-bottom: 50px;">
				<div class="col-md-6">
					<button style="background-color: #F4D047;" id="recipeListMoreBtn" data-category="${ category }" data-keyword="${ keyword }" type="button" class="btn btn-block moreBtn" data-toggle="modal" data-target="#moreBtn">▽ 더 보기 ( <span id="recipeListCurpage">${ curpage }</span> / <span id="recipeListTotalpage">${ totalpage }</span> )</button>
				</div>
				<div class="col-md-6">
					<button style="background-color: #F4D047;" onclick="javascript:window.scrollTo({top:0,behavior:'smooth'})" type="button" class="btn btn-block moreBtn" data-toggle="modal" data-target="#moreBtn">맨 위로 △</button>
				</div>
			</div>
		</div>
		<script src="js/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				if($('#recipeListCurpage').text()==$('#recipeListTotalpage').text()) {
					$('#recipeListMoreBtn').text('마지막 페이지');
					$('#recipeListMoreBtn').attr('disabled',true);
				}
				
				$('#recipeListMoreBtn').click(function(){
					var page = $('#recipeListCurpage').text();
					page = Number(page)+1;
					var category = $(this).attr('data-category');
					var keyword = $(this).attr('data-keyword');
					
					$.ajax({
						url:'recipe_more.do',
						type:'post',
						data:{category:category,page:page,keyword:keyword},
						success:function(res){
							$('#recipeListMoreTarget').append(res);
							$('#recipeListCurpage').text(page);
							var total = $('#recipeListTotalpage').text();
							if(page==total){
								$('#recipeListMoreBtn').text('마지막 페이지');
								$('#recipeListMoreBtn').attr('disabled',true);
							}
						}
					});
				});
			});
		</script>
	</c:if>
</body>
</html>