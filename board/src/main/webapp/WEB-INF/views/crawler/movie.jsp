<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<style type="text/css">
html, body {
	width:100%;
	height:100%;
}

#movieContents {
	width: 100%;
    height: 100%;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
}

#moviePoster {
	display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    border: 2px solid black;
    border-radius: 3px;
    margin: 50px 20px;
	
}

#movieImgs {
	width: 160px;
    height: 200px;

}

#movieInfo {
	display:flex;
	flex-direction:column;
	
}
</style>
</head>
<body>
<div id="movieContents">
<c:forEach var="movie" items="${movieList}" varStatus="status">
	
	
	
		<div id="moviePoster">
			<div id="movieImg">
			<img src="${movie.imgs}" id="movieImgs">
			</div>
			
			<div id="movieName">
			<strong>${movie.movieTitles}</strong>
			</div>
			
			<div id="movieInfo">
				<div>
				<span>예매율 ${movie.movieReserveRates} | </span>
				<span>${movie.movieRates}</span>
				</div>
			<span>${movie.movieOpenDates }</span>
			</div>		
		</div>
	
	
	
</c:forEach>
</div>
<input type="hidden" value="${movieList}" id="movie">


</body>
</html>