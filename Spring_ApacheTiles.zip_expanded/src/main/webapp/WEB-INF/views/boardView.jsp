<%@ page pageEncoding="UTF-8"%>
<h1>Board View</h1>

<table border="1">
<tbody>
	<tr>
		<th>번호</th>
		<td>${vo.num}</td>
		<th>작성자</th>
		<td>${vo.name}</td>
		<th>작성일</th>
		<td>${vo.writeDate}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3">${vo.title}</td>
		<th>조회수</th>
		<td>${vo.readCount}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="5">${vo.content}</td>
	</tr>
</tbody>
</table>
