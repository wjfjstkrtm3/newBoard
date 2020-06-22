<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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

.checked {
	text-decoration: line-through;
	color: #c00;
	font-weight:bold;
}

ul li span {
	padding-left: 10px;
}

#doneList li {
	border-bottom: 1px dashed #ccc;
	margin-bottom:4px;
	width:30em;
	height:2.5em;
	padding: 5px 10px;
}

#doneList li span {
	font-size:1.3em;
	font-weight:200;
	padding-left:10px;
	vertical-align:middle;
	text-decoration:line-through;
	color:red;
}
</style>
</head>
<body>
<div class="container">


	<div class="row"> 
		<a href="#"><h1>To Do List</h1></a>
	</div>
	
	<div class="row">
		<div class="col-sm-6">
			<hr>
			<p id="enter">Write what to do and Press Enter!</p>
			
			<p class="inputarea">
				<input type="text" id="inputText" placeholder="what to do">
				<ul id="todoList"></ul>
			</p>
		</div>
	
		<div class="col-sm-6">
			<hr>
			<p id="enter">Done</p>
			
			<ul id="doneList"></ul>
		
		</div>		
	
	</div>




</div>

</body>
<script src="/resources/js/toDoList.js"></script>
</html>