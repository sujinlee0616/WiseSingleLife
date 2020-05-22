<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="vo" items="${ list }">
	<div class="col-md-3 d-flex ftco-animate">
		<div class="blog-entry align-self-stretch">
		  <a href="recipe/detail.do?no=${ vo.no }" class="block-20" style="background-image: url('${ vo.poster }');">
		  </a>
		  <div class="text mt-3 d-block">
				<a href="recipe/detail.do?no=${ vo.no }">
					<h3 class="heading mt-3 event">${ vo.title }</h3>
				</a>
				<h6 class="text-right">${ vo.chef }</h6>
		  </div>
		</div>
	  </div>
</c:forEach>