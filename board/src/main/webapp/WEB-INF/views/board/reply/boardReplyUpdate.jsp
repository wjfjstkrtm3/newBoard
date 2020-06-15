<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			$("#reply_btn").click(function() {
				var replyTitle = $("#replyTitle").val();
				var replyContent = $("#replyContent").val();
				console.log(replyTitle);
				console.log(replyContent);
				
				});
		
		});


</script>
</head>
<body>


<div>
<form action="" method="POST">
	제목 : <input type="text" name="writer" value="${replyVo.writer}" readonly="readonly" id="replyTitle"><br>
	내용 : <input type="text" name="content" value="${replyVo.content}" id="replyContent"><br>
	<input type="submit" value="수정하기" id="reply_btn">
</form>
</div>

</body>
</html>