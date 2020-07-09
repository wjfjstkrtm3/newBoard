<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
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
		$("#write_btn").click(function(event) {
			var title = $("#board_title").val();			
			if(title == null || title == "") {
				event.preventDefault();
				alert("글 제목을 입력해주세요");
				
				} 

			
			});

		$('#summernote').summernote({
			 height: 300,                 // 에디터 높이
			 minHeight: null,             // 최소 높이
			 maxHeight: null,             // 최대 높이
			 focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			 lang: "ko-KR",					// 한글 설정
			 placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		
		});



		
		});
		
			

</script>
</head>
<body>
<div>
<%@include file="../include/nav.jsp"%>
</div>
<form action="" method="post" enctype="multipart/form-data">
	제목 : <input type="text" name="title" id="board_title">
    <textarea id="summernote" name="content"></textarea>
	<button id="fileAdd">파일추가하기</button>
	<br>
	<br>
	<div id="file_div">
	<input type="file" name="file_1">
	</div>
	<input type="submit" value="전송하기" id="write_btn">
</form>



</body>
</html>