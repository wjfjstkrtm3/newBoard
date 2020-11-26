<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/user/signUp.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var userId = "";
		
		$(".idCheckBtn").on("click", function() {
				userId = $(".signUp-id-text").val();

				$.ajax(
						{
							url:"/user/userIdCheck",
							type:"GET",
							dataType:"text",
							data:{id:userId},
							success:function(data) {
								console.log(data);
								if(data == 1) {
									alert("중복된 아이디 입니다");
									$(".signUp-id-text").focus();
									$(".idCheckValue").val("duplicated_id");
								} else {
									alert("사용 가능한 아이디 입니다");
									$(".signUp-id-pwd").focus();
									$(".idCheckValue").val("");
									}
								
								},
							error:function(xhr) {
								console.log(xhr.status + xhr.statusText);
								}
						}

					 );
			});

		$(".signUpBtn").on("click", function(event) {
				var idCheckValue = $(".idCheckValue").val();

				if(idCheckValue == "duplicated_id") {
						event.preventDefault();
						alert("아이디 중복확인을 해주세요");
					} else {
						$(".signUpBtn").submit();
						}
				
				
			});
		
		

		
	});



</script>
</head>
<body>
	<div class="signUp-container">
		<form action="/user/signUp" method="POST" class="signUp-form" enctype="multipart/form-data">
				<div class="signUp-image">
						<div class="signUp-image-form"><img src="${path}/resources/imgs/default.png" class="default-image"></div>
						<input type="file" name="file01" class="file-select">
				</div>
				
				<div class="signUp-id">
					<input type="text" class="signUp-id-text" placeholder="아이디" name="id">
					<input type="button" class="idCheckBtn" value="중복확인">
				</div>
					<!-- <input type="button" value="중복확인" class="idCheckBtn"> -->
				
				<div class="signUp-pwd">
					<input type="password" class="signUp-id-pwd" placeholder="비밀번호" name="password">
				</div>
				
				<div class="signUp-email">
					<input type="text" class="signUp-id-email" placeholder="이메일" name="email">
				</div>
				
				<div class="signUp-phoneNumber">
					<input type="text" class="signUp-id-phoneNumber" placeholder="핸드폰 번호" name="phoneNumber">
				</div>
				
				<div class="signUp-gender">
					<div class="gender-men"><span>남</span><input type="radio" value="men" name="gender"></div>
					<div class="gender-woman"><span>여</span><input type="radio" value="woman" name="gender"></div>
					
				</div>
		
				<div class="signUp-btn-form">
					<input type="submit" value="회원가입" class="signUpBtn">
				</div>
				
		</form>
	
		<input type="hidden" value="" class="idCheckValue">
	
	
	
	
	
	
	</div>





</body>
</html>