<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#flex_container {
	display:flex;
}

#flex_logo {
	background-color : green;
	flex:1;
}

#flex_search {
	background-color : lime;
	flex:1;
}

#flex_gnb {
	background-color : blue;
	flex:2;  /* grow, shrink, basis */
}
</style>


</head>
<body>
		<div id="flex_container">
			<div id="flex_logo">
					<span id="logo">logo</span>
			</div>
			
			<div id="flex_search">
					<span id="search">search</span>
			</div>
			
			<div id="flex_gnb">
					<span id="gnb">gnbz</span>
			</div>
		
		</div>



</body>
</html>