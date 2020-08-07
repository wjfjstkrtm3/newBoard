<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>     
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