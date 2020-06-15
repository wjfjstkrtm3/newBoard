<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#flex-container {
	display:flex;
	flex-direction:row;
	border: 2px solid black;
	width: 80%;
	height: 80%;
	align-items: center;
	justify-content : center;
}

#left-square {
	border: 2px solid black;
	width:20%;
	height: 20%;
}

#right-container {
	display: flex;
    flex-direction: column;
    justify-content: space-around;
    height: 26%;
    margin-left: 100px;
}

#left-item {
	margin-top : 20px;
	border: 2px solid red;

}

#zz, #xx, #yy {
	border : 1px solid red;
	width: 100px;
}
</style>


</head>
<body>
		<div id="flex-container">
		
			<div id="left-square">
			</div>
		
			<div id="right-container">
				<div id="zz">1</div>	
				<div id="xx">2</div>	
				<div id="yy">3</div>	
			
			</div>
		
		
		
		
		</div>

</body>
</html>