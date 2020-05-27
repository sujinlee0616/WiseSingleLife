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
        <div class="container py-5">
        	<div class="deleteArea">
	        	<div class="row justify-content-center pb-3">
					<div class="col-md-7 heading-section text-center ftco-animate">
		  				<h2 class="mb-4">글 삭제</h2>
					</div>
				</div>
				<div class="py-3">
						<form method="post" action="board_delete_ok.do">
							 <div class="table-responsive">
								<table class="table replyBoard reply_insert">
								<tbody>
									<input type="hidden" name="no" id="no" value=${vo.no }>
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
								<input type="submit" value="삭제" class="btn btn-danger" id="deleteBtn">		
							 </div>
						</form>
				</div>
        	</div>
		</div>
    </section>
<!-- Script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){

	// 비번 입력 안 한 경우 수정완료버튼 비활성화 
	var pwdInput=$('#pwd').val();
	if(pwdInput.trim()==''){
		$('#deleteBtn').attr('disabled', true);
		$('#pwd_check_result').html("<span style=\"color:#ff3a6d;\">비밀번호를 입력해주세요.</font>");
	}
	else{
		$('#deleteBtn').attr('disabled', false);
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
					$('#pwd_check_result').html("<span style=\"color: #1976D2;\">비밀번호가 맞습니다. 삭제할 수 있습니다.</font>");
					$('#deleteBtn').attr('disabled', false);
				}
				else{
					$('#pwd_check_result').html("<span style=\"color:#ff3a6d;\">비밀번호가 틀립니다.</font>");
					$('#deleteBtn').attr('disabled', true);
				}
			},
			error:function(e){
				alert(e);
			}
		})
	});
	
	
});
</script>
</body>
</html>