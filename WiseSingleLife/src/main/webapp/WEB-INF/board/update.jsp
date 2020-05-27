<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="board-block light-bg">
        <div class="container py-5">
			<div class="row">
                <div class="col-md-6">
                    <h5>글 수정하기</h5>
                </div>
            </div>
			<div class="py-3">
					 <form method=post action="board_update_ok.do">
					 <!-- action: insert_ok.jsp 에서 데이터 받아서 처리 -->
						 <div class="table-responsive">
							<table class="table replyBoard reply_insert">
							<tbody>
								<input type="hidden" name="no" id="no" value=${vo.no }>
								<tr>
									<th class="text-right success">이름</th>
									<td><input type="text" name="author" id="author" required autofocus value="${vo.author }"></td>
								</tr>
								<tr>
									<th class="text-right success">제목</th>
									<td><input type="text" name="title" id="title" required value="${vo.title }"></td>
								</tr>
								<tr>
									<th class="text-right success">내용</th>
									<td>
										<textarea type="text" name="content" id="content" class="update_ct" required>${vo.content }</textarea>
									</td>
								</tr>
								<tr>
									<th class="text-right success">비밀번호</th>
									<td>
										<input type="password" name="pwd" id="pwd" required value="">
										<div id="pwd_check_result" class="mt-2"></div>
									</td>
								</tr>
							</tbody>
							</table>
						 </div>
						 <div class="board-btn-wrap">
						 	<input type="button" value="취소" class="btn btn-cancle" onclick="javascript:history.back()">
							<input type="submit" id="updateBtn" value="수정 완료" class="btn btn-danger">
						 </div>
					</form>
			</div>
		</div>
    </section>
<!-- jQuery, Bootstrap JS. -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// 비번 입력 안 한 경우 수정완료버튼 비활성화 
	var pwdInput=$('#pwd').val();
	if(pwdInput.trim()==''){
		$('#updateBtn').attr('disabled', true);
		$('#pwd_check_result').html("<span style=\"color:#ff3a6d;\">비밀번호를 입력해주세요.</font>");
	}
	else{
		$('#updateBtn').attr('disabled', false);
	}

	// 비번 입력 시 비번이 맞는지 체크
	$('#pwd').keyup(function(){
		var user_input_pwd=$(this).val();
		console.log(user_input_pwd);
		var no=$('#no').val();

		$.ajax({
			type:'POST',
			url:'board_pwd_check.do',
			data:{"pwd":user_input_pwd,"no":no}, 
			success:function(result)
			{
				var pwdCheck=result.trim();
				if(pwdCheck=="true"){
					$('#pwd_check_result').html("<span style=\"color: #1976D2;\">비밀번호가 맞습니다. 수정할 수 있습니다.</font>");
					$('#updateBtn').attr('disabled', false);
				}
				else{
					$('#pwd_check_result').html("<span style=\"color:#ff3a6d;\">비밀번호가 틀립니다.</font>");
					$('#updateBtn').attr('disabled', true);
				}
			},
			error:function(e){
				alert(e);
			}
		})
		
	});
	
	// 수정 완료하기
	/* $('#updateBtn').click(function(){
		var author=$('#author').val();
		var title=$('#title').val();
		var content=$('#content').val();
		var pwd=$('#pwd').val();
		var no=$('#no').val();
		
		$.ajax({
			type:'POST',
			url:'board_update_ok.do',
			data:{"author":author,"title":title,"content":content,"pwd":pwd,"no":no},
			success:function(res)
			{
				console.log(title); // 이거뜨면 성공
			}
			
		})
	}); */
});
</script>
<!-- <script type="text/javascript">
$(function(){	
	$('#updateBtn').click(function(){
		var author=$('#author').val();
		var title=$('#title').val();
		var content=$('#content').val();
		var pwd=$('#pwd').val();
		var no=$('#no').val();
		
		$.ajax({
			type:'POST',
			url:'board_update_ok.do',
			data:{"author":author,"title":title,"content":content,"pwd":pwd,"no":no},
			success:function(res)
			{
				if(res=="NOPWD")
				{
					alert("비밀번호가 틀렸습니다!");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href="board_detail.do?no="+no;
				}
			}
		})
	});
})
</script> -->
</body>
</html>