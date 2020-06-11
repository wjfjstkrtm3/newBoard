<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authorize access="isAnonymous()">
	<form action="/login" method="POST">
	아이디 : <input type="text" name="user_id" id="user_id">
	비밀번호  : <input type="password" name="user_pwd" id="user_pwd">
	<input type="submit" name="submit" value="로그인">
	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
	<a href="/user/userSignUp">회원가입</a>
	</form>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
	<form action="/logout" method="POST" id="logout_form">
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
       <a href="#" onclick="document.getElementById('logout_form').submit();">로그아웃</a>
     </form>
	</sec:authorize>
	
	
	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    <font color="red">
        <p>아이디와 비밀번호를 다시 확인해주세요</p>
         ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
    </font>
</c:if>

	
</body>
</html>