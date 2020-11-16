<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Board List</h1>

<table border="1">
<thead>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>제목</th>
		<th>조회</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
	<tr>
		<td>${item.num}</td>
		<td>${item.name}</td>
		<td><a href="<c:url value='/boardView.do?num=${item.num}'/>">${item.title}</a></td>
		<td>${item.readCount}</td>
		<td>${item.writeDate}</td>
    </tr>
</c:forEach>
</tbody>
</table>
