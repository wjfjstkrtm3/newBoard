<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li>
	<a href="/board/boardListPageSearch?num=1">게시물 페이징</a>
	</li>
	<li>
	<a href="/login/home">홈으로</a>
	</li>
	<li>
	<a href="#" id="list_btn">게시판 목록</a>
	</li>
	<li>
	<a href="/board/boardWrite">글 작성</a>
	</li>
	<sec:authorize access="hasRole('ROLE_ADMIN')" >
	<li>
	<a href="/admin/home">관리자 페이지</a>
	</li>	
	</sec:authorize>
	<li>
	<a href="/user/toDoList">to-Do-List</a>
	</li>
	
	
</ul>

<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name="";
	if(principal != null) {
		name = auth.getName();
	}
%>

<sec:authorize access="isAuthenticated()">
	<h5><%=name %>님 반갑습니다 *^^*</h5>
	<form action="/logout" method="POST" id="logout_form">
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
       <a href="#" onclick="document.getElementById('logout_form').submit();">로그아웃</a>
     </form>
</sec:authorize>


</body>
</html>