<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/board/detail.css">
</head>
<body>
<c:set var="board" value="${boardDto}"/>

${board.bno}
${board.title}
${board.writer}
${board.content}
${board.regDate}
${board.viewCnt}


<a href="/board/delete?bno=${board.bno}">삭제</a> 
<a href="/board/update?bno=${board.bno}">수정</a> 


</body>
</html>