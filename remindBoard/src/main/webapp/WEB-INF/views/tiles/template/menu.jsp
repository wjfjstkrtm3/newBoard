<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function() {
			$(document).on("click", ".user-image", function() {
					location.href="/user/mypage";
				
				});

			// 북마크 페이지
			$(".category-image03").on("click", function() {
					location.href="/user/bookMarkPage";
				});

			// 관리자 페이지
			$(".admin-page").on("click", function() {
					location.href="/admin/makeBoard";
				});

			$(".category-image04").on("click", function() {
					location.href="/admin/memberManage";
				});

			$(".category-image05").on("click", function() {
					location.href="/chat/chatting";
				});
			
		});

</script>


	<div class="main-content-menu-category">
		<!--  <div class="category-image01"><i class="fas fa-gifts fa-3x"></i></div>-->
		<div class="category-image02">
		
	
		<c:choose>
			<c:when test="${sessionScope.userDto.image == 'default.png'}">
				<img src="/img/default.png" class="user-image"/>
			</c:when>
			<c:when test="${sessionScope.userDto.image != 'default.png'}">
				<img src="/img/${sessionScope.userDto.image}" class="user-image"/>
			</c:when>
		</c:choose>
			<!--  <i class="fas fa-user-circle fa-3x"></i>-->
	
		</div>
		<div class="category-image03"><i class="fas fa-star fa-3x start-color"></i></div>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="category-image04"><i class="fas fa-address-book fa-3x"></i></div>
			<div class="admin-page"><i class="fas fa-crown fa-3x"></i></div>
		</sec:authorize>
		
		<div class="category-image05"><i class="fas fa-comments fa-3x"></i></div>
	
	</div>
	
	<div class="main-content-menu-items">
	
	
		
	
	</div>





