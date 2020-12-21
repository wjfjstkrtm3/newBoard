<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Socket js  -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<!-- toast js -->
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
 
<script type="text/javascript">

		// 전역변수 선언
			var socket = null;
			
	$(document).ready(function() {
			connect();
			function connect() {
				socket = new SockJS("/chat");
				stompClient = Stomp.over(socket); // SockJS를 Stomp에 연결

				stompClient.connect({}, function(frame) {
						stompClient.subscribe("/topic/message/${userDto.id}", function(message) {
									var data = JSON.parse(message.body);
									var sender = data.sender;
									var content = data.content;					
									
									toastr.options = {
												closeButton: true,
												progressBar: true,
												showMethod: "slideDown",
												timeOut: 4000
											};
									toastr.success("제목", "내용");
							});
					
					});

				
			}
		});


</script>
<div class="header-menu-title">

</div>

<div class="header-menu-form">
		<!--  <div class="header-guest">${sessionScope.userName}님 환영합니다</div>
		<div class="header-alarm">알림</div>
		<div class="header-mypage">내정보</div>
		<div class="header-profile">프로필</div>
		
		-->
</div>
		<sec:authorize access="isAuthenticated()">
		<form action="/logout" method="POST" class="header-mypage-btnForm">
		<input type="submit" value="로그아웃" class="header-mypage-btn btn-primary">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		</sec:authorize>
<div class="header-lower-menu">
			<div class="">&nbsp</div>
			<div class="normal-board">
			<span class="etc1-board-text">
			<a href="/board/listPageSearch">일반 게시판</a>
			</span>
			&nbsp&nbsp&nbsp|</div>
			<div class="video-board">
			<span class="video-board-text">
			<a href="/board/ajaxList">비동기 게시판</a>
			</span>
			&nbsp&nbsp&nbsp|
			</div>
			<div class="image-board">
			<span class="image-board-text">
			<a href="/video/videoList">동영상 게시판</a>
			</span>
			&nbsp&nbsp&nbsp|
			</div>
			<div class="faq-board"><span class="faq-board-text">FAQ 게시판</span>&nbsp&nbsp&nbsp|</div>
			<div class="etc01"><span class="etc2-board-text">추후 늘릴계획</span></div>
		

</div>
