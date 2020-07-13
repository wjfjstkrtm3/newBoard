<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그리드 연습</title>
<style type="text/css">

html, body {
	width:100%;
	height:100%;
}

.table_container {
	
}

.table_tr {
	display:grid;	
	grid-template-columns:repeat(auto-fill, minmax(20%, auto));
	background-color:orange;
	
}

.testa {
	display:grid;
}
.testa >span:nth-child(1) {
	background-color:red;
}

</style>
</head>
<body>
	<div class="table_container">
		<div class="table_tr">  
		<span>번호</span>
		<span>제목</span>
		<span>작성일</span>
		<span>작성자</span>
		<span>조회수</span>
		
		<c:forEach var="list" items="${list}">
		<span>${list.bno}</span>
		<span>${list.title}</span>
		<span>${list.regDate}</span>
		<span>${list.writer }</span>
		<span>${list.viewCnt }</span>
		</c:forEach>
		</div>
		
		
	</div>
		<div class="testa">
		<span>a</span>
		<span>b</span>
		<span>c</span>
		<span>d</span>
		
	</div>

</body>
</html>