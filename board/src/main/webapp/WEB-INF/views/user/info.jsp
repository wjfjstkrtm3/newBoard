<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

html, body {
	height: 100%;
	width: 100%;

}
#user-container {
	display: flex;
    border: 2px solid orange;
    border-radius: 10px;
    height: 50%;
    width: 50%;
    justify-content: center;
    align-items: center;
}


#flex-container {
	display:flex;
	justify-content: center;
    align-items: center;
    height:100%;
	width: 100%;
}

#left-container, #right-container {
	display:flex;
	flex-direction:column;
	margin: 70px;
}

#left-container span, #right-container div{
	margin: 20px 0px;
}

</style>
</head>
<body>
	<c:set var="user" value="${user}"></c:set>
<%@include file="../include/nav.jsp" %>


<div id="flex-container">
	<div id="user-container">
		<div id="left-container">
		<span>아이디</span>
		<span>이름</span>
		<span>이메일</span>
		<span>핸드폰 번호</span>
		<span>권한</span>
		<span>활성화</span>
		</div>
		<div id="right-container">
		<div>${user.id} </div>
		<div>${user.name} </div>
		<div>${user.email} </div>
		<div>${user.phoneNumber} </div>
		<div>${user.authority} </div>
		<div>${user.enabled} </div>
		</div>
		
		
	
	
	</div>
	
	</div>
</body>
</html>