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
					    html += "<span class='reserve-movie-selector-value-title" + index + "'>" + element.title + "</span></div>";
					$(".reserve-movie-selector-value").append(html);
					});	



				
				},
			error:function(xhr) {
				console.log(xhr.status + "||" + xhr.statusText);
				}


			});

			$(document).on("click", "[class^='reserve-movie-selector-value-title']", function(event) {

				for(var i = 0; i < $(".reserve-movie-selector-form").length; i++) {
						if($(".reserve-movie-selector-form").eq(i).hasClass("selected")) {
							$(".reserve-movie-selector-form").eq(i).removeClass("selected");
							}
					}
					
				
					var movieForm = $(event.target).parent();
					var hasClassSelected = movieForm.attr("class");
					
					var target = $(event.target).attr("class");
					$("." + target).parent().addClass("selected");
					
					var selectedNumber = hasClassSelected.indexOf("selected");
					if(selectedNumber != -1) {
						$("." + target).parent().removeClass("selected");
						
						}
					
					
					
				});

			// 날짜 만들기

			var date = new Date();
			var lastDay = new Date(date.getFullYear(), date.getMonth()+1, 0);
			// 마지막날 구하기
			// new Date(year, month, day)
			// new Date(2020, 1, 2) --> 2020년 2월 2일 리턴 (Month는 0~11 까지의 숫자가 입력되어야함, 0을 입력하면 1)
			// new Date(2020, 8+1=9, 0)    --> 9월에 0일은 없으므로 8월 마지막날을 리턴

			var weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];
			var year = date.getFullYear();
			var month = date.getMonth() +1;
			var html = "";
			html = "<span>" + year + "/" + month  + "</span>";
			$(".reserve-time-data").append(html);
			// 현재 날짜부터 ~ 마지막날짜 까지 반복
			for(var i = date.getDate(); i <=lastDay.getDate(); i++) {
												 // 2020-08-11 .getDay -> return 2   => dayOfweek[2] => "화"
				  const button = document.createElement("button");
	                const spanWeekOfDay = document.createElement("span");
	                const spanDay = document.createElement("span");

	                //class넣기
	                button.classList = "movie-date-wrapper"
	                spanWeekOfDay.classList = "movie-week-of-day";
	                spanDay.classList = "movie-day";

	                //weekOfDay[new Date(2020-03-날짜)]
	                const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

	                //요일 넣기
	                if (dayOfWeek === "토") {
	                    spanWeekOfDay.classList.add("saturday");
	                    spanDay.classList.add("saturday");
	                } else if (dayOfWeek === "일") {
	                    spanWeekOfDay.classList.add("sunday");
	                    spanDay.classList.add("sunday");
	                }
	                spanWeekOfDay.innerHTML = dayOfWeek;
	                button.append(spanWeekOfDay);
	                //날짜 넣기
	                spanDay.innerHTML = i;
	                button.append(spanDay);
	                //button.append(i);
	                $(".reserve-time-data").append(button);

	                dayClickEvent(button);
				}
		
			
			  function dayClickEvent(button) {
		            button.addEventListener("click", function() {
		                const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
		                movieDateWrapperActive.forEach((list) => {
			                console.log(list);
		                    list.classList.remove("movie-date-wrapper-active");
		                })
		                button.classList.add("movie-date-wrapper-active");
		            })
		        }
		
		
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
				<div class="reserve-time-data">
					
				
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