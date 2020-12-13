<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


	$(document).ready(function() {
			$(".createBtn").on("click", function() {
				$("#createChatModal").modal("show");
			});

			$(".createChatBtn").on("click", function() {
				var chatTitle = $(".chatTitle").val();
				var titleActionForm = $(".titleActionForm").serialize();
				if(chatTitle.trim == "") {
					alert("채팅방 제목을 입력해주세요!");
					return;
				}else {
					$.ajax({
							url:"/chat/room/new",
							type:"GET",
							data:titleActionForm,
							success:function(data) {
								console.log(data);
								alert("채팅방이 생성되었습니다");
								$("#createChatModal").modal("hide");

								
								},
							error:function(xhr) {
								console.log(xhr.status + "/" + xhr.statusText);
								}
						});
						
						
				}
				
				});
	});


</script>
</head>
<body>
<div class="chatRoom-container-form">
	<div class="chatRoom-container">
	
			<div class="">번호</div>
			<div class="">방 이름</div>
			<div class="">입장 버튼</div>
			
			<c:forEach var="rooms" items="${rooms}">
				<div class="">${rooms.roomId}</div>
				<div class="">${rooms.name}</div>
				<div class=""><input type="button" value="입장"></div>
				
			
			</c:forEach>
		
		<div class="chatRoom-create-form">
			<input type="button" value="새로 만들기" class="createBtn">
		</div>
	
	
		
	
	
	
	</div>

	
</div>
<div class="modal fade" id="createChatModal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-header-form">
					<span>새로운 채팅방 생성</span>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">X</button>
				</div>
			
			</div>
			<div class="modal-body">
				<div class="modal-body-form">
					<form action="#" method="GET" class="titleActionForm" name="form">
					<input type="text" class="chatTitle" name="name" placeholder="채팅방 제목을 입력해주세요!" autofocus required>
					<input type="button" class="createChatBtn" value="생성하기">
					</form>		
				</div>
			</div>
		
			<div class="modal-bottom">
			
			</div>
		</div>
	
	
	</div>
			
		
		
		
		
		
</div>
</body>

</html>