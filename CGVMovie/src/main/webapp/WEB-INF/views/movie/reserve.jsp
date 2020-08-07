<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Reserve</title>
<link href="${path}/resources/css/main.css" rel="stylesheet">
<link href="${path}/resources/css/reserve.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var html = "";
		$.ajax({
			url:"/movie/getMovie",
			type:"POST",
			success:function(data) {
				console.log(data);

				$.each(data, function(index, element) {
						var html = "<div class='reserve-movie-selector-form'>";
					if(element.ages === "15세 이상") {
						html += "<span class='fifteen'>15</span>";
						} else if(element.ages === "전체") {
							html += "<span class='total'>전체</span>";	
						} else if(element.ages === "12세 이상") {
							html += "<span class='twelve'>12</span>";	
						} else if(element.ages === "청불") {
							html += "<span class='youthNot'>청불</span>";	
							}
					    html += "<span class='reserve-movie-selector-value-title'>" + element.title + "</span></div>";
					$(".reserve-movie-selector-value").append(html);
					});	



				
				},
			error:function(xhr) {
				console.log(xhr.status + "||" + xhr.statusText);
				}


			});

		
		});



</script>
</head>
<body>
	<div class="reserve-grid-container">
		<%@include file="../include/nav.jsp"%>
	
		<div class="reserve-container">
			<div class="reserve-movie">
				<div class="reserve-movie-title-form">
					<span class="reserve-movie-title">영화</span>
				</div>
				
				<div class="reserve-movie-selector">
					<span class="orderBy-reserve">예매율순</span>
					<span class="orderBy-alphabet">가나다순</span>
				</div>
				
				<div class="reserve-movie-selector-value">
				
				
				</div>			
			
			</div>
			
			<div class="reserve-theater">
				<div class="reserve-theater-title-form">
					<span class="reserve-theater-title">극장</span>
				</div>
					<div class="reserve-theater-kind">
						<div class="reserve-theater-kind-value">
							<div>서울(30)</div>
							<div>경기(25)</div>
							<div>인천(11)</div>
							<div>강원(4)</div>
							
						</div>
						
						<div class="reserve-theater-kind-value-city">
							<div>강남</div>
							<div>강변</div>
							<div>건대입구</div>
							<div>구로</div>
							<div>대학로</div>
							<div>동대문</div>
						</div>
					
					</div>
			
			</div>
		
			<div class="reserve-date">
				<div class="reserve-date-title-form">
					<span class="reserve-date-title">날짜</span>
				</div>
			
			</div>
		
			<div class="reserve-time">
				<div class="reserve-time-title-form">
					<span class="reserve-time-title">시간</span>
				</div>
			
			</div>
		
		</div>
	
	
	
	
	
	
	
	
	
	
	</div>




</body>
</html>