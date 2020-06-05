<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var file_index = 1;
		$("#fileAdd").on("click", function(event) {
			event.preventDefault();
			var fileInput = document.createElement("input");
			fileInput.setAttribute("type", "file");
			fileInput.setAttribute("name", "file_" + ++file_index);

			$("#file_div").append(fileInput);
			
			})

		
		})

</script>
</head>
<body>
<div>
<%@include file="../include/nav.jsp"%>
</div>
<form action="" method="post" enctype="multipart/form-data">
	제목 : <input type="text" name="title">
	내용 : <input type="text" name="content">
	글쓴이 : <input type="text" name="writer">
	<button id="fileAdd">파일추가하기</button>
	<br>
	<br>
	<div id="file_div">
	<input type="file" name="file_1"><br>
	</div>
	<input type="submit" value="전송하기">
</form>



</body>
</html>