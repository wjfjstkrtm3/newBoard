<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}


#flex-container {
	display:flex;
	height: 50%;
	justify-content:space-around;
}

#guest_form, #messageSend {
	border: 2px solid black;
	border-radius:10px;
}

#guest_form {
	margin-left: 300px;
	overflow:auto;
	overflow-x:hidden;
}

#messageSend {
	display:flex;
	flex-direction:column;
	width:500px;
}

#messageForm {
	margin-top: auto;
}

#messageSend {
	overflow:auto;
	overflow-x:hidden;
}

#outGuest {
	color:red;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		
		var roomId = ${roomId};
		var randomId = ${randomId};
		var message = null;
		var inputMessage = null;
		var socket = new SockJS("/websocket");
		client = Stomp.over(socket);

		client.connect({}, function(frame) {
		client.send("/app/send/" + ${roomId}, {}, JSON.stringify({"roomId":roomId, "randomId":randomId}));
		client.subscribe("/topic/chat/" + roomId, function(data) {
			message = JSON.parse(data.body);
			console.log("message : " + message.content);
			if(message.content.indexOf("님 환영합니다") != -1) {
			inputMessage = "<div><span>" + message.content + "</span></div>";
			$("#guest_enter_message").append(inputMessage);

			// 채팅방이 append되면 실행
			// 스크롤 계속 아래로 내리기 
			$("#guest_form").scrollTop($("#guest_form")[0].scrollHeight);
			} else if(message.content.indexOf("퇴장") != -1) {
				inputMessage = "<div><span id='outGuest'>" + message.content + "</span></div>";
				$("#guest_enter_message").append(inputMessage);
				}


			else {
			inputMessage = "<div><span>" + message.randomId + "</span>" + "<span>" + message.content + "</span></div>";
			$("#guest_send_message").append(inputMessage);

			// 채팅방이 append되면 실행
			// 스크롤 계속 아래로 내리기 
			$("#messageSend").scrollTop($("#messageSend")[0].scrollHeight);
			}
			
			
			});
			});


		$("#inputMessage").on("keyup", function(event) {
			if(event.which == 13) {
				var inputMessage = $("#inputMessage").val();
				client.send("/app/message/" + roomId, {}, JSON.stringify({"roomId":roomId, "randomId":randomId, "content":inputMessage}));
				$("#inputMessage").val("");
				$("#inputMessage").focus();
				}
			});

		$("#outRoom").on("click", function() {
			if(client != null) {
				client.send("/app/outRoom/" + roomId, {}, JSON.stringify({"roomId":roomId, "randomId":randomId}));
				client.disconnect();
				}
			
			});
		
		}
		

		
		
</script>
</head>
<body>
<input type="hidden" value="${id}" id="roomId">
<div id="flex-container">

	<div id="guest_form">
		<div id="guest_enter_message"></div>
	</div>
	
	
	<div id="messageSend">
		<div id="guest_send_message"></div>
		<div id="messageForm">
		<input type="text" id="inputMessage" placeholder="메시지 입력">
		<button id="outRoom">나가기</button>
		
		</div>
	</div>
</div>













</body>

</html>