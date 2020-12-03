<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
			$(document).on("click", ".user-image", function() {
					location.href="/user/mypage";
				
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

		
	</div>
	<div class="main-content-menu-items">
		<div class="test01">여기는 아이템</div>
	
	</div>





