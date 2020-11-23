<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="login-container">
			<!-- 기본 action= /login, method="POST" -->
	<form action="/login" method="POST" class="login-form">
		<div class="login-userId-form">	
			<!-- 기본 name = username -->
			<input type="text" name="userId" class="login-userId" placeholder="아이디">
		</div>
		
		<div class="login-userPwd-form">	
			<!-- 기본 name = password -->
			<input type="password" name="userPwd" class="login-userPwd" placeholder="비밀번호">
		</div>
		
		<div class="login-btn-form">
			<input type="submit" value="로그인" class="login-btn">
		</div>
		
		<input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
			
		
	</form>
</div>	
	
	
</body>
</html>