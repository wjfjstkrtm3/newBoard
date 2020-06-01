<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			$("#list_btn").click(function() {
					location.href="/board/boardListPageSearch?num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}";
				})
		})
		
		

</script>
</head>
<body>

<c:set var="detail" value="${one}"></c:set>
<div>
<%@include file="../include/nav.jsp"%>

</div>
	
	제목 : <input type="text" name="title" value="${detail.title}" readonly="readonly">
	내용 : <input type="text" name="content" value="${detail.content}" readonly="readonly">
	글쓴이 : <input type="text" name="writer" value="${detail.writer}" readonly="readonly">
<div>
	<a href="/board/boardUpdate?bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">수정페이지 이동</a>

</div>

</body>
</html>