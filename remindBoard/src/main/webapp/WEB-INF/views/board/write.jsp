<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/board/write" method="POST">
제목 : <input type="text" class="board-title" id="board-title" name="title">
내용 : <input type="text" class="board-content" id="board-content" name=content>
<input type="submit" id="write-btn" name="write-btn" class="write-btn" value="작성">

</form>
게시물 생성 페이지




</body>
</html>