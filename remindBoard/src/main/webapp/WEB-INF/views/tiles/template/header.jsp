<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="header-menu-title">
		띵동
</div>

<div class="header-menu-form">
		<div class="header-guest">성윤님 환영합니다</div>
		<div class="header-alarm">알림</div>
		<div class="header-mypage">내정보</div>
		<div class="header-profile">프로필</div>
		
		
</div>
		<sec:authorize access="isAuthenticated()">
		<form action="/logout" method="POST" class="header-mypage-btnForm">
		<input type="submit" value="로그아웃" class="header-mypage-btn btn-primary">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		</sec:authorize>
<div class="header-lower-menu">
			<div class="">&nbsp</div>
			<div class="normal-board">
			<span class="etc1-board-text">
			<a href="/board/listPageSearch">일반 게시판</a>
			</span>
			&nbsp&nbsp&nbsp|</div>
			<div class="video-board">
			<span class="video-board-text">
			<a href="/board/ajaxList">비동기 게시판</a>
			</span>
			&nbsp&nbsp&nbsp|
			</div>
			<div class="image-board"><span class="image-board-text">이미지 게시판</span>&nbsp&nbsp&nbsp|</div>
			<div class="faq-board"><span class="faq-board-text">FAQ 게시판</span>&nbsp&nbsp&nbsp|</div>
			<div class="etc01"><span class="etc2-board-text">추후 늘릴계획</span></div>
		

</div>
