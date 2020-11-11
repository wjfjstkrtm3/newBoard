<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#currentNum {
	font-weight: bold;
}


</style>
</head>
<body>

	<table>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>시간</th>
			<th>조회수</th>
		</tr>
	
		<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.bno}</td>
			<td>${list.writer}</td>
			<td>${list.title}</td>
			<td>${list.content}</td>
			<td>${list.regDate}</td>
			<td>${list.viewCnt}</td>
		</tr>
		
		</c:forEach>
	</table>

		<c:forEach var="num" begin="1" end="${pageNum}">
			<c:choose>
				<c:when test="${currentNum == num}">
				   <a href="/board/list?num=${num}" id="currentNum">[${num}]</a>
				</c:when>
					<c:otherwise>
						<a href="/board/list?num=${num}">[${num}]</a>
					</c:otherwise>
			</c:choose>
		</c:forEach>
	









</body>
</html>