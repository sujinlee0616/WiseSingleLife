<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- jQuery, Bootstrap JS. -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- <script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.cmtUpdtBtn').click(function(){
		$('.cmtUpdateArea').hide();
		$('.cmtReplyArea').hide();
		var no=$(this).attr("data-no");
		$('#m'+no).show();
	})
	$('.cmtReplyBtn').click(function(){
		$('.cmtUpdateArea').hide();
		$('.cmtReplyArea').hide();
		var no=$(this).attr("data-no");
		$('#u'+no).show();
	})
	
});
</script>
</head>
<body>
<!--============================= Start of BOARD DETAIL =============================-->
<section class="board-block pb-1 light-bg">
  <div class="container">
    <div class="py-3">
      <div class="table-responsive">
        <!-- ============================ Start of 상세보기 ============================ -->
        <table class="table replyBoard reply_detail">				
	        <thead>
	            <tr>
	                <th class="subject px-3" colspan="4">${vo.title }</td>
	            </tr>
	            <tr>
	                <td>
	                  <span class="bd_detail_dt">작성자: ${vo.author } </span>
	                </td>
	                <td>
	                  <span class="td_del">|</span>
	                  <span class="bd_detail_dt px-2">
					        작성일: ${vo.regdate }
					  </span>
	                </td>
	                <td>
	                  <span class="td_del">|</span>
	                  <span class="bd_detail_dt px-2">조회수: ${vo.hit } </span>
	                </td>
	                <td>
	                  <span class="td_del">|</span>
	                  <span class="bd_detail_dt px-2">답글 수: 0<%-- ${vo.depth } --%></span>
	                </td>
	            </tr>
	        </thead>
            <tbody>
              <tr>
                <!-- 본문 -->
                <td class="content py-4 px-4" colspan="4">
                  	<!-- 본문입니다 -->
                  	<pre>${vo.content }</pre>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <a class="bdDtBtn" id="copyUrl" href="">url 복사</a>
                </td>
                <td colspan="2">
                  <div class="bdDtBtnGp">
	                  <a class="bdDtBtn" href="board.do">목록</a>
	                  <a class="bdDtBtn" href="board_update.do?no=${vo.no }">수정</a>
	                  <a class="bdDtBtn" href="board_delete.do?no=${vo.no }">삭제</a>
	                  <%-- <a class="bdDtBtn" href="../board/reply.do?pno=${vo.no }">답글</a> --%>
                  </div>
                </td>
              </tr>
            </tbody>
        </table>
        <!-- ============================ End of 상세보기 ============================ -->
        <!-- ====================== Start of 댓글 영역 ======================  -->
        <div class="replyBoard cmt_area">
          <div>
            <h6 class="cmt_num py-2 px-1">${commentCount }개의 댓글</h6>
          </div>
          <hr class="cmt_line">
          <!-- ====================== 댓글 작성 영역 ====================== -->
          <div class="write_cmt">
          	<!-- =============== 로그인 한 경우 =============== -->
        	<div class="logged_in">
              <form method="post" action="board_reply_insert.do">
	              <div class="writer_info">
	              	<input type="hidden" name="no" value="${vo.no }">
	              </div>
	              <div>
	                <div style="float: left; width: 22%;">
	                  <span style="margin-left: 19px;">닉네임</span>
	                  <input type="text" style="display: block; margin: 0px auto;" name="id">
	                  <span style="margin-left: 19px;" name="pwd">비밀번호</span>
	                  <input type="password" style="display: block; margin: 0px auto;" name="pwd">
	                </div>
	              	<textarea name="msg" class="cmt_input" placeholder="건전한 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 내용은 입력을 지양해주세요."></textarea>
	              	<input type="submit" class="cmtBtn" value="등록">
	              </div>
              </form>
            </div>
            
          </div>
          <!-- ====================== 댓글 노출 영역 ====================== -->
          <!-- 데이터 연동 O  -->
          <c:forEach var="rvo" items="${rlist }" >
           	<hr class="cmt_line">
	          <div class="cmt">
	          	<!-- 1. ID,작성일, 댓글에 대한 액션 버튼 영역 -->
	            <div class="writer_info">
	              <%-- <c:if test="${cvo.group_tab==0 }"> --%>
		              <span class="writer_nm">${rvo.id }</span>
		              <span class="write_time pl-1">${rvo.regdate }</span>
	              <%-- </c:if> --%>
	              <%-- <c:if test="${cvo.group_tab>0 }">
		              <span class="writer_nm" style="margin-left:30px;">
		              <img src="../images/icon_reply.gif" class="mr-2">${cvo.userid }</span>
		              <span class="write_time pl-1">${cvo.regdate }</span>
	              </c:if> --%>
	              <div class="cmtActions">
		              <span class="cmtActionBtn cmtReplyBtn pl-1" data-no="${rvo.rno }">답글</span>
			          <span class="cmtActionBtn cmtUpdtBtn pl-1" data-no="${rvo.rno }">수정</span>
			          <a class="cmtActionBtn" href="../board/comment_delete.do?bno=${rvo.no }&rno=${cvo.rno }">삭제</a>
	              </div>
	            </div>
	            <!-- 2. 댓글 내용 영역 -->
	            <div class="cmt_content pt-2 pl-1">
	            	<!-- 댓글내용 -->
	            	<%-- <c:if test="${cvo.group_tab==0 }"> --%><!-- 아직 rno아님 수정해야함 -->
		            	<pre class="mb-0" id="before_update_cno${rvo.rno }"
			            	 style="font-size: 14px; white-space: pre-wrap; font-family: Nanum Gothic;">${rvo.msg }</pre>
	            	<%-- </c:if> --%>
	            	<%-- <c:if test="${cvo.group_tab>0 }">
		            	<pre class="mb-0" id="before_update_cno${cvo.cno }"
		            	 style="font-size: 14px; white-space: pre-wrap; font-family: Nanum Gothic; margin-left: 50px; width: calc(92% - 50px);">${cvo.content }</pre>
	            	 </c:if> --%>
	            	<!-- 수정하기 버튼 클릭 시 -->
	            	<form method="POST" action="board_reply_update.do">
	            		<div class="cmtUpdateArea" id="m${rvo.rno }" style="display:none;">
	            			<hr class="cmt_line">
	            			<input type="hidden" name="no" value="${rvo.no }">
	            			<input type="hidden" name="rno" value="${rvo.rno }">
	            			<div style="float: left; width: 22%;">
	                  			<span style="margin-left: 19px;" name="pwd">비밀번호</span>
	                  			<input type="password" style="display: block; margin: 0px auto;" name="pwd">
	                		</div>
		            		<textarea name="msg" class="cmt_input" placeholder="건전한 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 내용은 입력을 지양해주세요.">${rvo.msg }</textarea>
			            	<button type="submit" class="cmtBtn">수정<br>완료</button>
		            	</div>
	            	</form>
	            </div>
	            <div class="logged_in">
		              <form method="post" action="board_reReply_insert.do">
		              	<div class="cmtReplyArea" id="u${rvo.rno }" style="display:none;">
		              	  <hr class="cmt_line">
		              	  <input type="hidden" name="no" value="${rvo.no }">
		              	  <input type="hidden" name="rno" value="${rvo.rno }">
			              <div style="float: left; width: 22%;">
	                  		<span style="margin-left: 19px;">닉네임</span>
	                  		<input type="text" style="display: block; margin: 0px auto;" name="id">
	                  		<span style="margin-left: 19px;" name="pwd">비밀번호</span>
	                  		<input type="password" style="display: block; margin: 0px auto;" name="pwd">
	                	  </div>
	              		  <textarea name="msg" class="cmt_input" placeholder="건전한 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 내용은 입력을 지양해주세요."></textarea>
			              <button type="submit" class="cmtBtn">답글<br>등록</button>
			          	</div>
		              </form>
		        </div>
	            
	            <!-- [대댓글 작성 버튼 클릭 시] -->
	          	<!-- =============== 로그인 한 경우 =============== -->
	          	<%-- <c:if test="${sessionScope.id!=null }">
		        	<div class="logged_in">
		              <form method="post" action="../board/comment_reply.do">
		              	<div class="cmtReplyArea" id="try_to_reply_cno${cvo.cno }" style="display:none;">
		              	  <input type="hidden" name="bno" value="${cvo.bno }">
		              	  <input type="hidden" name="parentCno" value="${cvo.cno }">
		              	  <hr>
			              <div class="writer_info ml-5">
			                <span class="writer_nm">${sessionScope.id}</span>
			              </div>
			              <textarea name="cmtContent" class="cmt_input" 
			              style="margin-left: 50px; width: calc(92% - 50px);"
			              placeholder="건전한 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 내용은 입력을 지양해주세요."></textarea>
			              <button type="submit" class="cmtBtn">답글<br>등록</button>
			          	</div>
		              </form>
		            </div>
	            </c:if>
	            <!-- =============== 로그인 안 한 경우 =============== -->
				<c:if test="${sessionScope.id==null }">
		            <div class="logged_in">
		              <div class="cmtReplyArea" id="try_to_reply_cno${cvo.cno }" style="display:none;">
		              	  <hr>
			              <textarea name="cmt" class="cmt_input disabled" 
			              style="margin-left: 50px; width: calc(92% - 50px);"
			              placeholder="회원만 댓글을 작성할 수 있습니다. 댓글을 작성하고 싶으시다면 로그인 해주세요." disabled></textarea>
			              <button class="cmtBtn" disabled>등록</button>
		              </div>
		            </div>
	          	</c:if> --%>
	            
	          </div>
          </c:forEach>
        </div>
    <!-- ============================= End of 댓글 영역  ============================= -->
  </div>
</section>
<!--============================= End of BOARD DETAIL =============================-->

<!--============================= Start of BOARD LIST =============================-->
    <%-- <section class="board-block light-bg">
        <div class="container py-5">
			<div class="row">
                <div class="col-md-12">
                    <h5>자유게시판</h5>
                    <p class="board_count">총 <span class="countNum">${contentsCnt }개</span></p>
                </div>
            </div>
			<div class="py-3">
				<div class="table-responsive">
					<table class="table replyBoard reply_list" style="background-color: #FFFFFF;">						
						<thead class="thead-dark">
							<tr style="background-color: #E0E0E0;">
								<th scope="col" style="width:7%;" class="text-center">No.</th>
								<th scope="col" style="width:53%;" class="text-center">제목</th>
								<th scope="col" style="width:15%;" class="text-center">이름</th>
								<th scope="col" style="width:15%;" class="text-center">작성일</th>
								<th scope="col" style="width:10%;" class="text-center">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list }">
								<tr>
									<td class="text-center">${vo.bno }</td>
									<td>
										<!-- ============= Start of 제목  ============= -->
										<!-- 답글이면 아이콘 붙임 -->
										<c:if test="${vo.group_tab>0 }">
						  					<c:forEach var="i" begin="1" end="${vo.group_tab }" step="1">
						  						&nbsp;&nbsp;
						  					</c:forEach>
						  					<img src="../images/icon_reply.gif">
						  				</c:if>
										<a href="detail.do?page=${curpage }&bno=${vo.bno }">${vo.bsubject }<span class="cmtListCount">&nbsp;(${vo.cmtCount })</span></a>
										<!-- 공지 글에는 공지 플래그 붙임 -->
										<c:if test="${vo.notice=='y'}">
											<span class="badge badge-gray ml-2" id="">공지</span>
										</c:if>
										<!-- 오늘 올린글에는 new 플래그 붙임 -->
										<div style="display:none;">
											<fmt:formatDate var="reg_dt" value="${vo.regdate}" pattern="yyyy-MM-dd"/>
										</div>
										<c:if test="${today<=reg_dt}">
											<span class="badge badge-lightgray ml-2" id="">NEW</span>
										</c:if>
										<!-- ============= End of 제목  ============= -->
									</td>
									<td class="text-center">${vo.bname }</td>
									<td class="text-center">
										<fmt:formatDate value="${vo.regdate }" pattern="yyyy.MM.dd hh:mm"/>
									</td>
									<td class="text-center">${vo.hit }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
            <div class="row">
                <div class="col-md-12">
                    <div class="inBtn pb-2">
                        <a class="insertBtn" href="../board/insert.do">
                            글쓰기
                        </a>
                    </div>
                </div>
            </div>
	        <!-- ================ Pagination ================ -->
			<div>
				<nav aria-label="...">
					<ul class="pagination justify-content-center">
						<c:if test="${startpage>10 }">
							<li class="page-item">
								<a class="page-link" href="../board/list.do?page=1" aria-label="Previous"> 
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="../board/list.do?page=${startpage-10 }" aria-label="Previous"> 
									<span aria-hidden="true">&lt;</span>
								</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${startpage }" end="${endpage }">
							<c:if test="${i!=curpage }">
								<li class="page-item">
									<a class="page-link" href="../board/list.do?page=${i }">${i }</a>
								</li>
							</c:if>
							<c:if test="${i==curpage }">
								<li class="page-item active">
									<a class="page-link" href="../board/list.do?page=${i }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${totalpage>10 && (totalpage-startpage)>9 }">
							<li class="page-item">
								<a class="page-link" href="../board/list.do?page=${endpage+1 }" aria-label="Next"> 
									<span aria-hidden="true">&gt;</span> 
								</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="../board/list.do?page=${totalpage }" aria-label="Next"> 
									<span aria-hidden="true">&raquo;</span> 
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>			
		</div>
    </section> --%>
<!--============================= End of BOARD LIST =============================-->


</body>
</html>
