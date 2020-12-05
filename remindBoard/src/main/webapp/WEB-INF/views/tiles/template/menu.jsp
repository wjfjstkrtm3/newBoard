<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function() {
			$(document).on("click", ".user-image", function() {
					location.href="/user/mypage";
				
				});
			$(".category-image03").on("click", function() {
					location.href="/user/bookMarkPage";
				});

			$(".admin-page").on("click", function() {
					location.href="/admin/makeBoard";	
				});


			
		});

</script>


	<div class="main-content-menu-category">
		<div class="category-image01"><i class="fas fa-gifts fa-3x"></i></div>
		<div class="category-image02">
		
	
		<c:choose>
			<c:when test="${userDto.image == 'default.png'}">
				<img src="/img/default.png" class="user-image"/>
			</c:when>
			<c:when test="${userDto.image != 'default.png'}">
				<img src="/img/${userDto.image}" class="user-image"/>
			</c:when>
		</c:choose>
			<!--  <i class="fas fa-user-circle fa-3x"></i>-->
	
		</div>
		<div class="category-image03"><i class="fas fa-star fa-3x start-color"></i></div>
		<div class="category-image04"><i class="fas fa-address-book fa-3x book-color"></i></div>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="admin-page"><i class="fas fa-crown fa-3x"></i></div>
		</sec:authorize>
		
	</div>
	<div class="main-content-menu-items">
		<c:forEach var="title" items="${boardTitle}">
			<div class="board-title">${title.type}</div>
		</c:forEach>
	
		
	
	</div>





