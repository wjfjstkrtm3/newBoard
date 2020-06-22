<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#findId-container {
	display:flex;
	flex-direction:column;
	border:2px solid black;
	align-items:center;
}

#loginForm {
	margin-left:auto;
}

#buttonForm {
	display:flex;
	margin-top: 30px;
}

#btnForm {

}
</style>
<script type="text/javascript">
	$(document).ready(function() {
			$("#input_pwd").hide();		
			$("#temporary_password").hide();
		$("#find_btn").on("click", function() {
			var sendForm = $("#send_form").serializeArray();
				$.ajax({
					url:"/user/userFindPassword",
					type:"POST",
					data: sendForm,
					success:function(data) {
						if(data == 0) {
							alert("아이디 또는 이메일을 다시 확인해주세요!");
							} else {
							alert("임시 비밀번호가 발급되었습니다. 확인해주세요");
							$("#idValue").val($("#findIdById").val());
							$("#findBtn_div").empty();

							var html = "";
							html+= "<span id='input_pwd'>임시 비밀번호 입력</span>";
							html+="<div><input type='text' id='temporary_password' style='width:250px'></div>";
							$("#findBtn_div").append(html);
							//$("#input_pwd").show();
							//$("#temporary_password").show();


							
							$("#findBtn_div").append("<button id='confirm_btn'>확인</button>");							
							$("#findBtn_div").append("<button id='cancel_btn'>취소</button>");							
								}
						
						},
					error:function(xhr) {
						console.log(xhr.status + "||" + xhr.statusText);
						}
					});
				
			});

		$(document).on("click", "#confirm_btn", function() {
			$.ajax({
				url:"/user/temporaryPassword",
				type:"POST",
				data:{"id":$("#findIdById").val(), "temporaryPassword":$("#temporary_password").val()},
				success:function(data) {
					if(data == 1) {
						alert("임시 비밀번호가 일치합니다. 새로운 비밀번호를 입력해주세요");
						$("#findId-container").empty();
						var html = "";
						html += "<span>새로운 비밀번호</span>";
						html += "<div><input type='password' id='newPassword'></div>";
						html += "<span>새로운 비밀번호 확인</span>";
						html += "<div><input type='password' id='newPasswordCheck'></div>";
						html += "<div id='passwordCheck'></div>";
						html += "<div><button id='changePwdBtn'>변경</button><button id='changePwdCancelBtn'>취소</button></div>";
						
						$("#findId-container").append(html);

						
						} else {
						alert("임시 비밀번호가 일치하지않습니다. 다시 입력해주세요");
							}
					},
				error:function(xhr) {
					console.log(xhr.status + "||" + xhr.statusText);
					}

				});
			});

		$(document).on("click", "#cancel_btn", function() {
			history.go(-1);
			});

		$(document).on("click", "#changePwdCancelBtn", function() {
			history.go(-1);
			});
		
		});

	
	
		$(document).on("click", "#changePwdBtn", function() {
			var newPassword = $("#newPassword").val();
			var newPasswordCheck = $("#newPasswordCheck").val(); 
			
			
		
			if(newPassword == newPasswordCheck) {
			$.ajax({
				url:"/user/changePwd",
				type:"POST",
				data:{"id": $("#idValue").val(),"password":$("#newPassword").val()},
				success:function(data) {
					if(data == 1) {
						alert("비밀번호가 변경되었습니다. 변경된 비밀번호로 로그인해주세요");
						location.href="/";
						}
					},
				error:function(xhr) {
					console.log(xhr.status + "||" + xhr.statusText);
					}
				
				});
				} else {
					alert("비밀번호가 서로 다르게 입력되었습니다");
					
					}
				
			});

</script>
</head>
<body>

<div id="findId-container"> 
	<div><span>비밀번호 찾기</span></div>
	<form action="/user/userFindPassword" id="send_form" method="POST">
	<div>
	<span>아이디</span>
	<input type="text" id="findIdById" name="id" style="width:250px" placeholder="아이디를 입력하세요">
	<span>이메일</span>
	<input type="text" id="findIdByEmail" name="email" style="width:250px" placeholder="이메일을 입력하세요">
	
	</div>
	</form>
	
	<div id="buttonForm">
	<div id="findBtn_div"><button id="find_btn">찾기</button><button id="cancel_btn">취소</button></div>
	</div>
<div id="loginForm"><a href="/">로그인 하러가기</a></div>
</div>
<input type="hidden" id="idValue">
</body>
</html>