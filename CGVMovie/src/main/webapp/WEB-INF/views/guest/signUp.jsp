<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="${path}/resources/css/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
				console.log("number : " + randomNumber);
				$("#movie_image_form").attr("src", imgArray[randomNumber]);
				
				},
				error:function(request,status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		          }
			});
		});


</script>




</head>
<body>
<div class="grid-container-form">

<div class="grid-container">
	<div class="movie-image">
		<img src="" id="movie_image_form" class="image-size">
	</div>
	
	
	<div class="signUp-form">
	<input type="button" value="중복확인" id="duplicate-btn">
		<div class="signUp-image-form">
			<img src="${path}/resources/imgs/cgv.jpg">
		</div>
		<div class="signUp-id">
			<input type="text" name="userId" placeholder="아이디">
			
		</div>
		<div class="signUp-password">
			<input type="password" name="userPassword" placeholder="비밀번호">
		</div>
		<div class="signUp-email">
			<input type="text" name="userEmail" placeholder="이메일">
		</div>
		<div class="signUp-phoneNumber">
			<input type="text" name="userPhoneNumber" placeholder="핸드폰">
		</div>
		<div class="signUp-btn">
			<input type="button" name="userBtn" value="가입하기" id="signBtn">
		
		</div>
		
		
		
		
	</div>
	


</div>
</div>
</body>
</html>