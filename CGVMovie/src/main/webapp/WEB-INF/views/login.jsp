<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/login.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#guest_password, #guest_id").keyup(function(event) {
				if(event.which == 13) {
					$("#login_action_form").submit();
					}
			});
		
		
				$("#login_btn").on("click", function() {
					// document.login_action_form.submit();
					$("#login_action_form").submit();
					});
		
		});

</script>
</head>
<body>



<div class="grid-container-form">

<div class="grid-container">
	<div class="movie-image">
		영화 이미지 넣을곳
	</div>
	<div class="login-form">
	
		<div class="input-form">
		<div class="image-form"><img src="${path}/resources/imgs/cgv.jpg" class="cgv-image"><span class="login-span">로그인</span></div>
		<form action="/login" method="POST" name="login_action_form" id="login_action_form">
			<div><input type="text" name="id" placeholder="아이디" id="guest_id"></div>
			<div><input type="password" name="password" id="guest_password" placeholder="비밀번호"></div>
		</form>
		<div><input type="checkbox" name="idCheck" id="idCheck"><span>아이디 저장</span></div>
		<div><input type="button" value="로그인" id="login_btn"></div>
		<div><input type="button" value="회원가입"></div>
		</div>
		
		
		
		
		
	</div>


</div>
</div>







</body>
</html>