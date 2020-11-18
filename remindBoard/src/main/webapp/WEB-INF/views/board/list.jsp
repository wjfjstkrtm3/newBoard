<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/board/list.css">
<script type="text/javascript">
	$(document).ready(function() {
				$(".submitBtn").click(callback);

			function callback() {
					alert("ㅎㅇㅎㅇ");
				};
		
		});

</script>
</head>
	
	<div class="flex-container">
	
		<div class="top-container">
			<div class="board-count-form">
				<span class="board-count">
					총 <span class="">${page.count}건</span>의 게시물
				</span>
			</div>
			<div class="search-form">
				<select class="search-title">
					<option value="none">== 선택 ==</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="title-content">제목 + 내용</option>
					<option value="writer">글쓴이</option>
					
				
				
				</select>
				<input type="text" class="text-box" id="text-box">
				<input type="button" class="search-btn" value="검색">
			
			</div>
			
		
		
		</div>
	
		<div class="main-container">
			
				<div>번호</div>
				<div>제목</div>
				<div>작성자</div>
				<div>작성일</div>
				<div>조회수</div>
			<c:forEach var="list" items="${list}">
				<div class="board-bno"><span class="board-bno-text">${list.bno}</span></div>
				<div class="board-title">
				
				<span class="board-title-text"><a href="/board/detail?bno=${list.bno}">${list.title}</a></span>
				
				</div>
				<div class="board-writer"><span class="board-writer-text">${list.writer}</span></div>
				<div class="board-regDate"><span class="board-regDate-text">${list.regDate}</span></div>
				<div class="board-viewCnt"><span class="board-viewCnt-text">${list.viewCnt}</span></div>
			
			
			</c:forEach>
			
			
			
		
		
		
		</div>
	
		<div class="bottom-container">
			<%-- 
			<div class="page-number">
				<c:forEach var="pageNum" begin="1" end="${pageNum}">
					<c:choose>
						<c:when test="${currentNum == pageNum}">
							<a class="currentNum-bold" href="/board/list?num=${pageNum}">[${pageNum}]</a>
						</c:when>
						<c:otherwise>
							<a href="/board/list?num=${pageNum}">[${pageNum}]</a>
						</c:otherwise>					
					
					</c:choose>
				</c:forEach>
			</div> 
			--%>
			<div class="page-number">
				<!-- 이전 버튼 -->
				<c:if test="${page.prev}">
					<a href="/board/list?num=${page.startPageNum-1}">《</a>
				</c:if>
				
				
				<c:forEach var="pageNumber" begin="${page.startPageNum}" end="${page.endPageNum}">
					<c:choose>
						<c:when test="${pageNumber == currentNum}">					
							<a class="currentNum-bold" href="/board/list?num=${pageNumber}">${pageNumber}</a>
						</c:when>
						<c:otherwise>
							<a href="/board/list?num=${pageNumber}">${pageNumber}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음버튼 -->
				<c:if test="${page.next}">
					<a href="/board/list?num=${page.endPageNum+1}">》</a>
				</c:if>			
			
			</div>
		
		</div>
	
	
	</div>

<input type="button" class="submitBtn" value="테스트">

















<body>
<!-- 
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
	



 -->





</body>
</html>