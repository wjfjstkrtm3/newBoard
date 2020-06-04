<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<%@include file="../include/nav.jsp"%>
</div>
<form action="" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bno" value="${bno}">
	제목 : <input type="text" name="title">
	내용 : <input type="text" name="content">
	글쓴이 : <input type="text" name="writer">
	<input type="file" name="file">
	<input type="submit" name="전송하기">
</form>



</body>
</html>