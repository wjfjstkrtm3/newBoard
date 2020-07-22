<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/login.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			var movieList = $("#movieList").val();
			var imgArray = [];
			$.ajax({
				url:"/movie/movieImg",
				type:"POST",
				success:function(data) {
						console.log(data);
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
	
		<div class="input-form">
			<div class="image-form"><img src="${path}/resources/imgs/cgv.jpg" class="cgv-image"><span class="login-span">로그인</span></div>
			<form action="/login" method="POST" name="login_action_form" id="login_action_form">
				<div><input type="text" name="id" placeholder="아이디" id="guest_id"></div>
				<div><input type="password" name="password" id="guest_password" placeholder="비밀번호"></div>
			</form>
			<div><input type="checkbox" name="idCheck" id="idCheck"><span>아이디 저장</span></div>
			<div><input type="button" value="로그인" id="login_btn"></div>
			<div><input type="button" value="회원가입"></div>
		</div>
		
		
		
		
		
	</div>


</div>
</div>







</body>
</html>