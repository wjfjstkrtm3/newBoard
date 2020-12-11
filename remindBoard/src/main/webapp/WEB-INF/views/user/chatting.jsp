<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

	$(document).ready(function() {

		var nickname;
		var webSocket;
		$(".nicknameBtn").on("click", function() {
				nickname = $(".nickname-text-form").val();
				connect();
				
				
			});

		$(".inputMessageBtn").on("click", function() {
				var messageText = $(".input-message-text-form").val();
				webSocket.send(nickname + ":" + messageText);
				$(".input-message-text-form").val("");
			});

		$(".exitBtn").on("click", function () {
				webSocket.send(nickname + "님이 퇴장하셨습니다");
				webSocket.close();
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
			webSocket.onclose = onClose;

			// 웹 소켓이 에러가 났을때 호출되는 이벤트
			webSocket.onerror = onError;

			// 웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
			webSocket.onmessage = onMessage;
			}

			function onOpen() {
				$(".nickname-form").empty();
				webSocket.send(nickname + "님이 입장하셨습니다.");
				}

		
			function onClose() {
				$(".message-form").empty();
				}

			function onError() {
				$(".message-form").append("에러가 났어요!");
				}
			
			function onMessage(message) {
				$(".message-form").append(message.data + "<br>");
				}
			
		});



</script>




<body>
   <div class="chatting-container">
   	<div class="chatting-container-form">
   		<div class="nickname-form">
   			<input type="text" class="nickname-text-form" placeholder="닉네임을 입력해주세요" autofocus required>
   			<input type="button" class="nicknameBtn" value="확인"> 
   		</div>
   		<div class="message-form">
   			
   		
   		</div>
   		
   		
   		<div class="input-message-form">
   			<input type="text" class="input-message-text-form" placeholder="내용을 입력하세요">
   			<input type="button" class="inputMessageBtn" value="전송">
   		
   		</div>
   		<input type="button" value="퇴장" class="exitBtn">
   	
   	</div>
   
   
   </div>
 
</body>

</html>