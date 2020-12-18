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
		var sessionId;
		
		// 비동기로 해당 방의 room 객체를 가져와서 작업
		$.ajax({
				url:"/chat/enterJudgment",
				type:"POST",
				data:{"roomId":roomId},
				success:function(data) {
					console.log(data);
					// 순서상 해당 방의 정보를 불러오면 첫번째로 들어온 sessionList는 없고
					// 두번째는 sessionList 하나
					// 그래서 만약에 인원제한을 2명을 걸고 , 3명째가 들어왔을때 즉 3명째면 sessionList가 2개가 딱 담겼을때
					// 못들어가게 해주는거임 
					if(data.limit == data.sessionList.length) {
						alert("채팅방에 인원이 꽉찼습니다. 다른 채팅방을 이용해주십시오!!");
						location.href="/chat/chatting";
						}
					
				},
				error:function(xhr) {
					console.log(xhr.status + "/" + xhr.statusText());
					}
			});


		
		connect();

		
			

		
		function connect() {
			socket = new SockJS("/chat");
			stompClient = Stomp.over(socket);  // SockJS를 Stomp에 연결

			stompClient.connect({}, function(frame) {
				var splitSessionId = socket._transport.url.split("/");
				sessionId = splitSessionId[5];
				console.log(sessionId);

				// sessionID는 SockJS 내부에서 아래와 같은 방식으로 생성
				// var connid = utils.random_string(8);
				// 이걸  라이브러리 내부에서 sessionID라는 변수를 만들어서 저장하라고 함
				
				// 하지만 라이브러리에서 sessionID가 포함된 URL을 가져올 수있다
				// console.log("sessionId : " + socket._transport.url);
				// sessionId : ws://localhost:8070/chat/821/qagijcp4/websocket
					chatIn();
					chatOut();
					chatting();
				});
		};

		// 채팅방 들어왔을때
		function chatIn(){
			stompClient.send("/app/in/" + roomId, {}, JSON.stringify({writer:user, sessionId:sessionId}));
			stompClient.subscribe("/topic/in/" + roomId, function(msg) {
					var data = JSON.parse(msg.body);
					var enterText = data.message;
					$(".message-form").append("<div class='enterChatRoom'>" + enterText +"</div>");
					
				});
		};

		// 채팅방 나갔을때
		function chatOut() {
			stompClient.subscribe("/topic/out/" + roomId, function(msg) {
					var data = JSON.parse(msg.body);
					var leaveText = data.message;
					$(".message-form").append("<div class='leaveChatRoom'>" + leaveText +"</div>");
				});
		};

		// 채팅할때
		function chatting() {
			stompClient.subscribe("/topic/send/" + roomId, function(msg) {
					var data = JSON.parse(msg.body);
					// 채팅 메시지		
					var chattingText = data.msg.message;

					// 채팅 한 사람의 이름
					var chatWriter = data.msg.writer;

					// 채팅 한 사람의 이미지
					var chatImage = data.userDto.image;

					var senderSessionId = data.msg.sessionId;

					// 내가 보낸 메시지이면
					if(senderSessionId == sessionId) {
						myMessage(chattingText);
						// 상대방이 보낸 메시지이면
						} else {
								senderMessage(chattingText, chatWriter, chatImage);
							}
				});
		};

		// 내가 보낸 메시지이면
		function myMessage(chattingText) {
			var html = "<div class='myMessage-form'><div class='myMessage-date'>" + "오후 4:18" + "</div>";
			html += "<div class='myMessage-text'><span class='myMessage-span-text'>" + chattingText +"</span></div></div>";
			$(".message-form").append(html);
		};
		

		// 상대방이 보낸 메시지이면
		function senderMessage(chattingText, chatWriter, chatImage) {
			var html = "";
			var image = "${userDto.image}";		
			html += "<div class='senderMessage-form'>";
			html += "<div class='senderMessage-text-form'>";
			html += "<div class='senderMessage-text-imageForm'>";
			html += "<img src='/img/" + chatImage + "'" + "class='senderMessage-image'>";
			html += "<span class='senderMessage-id'>" + chatWriter + "</span></div>";
			html += "<div class='senderMessage-message-form'>";
			html += "<div class='senderMessage-text'>" + chattingText + "</div>"
			html += "<div class='senderMessage-date'>" + "오후 4:18" + "</div></div></div></div>";
			$(".message-form").append(html);
			
			
			};

		
		// 새로고침이나, 다른 URL를 이동했을때 실행되는 함수
		window.onbeforeunload = function() {
			//webSocket.send(JSON.stringify({chatRoomId:roomId, type:"LEAVE", writer:user}));
			//webSocket.close();
			stompClient.send("/app/out/" + roomId, {}, JSON.stringify({writer:user, sessionId:sessionId}));
			disconnect();
			}

		// 채팅방 메시지치고 엔터눌렀을때
		$(".input-message-text-form").on("keyup", function(event) {
					if(event.which == 13) {
						var messageText = $(".input-message-text-form").val();
						stompClient.send("/app/send/" + roomId, {}, JSON.stringify({writer:user, message:messageText, sessionId:sessionId}));
						$(".input-message-text-form").val("");
						
						// 스크롤 포커싱 하기
						const ele = document.getElementById("scroll-message");
						ele.scrollTop = ele.scrollHeight;
						}
			});
		
		
		
		// 채팅방 메세지 전송버튼 눌렀을때
		$(".inputMessageBtn").on("click", function() {
				var messageText = $(".input-message-text-form").val();
				//webSocket.send(JSON.stringify({chatRoomId: roomId, type:"CHAT", writer:user, message:messageText}));
				stompClient.send("/app/send/" + roomId, {}, JSON.stringify({writer:user, message:messageText, sessionId:sessionId}));
				$(".input-message-text-form").val("");
			});

		// 나가기 버튼 눌렀을때
		$(".exitBtn").on("click", function() {
				if(confirm("정말 나가시겠습니까?") == true) {
					//webSocket.send(JSON.stringify({chatRoomId:roomId, type:"LEAVE", writer:user}));
					//webSocket.close();
					stompClient.send("/app/out/" + roomId, {}, JSON.stringify({writer:user, sessionId:sessionId}));
					disconnect();
					
					location.href="/chat/chatting";
					}else {
						return;
						}
				
			});
			// 연결해제
			function disconnect() {
					if(stompClient != null) {
						stompClient.disconnect();
						}
					};

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
   			<input type="button" value="퇴장" class="exitBtn">
   		</div>
   		
   	
   	</div>
   
   
   </div>

<input type="hidden" value="${roomId}" class="roomId">
<input type="hidden" value="${user}" class="userName">


</body>
</html>