<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {

			$(document).on("click", "[class^=bList_]", function(event) {
						var bno = $(this).find(".bList-bno").val();
						location.href = "/board/detail?bno=" + bno;
				});

		
		});


</script>

<body>
<c:set var="list" value="${bookMarkList}"/>
	<div class="bookMark-title">
		북마크 한 글	
	</div>
	
		<div class="bookMark-searchForm">
			<input type="text" class="bookMark-text-form" placeholder="제목으로 검색">
			<input type="button" value="검색" class="bookMark-searchBtn">
		</div>
		
	<div class="bookMark-container">
		
	
		<div class="bookMark-form">
				<c:forEach var="b" items="${list}" varStatus="status">
					
						<div class="bList_${status.index}">
								<div class="bList-title_${status.index}">${b.title}</div>
								<div class="bList-content_${status.index}">${b.content}</div>
								<input type="hidden" value="${b.bno}" class="bList-bno">
						</div>
				</c:forEach>
		
		</div>			
	
	
	</div>
</body>
</html>