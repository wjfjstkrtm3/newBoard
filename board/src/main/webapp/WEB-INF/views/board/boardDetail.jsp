<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="detail" value="${one}"></c:set>
<div>
<%@include file="../include/nav.jsp"%>
</div>
<form action="" method="post">

	제목 : <input type="text" name="title" value="${detail.title}">
	내용 : <input type="text" name="content" value="${detail.content}">
	글쓴이 : <input type="text" name="writer" value="${detail.writer}">
	<input type="submit" value="전송하기">
</form>



</body>
</html>