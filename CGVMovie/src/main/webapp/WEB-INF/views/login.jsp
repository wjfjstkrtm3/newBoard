<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var movieList = $("#movieList").val();
		var imgArray = [];
		$.ajax({
			url:"/movieImg",
			type:"POST",
			success:function(data) {
				$.each(data, function(index, item) {
						imgArray.push(item.img);
					});
				console.log(imgArray.length);
				const randomNumber = Math.round((Math.random() * imgArray.length));
				$("#movie_image_form").attr("src", imgArray[randomNumber]);
				
				},
				error:function(request,status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		          }
			});
				
				
			
		// 아아디 or 비밀번호를 입력했을때 enter를 누르면 로그인이 되게
		$("#guest_password, #guest_id").keyup(function(event) {
				if(event.which == 13) {
					$("#login_action_form").submit();
					}
			});

				// 로그인을 버튼으로 만들어서 button을 submit되게 동작
				$("#login_btn").on("click", function() {
					// document.login_action_form.submit();
					$("#login_action_form").submit();
					});

				$("#guest_sign_up").on("click", function() {
					location.href = "/guest/signUp";
					});

			
				
			// 아이디 체크박스를 선택한경우 만들기
			$("#idCheck").on("change", function() {
							var guest_id = $("#guest_id").val();
					if($("#idCheck").is(":checked")) {
							addCookie("userId", guest_id, 7);
							addCookie("test", "testValue", 7);
						} else {
							deleteCookie("userId");
							}
				});

			// keyup이 되고 , checkbox에 체크가 되었을때 cookie만들기
			$("#guest_id").on("keyup", function() {
				var guest_id = $("#guest_id").val();
					if($("#idCheck").is(":checked")) {
						addCookie("userId", guest_id, 7);
						}
				});

			// 쿠기 만들기
			function addCookie(cookieName, value, exdays) {
						var exdate = new Date();
						exdate.setDate(exdate.getDate() + exdays);
						var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
						console.log("addCookie : " + cookieName + "=" + cookieValue);
						document.cookie = cookieName + "=" + cookieValue;
				}
			// 쿠키 삭제
			function deleteCookie(cookieName) {
				var expireDate = new Date();
				expireDate.setDate(expireDate.getDate() -1);
				console.log("deleteCookie : " + cookieName + "=" + "; expires=" + expireDate.toGMTString());
				document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
				}

			// 쿠키 얻어오기
			function getCookie(cookieName) {
					cookieName = cookieName + "=";
					var cookieData = document.cookie;
					console.log("getCookie : " + cookieData);
					var start = cookieData.indexOf(cookieName);
					var cookieValue = "";
					if(start != -1) { // 해당 cookie이름으로 찾으면
						start += cookieName.length;  // "=" 포함한 length
							var end = cookieData.indexOf(";", start);
							if(end == -1) { // -1이라는거는 ";" 를 못찾음 -> 마지막 cookie인거임 
								// getCookie : userId=gdgdgdgd; test=testValue  마지막 쿠키는 ; 가 없기때문에 length를 end로 잡는거임
								end = cookieData.length;
								}
						cookieValue = cookieData.substring(start, end);
						console.log("getCookieValue : " +cookieValue);
							
						}
					return cookieValue;
					
				}		

				// 로딩될때 userId의 쿠키값을 얻어와서 input box에 insert
				var userId = getCookie("userId");
				$("#guest_id").val(userId);
				
				// 해당 cookie 즉 userId의 값이 빈문자가 아니면 check상태로
				if(userId != "") {
					$("#idCheck").attr("checked", true);
					}

				$("#login_btn").on("click", function() {
					var guest_id = $("#guest_id").val().trim();
					var guest_password = $("#guest_password").val().trim();
					if(guest_id == "" || guest_password == "" ) {
							alert("아이디 또는 비밀번호를 다시 입력해주세요");
						}
					});

				
				
		});

	

</script>
</head>
<body>
<input type="hidden" value="${movieList}" id="movieList">

<div class="grid-container-form">

<div class="grid-container">
	<div class="movie-image">
		<img src="" id="movie_image_form" class="image-size">
	</div>
	
	
	<div class="login-form">
	
	<sec:authorize access="isAnonymous()">
		<div class="input-form">
			<div class="image-form"><img src="${path}/resources/imgs/cgv.jpg" class="cgv-image"><span class="login-span">로그인</span></div>
			<form action="/login" method="POST" name="login_action_form" id="login_action_form">
				<div><input type="text" name="id" placeholder="아이디" id="guest_id" class="guest-border"></div>
				<div><input type="password" name="password" id="guest_password" placeholder="비밀번호" class="guest-border"></div>
			</form>
			<div><input type="checkbox" name="idCheck" id="idCheck"><span>아이디 저장</span></div>
			<div><input type="button" value="로그인" id="login_btn"></div>
			<div><input type="button" value="회원가입" id="guest_sign_up"></div>
		</div>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<form action="/logout" method="POST" id="logout-form">
		<a href="#" onclick="document.getElementById('logout-form').submit()">로그아웃</a>
	</form>
	</sec:authorize>
	</div>
	


</div>
</div>







</body>
</html>