<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--============================= IMAGE SWIPER =============================-->
    <div>
        <!-- Swiper -->
        <div class="swiper-container">
            <div class="swiper-wrapper">

                <div class="swiper-slide">
                    <a href="images/reserve-slide2.jpg" class="grid image-link">
                        <img src="images/reserve-slide2.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide1.jpg" class="grid image-link">
                        <img src="images/reserve-slide1.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide3.jpg" class="grid image-link">
                        <img src="images/reserve-slide3.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide1.jpg" class="grid image-link">
                        <img src="images/reserve-slide1.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide2.jpg" class="grid image-link">
                        <img src="images/reserve-slide2.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="images/reserve-slide3.jpg" class="grid image-link">
                        <img src="images/reserve-slide3.jpg" class="img-fluid" alt="#">
                    </a>
                </div>
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination swiper-pagination-white"></div>
            <!-- Add Arrows -->
            <div class="swiper-button-next swiper-button-white"></div>
            <div class="swiper-button-prev swiper-button-white"></div>
        </div>
    </div>
<!-- end Slider -->    
<section class="board-block light-bg">
  <div class="container">
    <div class="row justify-content-center pb-3">
		<div class="col-md-7 heading-section text-center ftco-animate">
		  <h2 class="mb-4">게시판</h2>
		</div>
	</div>
	<div class="py-3">
	  <div class="table-responsive">
	    <table class="table replyBoard reply_list" style="background-color: #FFFFFF;">
	      <thead>
	         <tr>
		        <th scope="col" style="width:7%; color: #212529;" class="text-center">No.</th>
			    <th scope="col" style="width:53%; color: #212529;" class="text-center">제목</th>
			    <th scope="col" style="width:15%; color: #212529;" class="text-center">이름</th>
			    <th scope="col" style="width:15%; color: #212529;" class="text-center">작성일</th>
			    <th scope="col" style="width:10%; color: #212529;" class="text-center">조회수</th>
	         </tr>
	      </thead>
	      <tbody>
	       <c:forEach var="vo" items="${list }">
	         <tr>
	      		<td class="text-center" style="color: #212529;">${vo.no }</td>
	      		<td style="color: #212529;">
	      		  <a href="#">${vo.title }<span class="cmtListCount">&nbsp;</span></a>
	      		</td>
	      		<td class="text-center" style="color: #212529;">${vo.author }</td>
	      		<td class="text-center" style="color: #212529;">
	      		  <fmt:formatDate value="${vo.regdate }" pattern="yyyy.MM.dd hh:mm"/>
	      		</td>
	      		<td class="text-center" style="color: #212529;">${vo.hit }</td>
	      	 </tr>
	       </c:forEach>
	      </tbody>
	    </table>
	  </div>
	</div>
	<div class="row">
        <div class="col-md-12">
            <div class="inBtn pb-2">
            	<a class="insertBtn" href="#">
                            글쓰기
            	</a>
        	</div>
    	</div>
    </div>
  </div>
  <!-- 페이지 들어가야함 -->
  <div class="mt-3">
	  <nav aria-label="...">
		<ul class="pagination justify-content-center">
			<c:if test="${startpage>1 }">
			    <li class="page-item">
			      <a class="page-link" aria-label="Previous" href="../web/board.do?page=${startpage-1 }">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			</c:if>
			<c:set var="type" value=""/>
			<c:forEach var="i" begin="${startpage }" end="${endpage }">
			  <c:if test="${curpage==i }">
			    <c:set var="type" value="class=\"page-item active\""/>
			  </c:if>
			  <c:if test="${curpage!=i }">
			    <c:set var="type" value="class=page-item"/>
			  </c:if>
			  <li ${type }>
			    <a class="page-link" href="../web/board.do?page=${i }">${i }</a>
			  </li>
			</c:forEach>
			<c:if test="${endpage<allpage }">
			  <li class="page-item">
				<a class="page-link" href="../web/board.do?page=${endpage+1 }" aria-label="Next"> 
				  <span aria-hidden="true">&raquo;</span> 
				  <span class="sr-only">Next</span>
				</a>
			  </li>
			</c:if>
		</ul>
	  </nav>
    </div>
</section>
</body>
</html>