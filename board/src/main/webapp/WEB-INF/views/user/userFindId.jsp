<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">


#findId-container {
	display:flex;
	flex-direction:column;
	border:2px solid black;
	align-items:center;
}

#loginForm {
	margin-left:auto;
}


</style>
<script type="text/javascript">
	window.onload = function() {
		$("#cancel_btn").click(function() {
			history.go(-1);
			});

		$("#find_btn").on("click", function() {
			var email = $("#findIdByEmail").val();
				$.ajax({
					url:"/user/userFindId",
					type:"POST",
					data: {"email":email},
					success: function(data) {
						if(data.id == null) {
							alert(data.msg);
							} else {
							alert("아이디는 " + data.id + "입니다");
							}
						},
					error:function(xhr) {
						console.log(xhr.status + "||" + xhr.statusText);
						}

					});
			
			});

		
		}

	

</script>
</head>
<body>


<div id="findId-container"> 
	<div><span>아이디 찾기</span></div>
	<span>Email</span>
	<input type="text" id="findIdByEmail" style="width:500px" placeholder="이메일을 입력하세요">
	<div><button id="find_btn">찾기</button></div>
	<div><button id="cancel_btn">취소</button></div>
	<div id="loginForm"><a href="/">로그인 하러가기</a></div>



</div>




</body>
</html>