<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/userSignUp" method="POST">
	아이디 : <input type="text" name="id"><br>
	비밀번호 : <input type="password" name="password"><br>
	이름 : <input type="text" name="name"><br>
	이메일: <input type="text" name="email"><br>
	전화번호 : <input type="text" name="phoneNumber">
	<input type="submit" value="회원가입">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>


</body>
</html>