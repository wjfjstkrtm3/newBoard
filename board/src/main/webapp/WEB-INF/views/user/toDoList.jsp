<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul {
	list-style:none;
	padding:0;
	margin:0;
	width:500px;
}

ul li {
border: 1px solid #ccc;
background: #eee;
padding: 5px 10px;
}

</style>
</head>
<body>
<h1>To do List 만들기</h1>
<p>
	<input type="text" id="inputText">
	<button id="btnAdd">New Item</button>
</p>

<ul id="todoList">
	
</ul>


</body>
<script src="/resources/js/toDoList.js"></script>
</html>