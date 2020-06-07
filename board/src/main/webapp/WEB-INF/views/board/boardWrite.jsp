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
			$("#file_div").append("<div><input type='file' name='file_"+(++file_index)+"'>"+"</button>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});

		$(document).on("click", "#fileDelBtn", function() {
					$(this).parent().remove();
			
				});
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
	<input type="file" name="file_1">
	</div>
	<input type="submit" value="전송하기">
</form>



</body>
</html>