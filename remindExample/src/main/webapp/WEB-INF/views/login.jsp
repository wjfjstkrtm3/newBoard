<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script type="text/javascript">

	$(document).ready(function() {

	//	$("#login_btn").on("click", function() {
			// document.login_action.submit();
		//	$("#login_action").submit();
		//	});

		
		});


</script>
<body>

<form action="/login" method="POST" id="login_action">
	<input type="text" name="userId" id="userId" placeholder="아이디">
	<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호">
	<input type="submit" value="로그인">
</form>

</body>
</html>