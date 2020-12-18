<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					$(".titleActionForm").submit();
					
				/*
					$.ajax({
						url:"/chat/room/new",
						type:"GET",
						data:titleActionForm,
						success:function(data) {
							alert("채팅방이 생성되었습니다");
							$("#createChatModal").modal("hide");
							},
						error:function(xhr) {
							console.log(xhr.status + "/" + xhr.statusText);
							}
					});
				*/
					
				}
				
				});

			$(".chatRoom-info-enter").on("click", function(event) {
					var limitB = $(".limitBoolean").val();
					if(limitB == "true") {
							event.preventDefault();
							alert("채팅방에 인원이 꽉찼습니다. 다른 채팅방을 이용해주십시오!!");
							
						}
				});
			

			
	});


</script>
</head>
<body>
<div class="chatRoom-container-form">
	<div class="chatRoom-container">
		<c:forEach var="room" items="${rooms}">
			<div class="chatRoom-count-form">
				<div class="chatRoom-count">${fn:length(room.sessionList)}&nbsp;/&nbsp;${room.limit}</div>
				<span class="chatRoom-numberOfPerson">인원 수</span>
				<c:if test="${fn:length(room.sessionList) == room.limit}">
					<input type="hidden" value="${room.chatOpen}" class="limitBoolean"> 
				</c:if>
			</div>
			
		
			<div class="chatRoom-user-form">
				<div class="chatRoom-user-image"><img src="/img/${room.image}" class="userImage"></div>
				<div class="chatRoom-user-name">${room.name}</div>
			</div>
			
			<div class="chatRoom-info-form">
					<div class="chatRoom-info-title">${room.title}</div>
					<div class="chatRoom-info-date">2020-12-15</div>
					<a href="/chat/rooms/${room.roomId}" class="chatRoom-info-enter btn btn-info">입장</a>
			</div>
			
		</c:forEach>
			<!--  
			<c:forEach var="room" items="${rooms}">
				<div class="">${room.roomId}</div>
				<div class="">${room.name}</div>
				<div class=""><a class = "btn btn-primary" href="/chat/rooms/${room.roomId}"></a></div>
			</c:forEach>
			-->
			<span class="createBtn-form">
			<input type="button" value="새로 만들기" class="createBtn">
			</span>
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
			<div class="modal-body chatting-body">
				<div class="modal-body-form">
					<form action="/chat/room/new" method="GET" class="titleActionForm" name="form">
					<div>
						<input type="text" class="chatTitle" name="title" placeholder="채팅방 제목을 입력해주세요!" autofocus>
					</div>
					<div>
						<input type="text" class="chatLimit" name="limit" placeholder="제한할 인원수를 입력해주세요!">
						<input type="button" class="createChatBtn btn btn-info" value="생성하기">
					</div>
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