<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var menuHtml = "";
			$.ajax({
					url:"/admin/getBoardTitleList",
					type:"POST",
					success:function(data) {
						console.log(data);
					$.each(data, function(index, element) {
						// menu 게시판 제목 등록
						menuHtml += "<div class='board-title'><a href='/admin/goBoardById?id=" + element.id + "'>" + element.type + "</a></div>";
						});
					
					$(".main-content-menu-items").append(menuHtml);
					
					},
					
					error:function(xhr) {
					console.log(xhr.status + "/" + xhr.statusText);
						}
				});
		
			

		
		});

</script>
</head>
<body>
	<div class="board-type title">
		${boardType.type}	
	</div>
	<div class="flex-container">
	
	<!-- 게시물 검색 -->	
		<div class="top-container">
			<div class="board-count-form">
				<span class="board-count">
					총 <span class="">777건</span>의 게시물
				</span>
			</div>
			<div class="search-form">
				<select class="search-title" name="search-title">
					<option value="none">== 선택 ==</option>
											<!-- 검색했을때 검색조건이 남게 -->
					<option value="title" <c:if test="">selected</c:if>>제목</option>
					<option value="content" <c:if test="">selected</c:if>>내용</option>
					<option value="title-content" <c:if test="">selected</c:if>>제목 + 내용</option>
					<option value="writer" <c:if test="">selected</c:if>>글쓴이</option>
				</select>
				
																		<!-- 검색했을때 검색어가 남게 -->
				<input type="text" class="text-box" id="text-box" value="${page.keyword}">
				<input type="button" class="search-btn" value="검색">
			
			</div>
			
		
		
		</div>
		
	<!-- 게시물 검색 끝 -->
	
	
	
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
		
		<div class="bottom-container">
			<div class="page-number">
			
			
			
			</div>
			<input type="button" class="board-write-btn btn-primary" value="글쓰기">
		
		
		</div>
	
	</div>



</body>
</html>