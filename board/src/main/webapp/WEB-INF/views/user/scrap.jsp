<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
html, body {
	height:100%;
	width:100%;
}

#scrap-container {
	display:flex;
	/*height:100%;*/
	width:100%;
	flex-wrap:wrap;
}

#scrap-info-container {
	display: flex;
    flex-direction: column;
    border: 2px solid orange;
    cursor: pointer;
    width: 10%;
    height: 100px;
    border-radius: 10px;
    padding: 4px;
    margin: 20px 10px;
}


#scrap-info-container:hover {
	opacity: 0.2;
}

#board_content {
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	

}
#board_title {
	font-weight:bold;
}

#scrap-info-container div > p {
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;

}
</style>
<script type="text/javascript">
	$(document).ready(function() {


		$(document).on("click", "#scrap-info-container", function(event) {
			console.log(event.currentTarget);
			console.log($(event.currentTarget).children("#board_bno").val());
			var bno = $(event.currentTarget).children("#board_bno").val()
			location.href="/board/boardDetail?bno=" + bno;
			});
		
		});


</script>

</head>
<body>
<div id="scrap-container">

<c:forEach var="list" items="${boardList}"> 
	
		<div id="scrap-info-container">
			<input type="hidden" value="${list.bno}" id="board_bno">
			<div id="board_title">${list.title}</div>
			<div>${list.writer}</div>
			<div id="board_content">${list.content}</div>
		</div>
	

</c:forEach>
</div>	
<c:if test="${empty boardList }">
북마크 된 글이 없습니다.
</c:if>




</body>
</html>