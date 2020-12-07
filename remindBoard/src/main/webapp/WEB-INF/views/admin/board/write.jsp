<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="boardWrite-container">
		<form action="/admin/write" method="POST" enctype="multipart/form-data" class="boardWrite-actionForm">
			<div class="boardWrite-title-form">
				<input type="text" class="boardWrite-title" id="boardWrite-title" name="title" placeholder="&nbsp;&nbsp;제목">
			</div>
			
			<div class="boardWrite-file-form">
				<i class="far fa-save fa-1x"></i><input type="file" name="file_0">
				<i class="far fa-save fa-1x"></i><input type="file" name="file_1">
			</div>
	
			<div class="boardWrite-content-form">
				<input type="text" class="boardWrtie-content" id="boardWrite-content" name="content" placeholder="&nbsp;&nbsp;내용">
				<input type="submit" value="작성" class="boardWrite-writeBtn btn-primary">
			</div>
	
			<div class="boardWrite-button-form">
			</div>
			<input type="hidden" value="${id}" name="board_type">
		</form>
	</div>



</body>
</html>