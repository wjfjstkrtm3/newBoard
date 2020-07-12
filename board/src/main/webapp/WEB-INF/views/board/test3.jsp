<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그리드 연습</title>
<style type="text/css">

html, body {
	width:100%;
	height:100%;
}

.grid-container {
	display:grid;
	background-color:yellow;
	grid-auto-rows:minmax(100px, auto);
	grid-template-columns:repeat(auto-fill, minmax(30%, auto));
}

.grid-container > span {
	background-color:orange;
}


</style>
</head>
<body>

	<div class="grid-container">
		<span>A</span>
		<span>B</span>
		<span>C</span>
		<span>D</span>
		<span>E</span>
		<span>F</span>
		<span>G</span>
		<span>H</span>
		<span>I</span>
	</div>
	

</body>
</html>