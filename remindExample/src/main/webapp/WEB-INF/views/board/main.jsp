<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="boardList" items="${list}" >
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성자</td>
				<td>날짜</td>
				<td>조회수</td>
			</tr>
			
			<tr>
				<td>${boardList.bno}</td>
				<td>${boardList.title}</td>
				<td>${boardList.content}</td>
				<td>${boardList.writer}</td>
				<td>${boardList.regDate}</td>
				<td>${boardList.viewCnt}</td>
			</tr>
		</table>
	</c:forEach>

	<c:forEach begin="1" end="${pageNum}" var="num">
		<a href="/board/main?num=${num}">${num}</a>
	
	
	
	</c:forEach>


</body>
</html>