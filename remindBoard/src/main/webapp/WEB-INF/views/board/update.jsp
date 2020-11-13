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
<c:set var="board" value="${boardDto}"/>

<form action="/board/update" method="POST">
	제목 : <input type="text" id="board-update-title" class="board-update-title" name="title" value="${board.title}">
	내용 : <input type="text" id="board-update-content" class="board-update-content" name="content" value="${board.content}">
		 <input type="hidden" name="bno" value="${board.bno}">
	<input type="submit" value="수정">

</form>







</body>
</html>