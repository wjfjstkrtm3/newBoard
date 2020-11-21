<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/board/detail.css">
<script type="text/javascript">
	$(document).ready(function() {
			$(".fileDown-link").on("click", function(event) {
					var file_no = $(this).siblings(".board-file_no").text();
					location.href="/board/fileDown?file_no=" + file_no;				
				});
		
		});

</script>
</head>
<body>
<c:set var="board" value="${boardDto}"/>
	<div class="boardDetail-container">
			
	
	


${board.bno}
${board.title}
${board.writer}
${board.content}
${board.regDate}
${board.viewCnt}

<c:forEach var="fileList" items="${selectFileList}">
	파일넘버 : <span class="board-file_no">${fileList.file_no}</span>
	파일이름 : <a href="#" class="fileDown-link">${fileList.org_file_name}</a>
	파일사이즈 : ${fileList.file_size}

</c:forEach>


<a href="/board/delete?bno=${board.bno}">삭제</a> 
<a href="/board/update?bno=${board.bno}">수정</a> 

</div>
</body>
</html>