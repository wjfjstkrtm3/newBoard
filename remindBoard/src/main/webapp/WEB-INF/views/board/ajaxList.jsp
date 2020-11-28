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

	
		
			var inputHtml = "<div>번호</div><div>제목</div><div>작성자</div><div>작성일</div><div>조회수</div>";
			var btnHtml = "";
			$(".main-container").append(inputHtml);	

			// 처음 게시물을 불러올때
			addBoardList(1);
			
			var currentNum = "";
			var prevBtn = "";
			var nextBtn = "";


			// 동적으로 만들어진 page버튼에 대해서 event
			$(document).on("click", "#ajax-pageNumberId", function(event) {
						$(".main-container").empty();
						$(".page-number").empty();

						inputHtml = "<div>번호</div><div>제목</div><div>작성자</div><div>작성일</div><div>조회수</div>";
						$(".main-container").append(inputHtml);	
								
						currentNum = $(this).text();

						
						addBoardList(currentNum);
						
				});


			$(document).on("click", ".next_btn", function(event) {
				var endPageNum = $(".hidden_next_val").val();
				endPageNum = parseInt(endPageNum) + parseInt(1);
				addBoardList(endPageNum);

			});

			$(document).on("click", ".prev_btn", function(event) {
				var startPageNum = $(".hidden_prev_val").val();
				startPageNum = parseInt(startPageNum) + parseInt(-1);
				addBoardList(startPageNum);

			});

	
			
		
	function addBoardList(currentNum) {
		$(".main-container").empty();
		$(".page-number").empty();
		inputHtml = "<div>번호</div><div>제목</div><div>작성자</div><div>작성일</div><div>조회수</div>";
		$(".main-container").append(inputHtml);	
		
			// 게시물 List 불러오기
				$.ajax({
					url:"/board/ajaxBoardList?num=" + currentNum,
					type:"GET",
					dataType:"JSON",
					success:function(data) {
						if(data != null) {
						var listHtml = "";
						var pageHtml = "";
						var boardList = data.list;
						var pageDto = data.page;
						prevBtn = pageDto.prev;
						nextBtn = pageDto.next;
						
						var aa = 1;
						// 이전 버튼 생성
						if(pageDto.prev == true) {
							pageHtml += "<div class='prev_btn'>" + "《" + "</div>";
							pageHtml += "<input type='hidden' class='hidden_prev_val' value='" + pageDto.startPageNum + "'>";
						}


						// 페이지 버튼 생성 함수
						for(var i = pageDto.startPageNum; i <= pageDto.endPageNum; i++) {
							if(currentNum == i) {
							pageHtml += "<div class='ajax-pageNumber number-bold' id='ajax-pageNumberId'>" + i +"</div>";
								
								}else {
									pageHtml += "<div class='ajax-pageNumber' id='ajax-pageNumberId'>" + i +"</div>";
									}
							}
						

						// 다음 버튼 생성
						if(pageDto.next == true) {
							// pageHtml += "<div class='next_btn' onclick='nextFunction(" + pageDto.endPageNum +")';" + ">" + "》" + "</div>";
							pageHtml += "<div class='next_btn'>" + "》" + "</div>";
							pageHtml += "<input type='hidden' class='hidden_next_val' value='" + pageDto.endPageNum + "'>";
						
						}

					
						
						
						$.each(boardList, function(index, element) {
															
							listHtml = "<div class='board-bno'><span class='board-bno-text'>" + element.bno + "</span></div>";
							listHtml += "<div class='board-title'><span class='board-title-text'><a href='/board/detail?bno=" + element.bno +  "'" + ">" + element.title + "</a></span></div>";
							listHtml += "<div class='board-writer'><span class='board-writer-text'>" + element.writer +"</span></div>";
							listHtml += "<div class='board-regDate'><span class='board-regDate-text'>" + element.regDate + "</span></div>";
							listHtml += "<div class='board-viewCnt'><span class='board-viewCnt-text'>" + element.viewCnt + "</span></div>";
								$(".main-container").append(listHtml);	
							});
							
						
							}

						$(".page-number").append(pageHtml);

						
						},
					error:function(xhr) {
						console.log(xhr.status + xhr.statusText);
						}
	

						
					});

				// 게시물 불러오기 끝

		
		};

	// 함수 끝
			
			
			
			
			
			/*
			// list, page 따로 불러오고
			// page에 따라서 list가 달라져야한다
				$.ajax({
					url:"/board/ajaxPaging",
					type:"GET",
					data: "",
					dataType:"JSON",
					success:function(data) {
						var html = "";
						var page = data;
						var prevHtml = "";
						// 이전버튼
						console.log(page.prev);
						if(page.prev == true) {
							prevHtml = "<a href='/board/listPageSearch?num=" + page.startPageNum-1 + "'" + ">" + "《 " + "</a>";
							}
							$(".page-number").append(prevHtml);






									
						},
					error:function(xhr) {
						console.log(xhr.status + xhr.statusText);
						}
					
					});	


				*/	

		
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
				
		
		</div>
		
		<div class="bottom-container">
			<div class="page-number">
			
			
			
			</div>
			<input type="button" class="board-write-btn btn-primary" value="글쓰기">
		
		
		</div>
	
	</div>



</body>
</html>