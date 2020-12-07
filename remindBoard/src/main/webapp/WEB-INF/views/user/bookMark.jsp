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

			$(".bookMark-searchBtn").on("click", function() {
					var searchText = $(".bookMark-text-form").val();
					var searchData = {"searchText":searchText};
					console.log(searchData);
					if(searchText.trim() === "") {
						alert("제목을 입력해주세요!!");
						return;
						}
					$.ajax({
								url:"/user/bookMarkSearch",
								type:"POST",
								data:searchData,
								success:function(data) {
									$(".bookMark-count").text("총 " + data.length + "개의 북마크");
									
									$(".bookMark-form").empty();
									var html = "";
									$.each(data, function(index, element) {
											html += "<div class='bList_" + index + "'>";
											html += "<div class='bList-title_" + index + "'>" + element.title + "</div>";
											html += "<div class='bList-content_" + index + "'>" + element.content + "</div>";
											html += "<input type='hidden' value='" + element.bno + "' class='bList-bno'>";
											html +=	"</div>";
									});
									$(".bookMark-form").append(html);
									
									},
								error:function(xhr) {
									console.log(xhr.status + "/" + xhr.statusText);
									}


						
						});
				
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
			<span class="bookMark-count">총 ${count}개의 북마크</span>
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