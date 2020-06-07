<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var file_index = "${fn:length(fileList)}";
		$("#fileAdd").on("click", function(event) {
			event.preventDefault();
			$("#file_div").append("<div><input type='file' name='file_"+(++file_index)+"'>"+"</button>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});

		$(document).on("click", "#fileDelBtn", function() {
					$(this).parent().remove();
			
				});
		});
		
		$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
				console.log(fileNoArry);
				console.log(fileNameArry);
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

<c:set var="detail" value="${one}"></c:set>

<form action="" method="post" enctype="multipart/form-data">
	제목 : <input type="text" name="title" value="${detail.title}">
	내용 : <input type="text" name="content" value="${detail.content}">
	글쓴이 : <input type="text" name="writer" value="${detail.writer}">
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