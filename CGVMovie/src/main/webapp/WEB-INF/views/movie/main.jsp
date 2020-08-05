<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/main.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			$(document).on("click", "[id^='reserve_btn_']", function(event) {
				console.log(event.target);
				console.log(event.currentTarget);
				});
		});
	
</script>


</head>
<body>
<div class="grid-container">
	<div class="cgv-nav">
		<div class="cgv-nav-form">
		<form action="/logout" method="POST" id="logout-form">
			<span class="cgv-nav-form-guest">
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="userId"/>
				${userId}님 안녕하세요
			</sec:authorize>
			
			</span>
			<a href="#" class="cgv-nav-form-mypage">마이페이지</a>
			
			<a href="#" onclick="document.getElementById('logout-form').submit()">로그아웃</a>
		</form>
			
		</div>
		<div class="cgv-nav-bar">
			<div class="cgv-nav-bar-center">
				<img src="${path}/resources/imgs/cgv.jpg" class="cgv-nav-image-size">
				<div class="movie-character-image"><img src="${path}/resources/imgs/movie-character.png"></div>
				<div class="movie-link">
				<a href="#">영화</a>
				<a href="#">예매</a>
				<a href="#">극장</a>
				<a href="#">이벤트&컬쳐</a>
				<span class="movie-search-form">
				<input type="text" name="movie_search" id="movie_search">
				<input type="button" value="검색" id="movie_search_btn">
				</span>
				</div>
			
			</div>
		
		</div>
	</div>
	
	<div class="cgv-main-content">
			<c:forEach var="list" items="${movieList}" varStatus="status">  
			
			<div class="content-flex-container">
				<div class="list-rank">
				${list.rank}
				</div>
				<div class="content-form">
			
					<div class="list-img">
						<img src="${list.img}" class="list-movie-img">
					</div>
					<div class="list-content-form">
					<span class="list-title">${list.title}</span>
						<div class="list-content-percent">
							<span class="list-percent">예매율${list.percent}&nbsp|</span>
							<span class="list-evaluation"><i class="fas fa-egg"></i>&nbsp${list.evaluation}</span>
						</div>
						<span class="list-openingDates">${list.openingDates}</span>
						<span class="list-ages">${list.ages}</span>
						<div class="reserve-btn-form">
						<input type="button" value="예매" id="reserve_btn_${status.index}" class="reserve-btn">
						<i class="fas fa-clipboard-check"></i>
						</div>
					</div>
					</div>
				
			</div>	
				
			</c:forEach>
	
	
	
	
	</div>



</div>
</body>
</html>