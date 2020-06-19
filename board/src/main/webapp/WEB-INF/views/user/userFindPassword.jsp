<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
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

#buttonForm {
	display:flex;
	margin-top: 30px;
}

#btnForm {

}
</style>
</head>
<body>

<div id="findId-container"> 
	<div><span>비밀번호 찾기</span></div>
	<div>
	<span>아이디</span>
	<input type="text" id="findIdById" style="width:250px" placeholder="아이디를 입력하세요">
	<span>이메일</span>
	<input type="text" id="findIdByEmail" style="width:250px" placeholder="이메일을 입력하세요">
	</div>
	
	<div id="buttonForm">
	<div><button id="find_btn">찾기</button><button id="cancel_btn">취소</button></div>
	</div>
<div id="loginForm"><a href="/">로그인 하러가기</a></div>
</div>
</body>
</html>