<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="${path}/resources/css/board/list.css"> --%>
<%-- <script type="text/javascript" src="${path}/resources/js/board/list.js"></script> --%>
<script type="text/javascript">
	$(document).ready(function() {

			/* 게시물 검색 .. */
			$(".search-btn").on("click", function() {
						var searchType = $("select[name=search-title]").val();
						var keyword = $(".text-box").val();
						var searchData = {
									"searchType":searchType,
									"keyword":keyword
								};
						console.log(searchData);
					location.href="/board/listPageSearch?num=1&searchType=" + searchType + "&keyword=" + keyword;	
						
				});
			$(".board-write-btn").on("click", function() {
				location.href="/board/write";
				});


		});


</script>
</head>
<body>
	<div class="board-category">
		일반게시판
	</div>
	<div class="flex-container">
	
		<!-- 게시물 검색 -->	
		<div class="top-container">
			<div class="board-count-form">
				<span class="board-count">
					총 <span class="">${page.count}건</span>의 게시물
				</span>
			</div>
			<div class="search-form">
				<select class="search-title" name="search-title">
					<option value="none">== 선택 ==</option>
											<!-- 검색했을때 검색조건이 남게 -->
					<option value="title" <c:if test="${page.searchType == 'title'}">selected</c:if>>제목</option>
					<option value="content" <c:if test="${page.searchType == 'content'}">selected</c:if>>내용</option>
					<option value="title-content" <c:if test="${page.searchType == 'title-content'}">selected</c:if>>제목 + 내용</option>
					<option value="writer" <c:if test="${page.searchType == 'writer'}">selected</c:if>>글쓴이</option>
				</select>
				
																		<!-- 검색했을때 검색어가 남게 -->
				<input type="text" class="text-box" id="text-box" value="${page.keyword}">
				<input type="button" class="search-btn" value="검색">
			
			</div>
			
		
		
		</div>
		
		<!-- 게시물 검색 끝 -->
	
		<!-- 게시물 리스트 -->
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
				<div class="board-regDate">
				<span class="board-regDate-text">
				<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/>
				</span>
				</div>
				<div class="board-viewCnt"><span class="board-viewCnt-text">${list.viewCnt}</span></div>
			
			
			</c:forEach>
		
		
		</div>
		
		<!-- 게시물 리스트 끝 -->
	
	
		<!-- 페이징 부분 -->
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
					<a href="/board/listPageSearch?num=${page.startPageNum-1}c">《</a>
				</c:if>
				
				
				<c:forEach var="pageNumber" begin="${page.startPageNum}" end="${page.endPageNum}">
					<c:choose>
						<c:when test="${pageNumber == currentNum}">					
							<a class="currentNum-bold" href="/board/listPageSearch?num=${pageNumber}${page.searchWord}">${pageNumber}</a>
						</c:when>
						<c:otherwise>
							<a href="/board/listPageSearch?num=${pageNumber}${page.searchWord}">${pageNumber}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 다음버튼 -->
				<c:if test="${page.next}">
					<a href="/board/listPageSearch?num=${page.endPageNum+1}${page.searchWord}">》</a>
				</c:if>			
			
			</div>
				<input type="button" class="board-write-btn btn-primary" value="글쓰기">
		
		
		</div>
		
		<!-- 페이징 부분 끝 -->
		

	
	
	</div>


</body>


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






</html>