<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${path}/resources/css/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var idCheckResult = false;
		var imgArray = [];
		$.ajax({
			url:"/movieImg",
			type:"POST",
			success:function(data) {
				$.each(data, function(index, item) {
						imgArray.push(item.img);
					});
				console.log(imgArray.length);
				const randomNumber = Math.round((Math.random() * imgArray.length));
				console.log("number : " + randomNumber);
				$("#movie_image_form").attr("src", imgArray[randomNumber]);
				
				},
				error:function(request,status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		          }
			});

			$("#duplicate-btn").on("click", function() {
				var userId = $("#userId").val();
				if(userId.trim() == "") {
					alert("아이디를 입력해주세요");
					return;
					}
				console.log(userId);
				$.ajax({
					url:"/guest/idCheck",
					type:"POST",
					data:{"userId":userId},
					success:function(data) {
						console.log("data : " + data);
						if(data == 1) {
							alert("중복된 아이디 입니다");
							idCheckResult = false;
							
							} else {
							alert("사용가능한 아이디 입니다");
							idCheckResult = true;
								}
						},
					error:function(error) {
						console.log(error.status + "||" + error.statusText);
						}
					});
				});

			$("#signBtn").on("click", function() {
					console.log("idCheckResult : " + idCheckResult);
					
					
					if(idCheckResult == true) {
						var userId = $("#userId").val();
						var userPassword = $("#userPassword").val();
						var userEmail = $("#userEmail").val();
						var userPhoneNumber = $("#userPhoneNumber").val();
						var userFormData = {"id":userId, "password":userPassword, "email":userEmail, "phoneNumber":userPhoneNumber};
						var userData = JSON.stringify(userFormData);
						
						$.ajax({
							url:"/guest/signUpProcess",
							type:"POST",
							data:userData,
							contentType:"application/json; chartset=utf-8",
							success:function(data) {
								alert("회원가입이 완료되었습니다");
								location.href="/";
								},
							error:function(xhr) {
								console.log(xhr.status + "||" + xhr.statusText);
								}
							});
						} else {
							alert("아이디 중복확인을 해주세요");
							}
					
						 

				
				});


		
		});


</script>




</head>
<body>
<div class="grid-container-form">

<div class="grid-container">
	<div class="movie-image">
		<img src="" id="movie_image_form" class="image-size">
	</div>
	
	
	<div class="signUp-form">
	<input type="button" value="중복확인" id="duplicate-btn">
		<div class="signUp-image-form">
			<img src="${path}/resources/imgs/cgv.jpg">
		</div>
		<div class="signUp-id">
			<input type="text" name="userId" placeholder="아이디" id="userId">
			
		</div>
		<div class="signUp-password">
			<input type="password" name="userPassword" placeholder="비밀번호" id="userPassword">
		</div>
		<div class="signUp-email">
			<input type="text" name="userEmail" placeholder="이메일" id="userEmail">
		</div>
		<div class="signUp-phoneNumber">
			<input type="text" name="userPhoneNumber" placeholder="핸드폰" id="userPhoneNumber">
		</div>
		<div class="signUp-btn">
			<input type="button" name="userBtn" value="가입하기" id="signBtn">
		
		</div>
		
		
		
		
	</div>
	


</div>
</div>
</body>
</html>