<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name="";
	if(principal != null) {
		name = auth.getName();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#top-container {
	display:flex;
	justify-content:space-around;
    border:2px solid orange;
    border-radius:20px;
}

#top-container a {
	border-right:2px solid orange;
	border-left:2px solid orange;
	text-decoration: none;
}

</style>
</head>
<body>
	<div id="top-container">
	<sec:authorize access="hasRole('ROLE_ADMIN')" >
	<a href="/admin/home">관리자 페이지</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<%=name %>님 반갑습니다 *^^*
	
	<a href="/board/boardListPageSearch?num=1">게시물 페이징</a>
	<a href="/login/home">홈으로</a>
	<a href="/user/scrap">북마크</a>
	<a href="/board/boardWrite">글 작성</a>
	<a href="/user/toDoList">to-Do-List</a>
	<a href="/user/info">내 정보</a>
	<a href="/crawler/news">크롤링</a>
	
	<form action="/logout" method="POST" id="logout_form">
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
       <a href="#" onclick="document.getElementById('logout_form').submit();">로그아웃</a>
     </form>
	</sec:authorize>

	
	
	

</div>






</body>
</html>