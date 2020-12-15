<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

	$(document).ready(function() {

		
		
		var nickname;
		var webSocket;
		var roomId = $(".roomId").val();
		var user = $(".userName").val();
		connect();
		/*
		$(".nicknameBtn").on("click", function() {
				nickname = $(".nickname-text-form").val();
				
				
			});
		*/
		$(".inputMessageBtn").on("click", function() {
				var messageText = $(".input-message-text-form").val();
				webSocket.send(JSON.stringify({chatRoomId: roomId, type:"CHAT", writer:user, message:messageText}));
				$(".input-message-text-form").val("");
			});

		$(".exitBtn").on("click", function() {
				if(confirm("정말 나가시겠습니까?") == true) {
					webSocket.send(JSON.stringify({chatRoomId:roomId, type:"LEAVE", writer:user}));
					webSocket.close();
					location.href="/chat/chatting";
					}else {
						return;
						}
				
			});
		

		function connect() {
			
			// WebSocket 프로토콜을 사용하여 통신하기 위해서는 WebSocket객체를 생성해야 한다.
			// 이 객체는 자동으로 서버로의 연결을 열려고 할 것이다
			// WebSocket 생성자는 하나의 필수 파라미터와 하나의 선택 파라밑터를 받는다
			
			// url: 필수. 연결할 URL으로, 이것은 WebSocket 서버가 응답할 URL이어야 한다
			// protocols: 선택. 하나의 프로토콜 문자열 또는 프로토콜 문자의 배열
			
			webSocket = new WebSocket("ws://localhost:8070/chat");

			
			// 웹 소켓이 연결되었을때 호출되는 이벤트
			webSocket.onopen = onOpen;
			
			// 웹 소켓이 닫혔을때 호출되는 이벤트 (webSocket.close()가 된이후 실행이되는 함수임)
			// webSocket.onclose = onClose;

			// 웹 소켓이 에러가 났을때 호출되는 이벤트
			webSocket.onerror = onError;

			// 웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
			webSocket.onmessage = onMessage;
			}

			function onOpen() {
				webSocket.send(JSON.stringify({chatRoomId:roomId, type:"ENTER", writer:user}));
				}

			function onClose() {
				webSocket.send(JSON.stringify({chatRoomId:roomId, type:"LEAVE", writer:user}));
				}

			function onMessage(msg) {
				var data = JSON.parse(msg.data);
				var html = "";
				var image = "${userDto.image}";		
				html += "<div class='myMessage-form'>";
				html += "<div class='Mymessage-text-form'>";
				html += "<div class='MyMessage-text-imageForm'>";
				html += "<img src='/img/" + image + "'" + "class='MyMessage-image'>";
				html += "<span class='MyMessage-id'>" + "${userDto.id}" + "</span></div>";
				html += "<div class='MyMessage-message-form'>";
				html += "<div class='Mymessage-text'>" + data + "</div>"
				html += "<div class='Mymessage-date'>" + "오후 4:18" + "</div></div></div></div>";
				$(".message-form").append(html);
				// 스크롤 포커싱 하기
				const ele = document.getElementById("scroll-message");
				ele.scrollTop = ele.scrollHeight;
				}

			function onError() {
				
				}

			window.onbeforeunload = function() {
				webSocket.send(JSON.stringify({chatRoomId:roomId, type:"LEAVE", writer:user}));
				webSocket.close();
				}

			
			
		});

	






	

</script>




<body>
   <div class="chatting-container">
   	<div class="chatting-container-form">
   		<!--
   		<div class="nickname-form">
   			<input type="text" class="nickname-text-form" placeholder="닉네임을 입력해주세요" autofocus required>
   			<input type="button" class="nicknameBtn" value="확인"> 
   		</div>
   		-->
   		<div class="message-form" id="scroll-message">
   			
   		
   		</div>
   		
   		
   		<div class="input-message-form">
   			<input type="text" class="input-message-text-form" placeholder="내용을 입력하세요">
   			<input type="button" class="inputMessageBtn" value="전송">
   		
   		</div>
   		<input type="button" value="퇴장" class="exitBtn">
   	
   	</div>
   
   
   </div>

<input type="hidden" value="${room.roomId}" class="roomId">
<input type="hidden" value="${user}" class="userName">


</body>
</html>