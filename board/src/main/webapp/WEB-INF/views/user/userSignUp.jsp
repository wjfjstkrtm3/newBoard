<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$("#submit_btn").prop("disabled", true);
		$("#id_overlap").on("click", function() {
		var idCheck = $("#idCheck").val();
			$.ajax({
					url: "/user/idCheck",
					type:"POST",
					dataType:"JSON",
					data: {"id":idCheck},
					success:function(data) {
						console.log(data);
						if(data == 1) {
							alert("중복된 아이디 입니다");
						} else {
							alert("사용가능한 아아디 입니다");
							$("#submit_btn").prop("disabled", false);
							}
						},
					error:function(xhr) {
						console.log(xhr.status);
						}
					
				});

				
			
			});

			$("#test_btn").on("click", function() {
				var test={"name":"kim", "phoneNumer":0104577};
				$.ajax({
					url:"/user/test",
					dataType:"JSON",
					type:"POST",
					data:JSON.stringify(test),
					contentType:"application/json",
					success: function(data) {
						console.log(data);
						for(var key in data) {
							console.log("key : " + key + "||" + "value : " + data[key]);
							
							}
						},
					error:function(xhr) {
						console.log(xhr.status);
						}

					
					});

					
				
				});


		
		});

</script>

</head>
<body>
	<form action="/user/userSignUp" method="POST">
	아이디 : <input type="text" name="id" id="idCheck"><input type="button" value="중복확인" id="id_overlap"><br>
	비밀번호 : <input type="password" name="password"><br>
	이름 : <input type="text" name="name"><br>
	이메일: <input type="text" name="email"><br>
	전화번호 : <input type="text" name="phoneNumber">
	<input type="submit" value="회원가입" id="submit_btn">
	<input type="hidden" 	name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	
	<input type="button" value="실험" id="test_btn">


</body>
</html>