<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/login" method="POST">
	아이디 : <input type="text" name="user_id" id="user_id">
	비밀번호  : <input type="password" name="user_pwd" id="user_pwd">
	<input type="submit" name="submit" value="로그인">
	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
	<a href="#">회원가입</a>
	</form>
</body>
</html>