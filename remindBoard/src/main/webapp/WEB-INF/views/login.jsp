<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/login/login.css">
</head>
<body>
<div class="login-container">
			<!-- 기본 action= /login, method="POST" -->
	<form action="/login" method="POST" class="login-form">
		<div class="login-image-form">
			<div class="login-image">
				<img src="${path}/resources/imgs/login.png" class="character-image">
		
			</div>
		</div>
	
		<div class="login-userIdPwd-form">	
			<!-- 기본 name = username -->
			<input type="text" name="userId" class="login-userId" placeholder="아이디">
			<!-- 기본 name = password -->
			<input type="password" name="userPwd" class="login-userPwd" placeholder="비밀번호">
			<div class="etc-form">
				<div class="checkbox-form">
					<input type="checkbox" class="remember_me">아이디 기억하기
				</div>
				<a href="#" class="user-signUp">회원가입</a>
			</div>
		</div>
		
		<div class="login-btn-form">
			<input type="submit" value="로그인" class="login-btn">
			
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			<div class="login-errorMessage">
			    <font color="red">
			        ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
			    </font>
		    </div>
		        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
		</c:if>
		</div>
		
		<input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
			
		


	</form>
</div>	
	
	
</body>
</html>