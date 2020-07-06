<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	

}

#newsKind {
	font-weight:bold;
	
}

</style>
</head>
<body>

<!-- [{1,2,3}, {1,2,3}, {1,2,3}] -->
<!-- List에 담겨있을때나 [0], [1]번째 이렇게 사용이 가능하다 -->

<!-- forEach문 한번 때리면 {1,2,3}, {1,2,3} {1,2,3} -->
<!-- 한번 더 때리면 1,2,3, 1,2,3, 1,2,3 -->
<c:forEach var="newsList" items="${newsMap}" varStatus="status">
			<c:choose>
				<c:when test="${status.index == 0}">
					<hr><div id="newsKind">정치</div>
				</c:when>
				<c:when test="${status.index == 1}">
					<hr><div id="newsKind">경제</div>
				</c:when>
				<c:when test="${status.index == 2}">
					<hr><div id="newsKind">사회</div>
				</c:when>
				
				<c:when test="${status.index == 3}">
					<hr><div id="newsKind">생활/문화</div>
				</c:when>
				
				<c:when test="${status.index == 4}">
					<hr><div id="newsKind">세계</div>
				</c:when>
				
				<c:when test="${status.index == 5}">
					<hr><div id="newsKind">IT/과학</div>
				</c:when>
			</c:choose>
			
	<c:forEach var="news" items="${newsList}">
	
	<a href="${news.value}">${news.key}</a><br>
	</c:forEach>

</c:forEach> 

<%-- <c:forEach var="news" begin="0" end="${fn:length(newsMap)}" varStatus="status">
	${newsMap[status.index].key}<br>


</c:forEach>  --%>




</body>
</html>