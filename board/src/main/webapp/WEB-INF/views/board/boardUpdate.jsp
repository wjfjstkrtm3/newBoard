<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<style type="text/css">
input[type=file] {
	display:inline-block;
}

</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		var file_index = "${fn:length(fileList)}";
		$("#fileAdd").on("click", function(event) {
			event.preventDefault();
			$("#file_div").append("<div><input type='file' name='file_"+(++file_index)+"'>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");

			
			});

		$(document).on("click", "#fileDelBtn", function() {
					$(this).parent().remove();
			
				});
		
		$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
				console.log(fileNoArry);
				console.log(fileNameArry);
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
		
		
		var fileNoArry = new Array();
		var fileNameArry = new Array();
		function fn_del(value, name) {
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
			}
		
</script>
</head>
<body>
<%@include file="../include/nav.jsp"  %>
<c:set var="detail" value="${one}"></c:set>

<form action="" method="post" enctype="multipart/form-data">
	제목 : <input type="text" name="title" value="${detail.title}">
	글쓴이 : <input type="text" name="writer" value="${detail.writer}">
	<textarea id="summernote" name="content">${detail.content}</textarea>
	<button id="fileAdd">파일추가하기</button>
	<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
	<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
	
	
	
	
	<c:forEach var="file" items="${fileList}" varStatus="var">
	<p>
	<a href="#" id="name_${var.index }">${file.original_file_name }</a>
	<input type="file" id="file_${var.index}" name="file_${var.index}"> 
	(${file.file_size }kb)
<button id="fileDel" onclick="fn_del('${file.f_bno}','FILE_NO_${var.index}');" type="button">삭제</button><br>


	</p>
	</c:forEach>
	<div id="file_div">
	</div>
	
	<input type="submit" value="수정하기">
</form>


</body>
</html>