<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var socket = new SockJS("/websocket");
		client = Stomp.over(socket);

		client.connect({}, function(frame) {
			console.log("frame : " + frame);
		client.send("/app/send/" + ${roomId}, {}, JSON.stringify({"roomId":${roomId}, "randomId":${randomId}}));
		client.subscribe("/topic/chat/" + ${roomId}, function(data) {
			var message = JSON.parse(data.body);
			var message = "<div>" + message.content + "</div>";
			$("#message").append(message);
			
			});

			
			});
		}
		

		
		
</script>
</head>
<body>
<input type="hidden" value="${id}" id="roomId">
<div id="flex-container">

	<div id="message"></div>

</div>

방번호 : ${roomId}<br>
랜덤아이디 : ${randomId}<br>











</body>

</html>