<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="board-block light-bg">
        <div class="container">
			<div class="row justify-content-center pb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
		  			<h2 class="mb-4">글쓰기</h2>
				</div>
			</div>
			<div class="py-3">
					<form method="post" action="board_insert_ok.do">
					 <!-- action: insert_ok.jsp 에서 데이터 받아서 처리 -->
						 <div class="table-responsive">
							<table class="table replyBoard reply_insert">
							<tbody>
								<tr>
									<th class="text-right success">이름</th>
									<td><input type="text" name="author" required autofocus></td>
								</tr>
								<tr>
									<th class="text-right success">제목</th>
									<td><input type="text" name="title" required></td>
								</tr>
								<tr>
									<th class="text-right success">내용</th>
									<td>
										<textarea type="text" name="content" class="update_ct" required></textarea>
									</td>
								</tr>
								<tr>
									<th class="text-right success">비밀번호</th>
									<td>
										<input type="password" name="pwd" required value="">
									</td>
								</tr>
							</tbody>
							</table>
						 </div>
						 <div class="board-btn-wrap">
						 	<input type="button" value="취소" class="btn btn-cancle" onclick="javascript:history.back()">
							<input type="submit" value="작성 완료" class="btn btn-danger">		
						 </div>
					</form>
			</div>
		</div>
    </section>
</body>
</html>