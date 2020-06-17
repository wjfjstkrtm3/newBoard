<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script type="text/javascript">

	$(document).ready(function() {
	
			$("#search_btn").click(function() {
			var searchType = $("#searchType").val();
			var keyword = $("#keyword").val();
			location.href = "/board/boardListPageSearch?num=1&searchType=" + searchType + "&keyword=" + keyword; 
				})
		})
		

</script>


</head>
<body>
	<div>
	<%@ include file="../include/nav.jsp" %>
	</div>
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
			<td><a href="/board/boardDetail?bno=${list.bno}&num=${select}&searchType=${sc.searchType}&keyword=${sc.keyword}">${list.title}</a></td>
			<td>${list.regDate}</td>
			<td>${list.writer}</td>
			<td>${list.viewCnt}</td>
		
		</tr>
		</c:forEach>
		
		
	</table>

<div>
	<c:if test="${page.prev}">
		<span>[<a href="/board/boardListPageSearch?num=${page.startPageNum-1}&searchType=${sc.searchType}&keyword=${sc.keyword}">이전</a>]</span>
	</c:if>
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<c:if test="${select==num}">
		<a href="/board/boardListPageSearch?num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}"><b>${num}</b></a>
		</c:if>
		<c:if test="${select!=num}">
		<a href="/board/boardListPageSearch?num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">${num}</a>
		</c:if>
	</c:forEach>
	<c:if test="${page.next}">
		<span>[<a href="/board/boardListPageSearch?num=${page.endPageNum+1}&searchType=${sc.searchType}&keyword=${sc.keyword}">다음</a>]</span>
	
	</c:if>

	<%-- <c:forEach begin="1" end="${pageNum}" var="num">
		<a href="/board/boardListPage?num=${num}">[${num}]</a>
	</c:forEach> --%>
<div>
	
	<select name="searchType" id="searchType">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="title_content">제목+내용</option>
		<option value="writer">작성자</option>
	</select>
	
	<input type="text" name="keyword" id="keyword">
	
	<input type="submit" value="검색" id="search_btn">
</div>	
	
</div>



</body>
</html>