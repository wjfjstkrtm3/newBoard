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

	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		
		<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.bno}</td>
			<td><a href="/board/boardDetail?bno=${list.bno}">${list.title}</a></td>
			<td>${list.regDate}</td>
			<td>${list.writer}</td>
			<td>${list.viewCnt}</td>
		
		</tr>
		</c:forEach>
		
		
	</table>

<div>
	<c:forEach begin="1" end="${pageNum}" var="num">
		<a href="/board/boardListPage?num=${num}">[${num}]</a>
	
	</c:forEach>

</div>



</body>
</html>