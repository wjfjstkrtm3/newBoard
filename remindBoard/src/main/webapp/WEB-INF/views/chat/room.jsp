<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		var nickname;
		var roomId = $(".roomId").val();
		var user = $(".userName").val();
		var socket = null;
		connect();
		function connect() {
			socket = new SockJS("/chat");
			stompClient = Stomp.over(socket);

			stompClient.connect({}, function(frame) {
					chatIn();
					chatOut();
					chatting();
				});
		};

		function chatIn(){
			stompClient.send("/app/in/" + roomId, {}, JSON.stringify({writer:user}));
			stompClient.subscribe("/topic/in/" + roomId, function(msg) {
					var data = JSON.parse(msg.body);
					var enterText = data.message;
					$(".message-form").append("<div class='enterChatRoom'>" + enterText +"</div>");
					
				});
		};

		function chatOut() {
			stompClient.subscribe("/topic/out/" + roomId, function(msg) {
					var data = JSON.parse(msg.body);
					var leaveText = data.message;
					$(".message-form").append("<div class='leaveChatRoom'>" + leaveText +"</div>");
				});
		};

		function chatting() {
			stompClient.subscribe("/topic/send/" + roomId, function(msg) {
				
					var data = JSON.parse(msg.body);
										
					var chattingText = data.msg.message;
					var chatWriter = data.msg.writer;
					var chatImage = data.userDto.image;
					onMessage(chattingText, chatWriter, chatImage);
				});
		};


		function onMessage(chattingText, chatWriter, chatImage) {
			var html = "";
			var image = "${userDto.image}";		
			html += "<div class='myMessage-form'>";
			html += "<div class='Mymessage-text-form'>";
			html += "<div class='MyMessage-text-imageForm'>";
			html += "<img src='/img/" + chatImage + "'" + "class='MyMessage-image'>";
			html += "<span class='MyMessage-id'>" + chatWriter + "</span></div>";
			html += "<div class='MyMessage-message-form'>";
			html += "<div class='Mymessage-text'>" + chattingText + "</div>"
			html += "<div class='Mymessage-date'>" + "오후 4:18" + "</div></div></div></div>";
			$(".message-form").append(html);
			// 스크롤 포커싱 하기
			const ele = document.getElementById("scroll-message");
			ele.scrollTop = ele.scrollHeight;
			}
	

		window.onbeforeunload = function() {
			//webSocket.send(JSON.stringify({chatRoomId:roomId, type:"LEAVE", writer:user}));
			//webSocket.close();
			stompClient.send("/app/out/" + roomId, {}, JSON.stringify({writer:user}));
			socket.close();
			}

		
		$(".inputMessageBtn").on("click", function() {
				var messageText = $(".input-message-text-form").val();
				//webSocket.send(JSON.stringify({chatRoomId: roomId, type:"CHAT", writer:user, message:messageText}));
				stompClient.send("/app/send/" + roomId, {}, JSON.stringify({writer:user, message:messageText}));
				$(".input-message-text-form").val("");
			});

		$(".exitBtn").on("click", function() {
				if(confirm("정말 나가시겠습니까?") == true) {
					//webSocket.send(JSON.stringify({chatRoomId:roomId, type:"LEAVE", writer:user}));
					//webSocket.close();
					stompClient.send("/app/out/" + roomId, {}, JSON.stringify({writer:user}));
					socket.close();
					
					location.href="/chat/chatting";
					}else {
						return;
						}
				
			});
		

		

			

			

			
			
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

<input type="hidden" value="${roomId}" class="roomId">
<input type="hidden" value="${user}" class="userName">


</body>
</html>