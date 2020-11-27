<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비동기 게시판</title>
<script type="text/javascript">
	$(document).ready(function() {
				$.ajax({
					url:"/board/ajaxBoardList",
					type:"GET",
					dataType:"JSON",
					success:function(data) {
						console.log(data);
						if(data != null) {
						var html = "";
						$.each(data, function(index, element) {
							console.log(element.bno);
							console.log(index);
								html = "<div class='board-bno'><span class='board-bno-text'>" + element.bno + "</span></div>";
								html += "<div class='board-title'><span class='board-title-text'><a href='/board/detail?bno=" + element.bno +  "'" + ">" + element.title + "</a></span></div>";
								html += "<div class='board-writer'><span class='board-writer-text'>" + element.writer +"</span></div>";
								html += "<div class='board-regDate'><span class='board-regDate-text'>" + element.regDate + "</span></div>";
								html += "<div class='board-viewCnt'><span class='board-viewCnt-text'>" + element.viewCnt + "</span></div>";
								$(".main-container").append(html);	
							});
							
						
							}

						

						
						},
					error:function(xhr) {
						console.log(xhr.status + xhr.statusText);
						}
	
					
					})	
		

		
		});


</script>
</head>
<body>
<div class="board-category">
		비동기 게시판
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
		
		
		
		
		
		</div>
		
		<div class="bottom-container">
			
		
		
		</div>
	
	</div>




</body>
</html>