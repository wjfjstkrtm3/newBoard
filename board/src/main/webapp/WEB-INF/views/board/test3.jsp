<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	grid-template-rows:30% 70%;
	height:100%;
	
}


.header-form {
	background-color: black;
    display: grid;
    grid-template-rows: 20% 60% 20%;
    grid-template-columns: 20% 60% 20%;
	
}


.main-footer {
	background-color:green;
}

.header-left {
	background-color:red;
}

.header-right {
	background-color:orange;
}

.right-name {
	display:flex;
}

.name-content {
	margin-left:auto;
}

.header-form-right {
	grid-column: 3 / 4;
	background-color:orange;
}

.header-forALL {
	background-color:orange;
}

.header-coding {
	background-color:red;
}

.header-picture {
	background-color:blue;
}

.header-nav {
	grid-column: 2;
    /* justify-content: space-around; */
    /* justify-items: start; */
    display: flex;
    justify-content: space-around;
}

.header-nav > a {
	margin:auto;
}

.main-footer {
	display:grid;
	grid-template-rows:10% 60% 10% 20%;
    grid-template-columns:20% 60% 20%;
}

.main-left-form {
	grid-column:1;
	grid-row:2;
	display:flex;
	flex-direction:column;
	background-color:yellow;
}

.main-left-title {
	border-bottom: 2px solid black;
    padding: 20px;
}

.main-middle-form {
	display: grid;
    grid-template-rows: 20% 40% 40%;
    grid-column: 2;
    grid-row: 2;
}
.main-middle-title {
	grid-row: 1;
    grid-column: 1;
}

.main-articles {
    grid-row: 2;
    grid-column: 40% 40%;
    grid-template-columns: 50% 50%;
    display: grid;
}

.main-video {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

.main-video-a {
	display:flex;
}

.main-video-a > div {
	background-color: orange;
    margin-right: 10px;
    width: 100px;
    height: 100px;
    margin: auto;
	
}

.main-right {
	background-color:yellow;
	grid-column: 3;
    grid-row: 2;
}

.main-bottom {
	background-color:yellow;
	grid-column:2;
	grid-row:4;
}
</style>
</head>
<body>

	<div class="grid-container">
		<div class="header-form">
			<div class="header-form-right">
				<span>012345 정낑깡</span>
			</div>
			<div class="header-forALL">zzz</div>
			<div class="header-coding">1분코딩</div>
			<div class="header-picture">그림</div>
			<div class="header-nav">
				<a href="">1번</a>
				<a href="">2번</a>
				<a href="">3번</a>
				<a href="">4번</a>
			</div>
		
		</div>
		<div class="main-footer">
		
			<div class="main-left-form">
				<span class="main-left-title">최신 튜토리얼</span>
			</div>
			<div class="main-middle-form">
				<div class="main-middle-title">
					<span>FRESH ARTICLES</span>
				</div>
				
				<div class="main-articles">
					<span class="main-article-one">1번 글</span>
					<span class="main-article-two">2번 글</span>
				
				</div>	
				<div class="main-video">
				영상올자리
				<div class="main-video-a">
					<div>1</div>
					<div>2</div>
					<div>3</div>
					<div>4</div>
				</div>
				</div>
				
			
			
		
		</div>
		
		
		<div class="main-right">WANTED</div>
		<div class="main-bottom">BOTTOM</div>
	</div>
	</div>
	
	
	
	
	
	
	
	
</body>
</html>