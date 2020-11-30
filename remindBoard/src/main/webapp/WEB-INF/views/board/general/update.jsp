<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
			var bno = $(".boardUpdate-bno").val();
			
			

			
			/* $(".boardUpdate-writeBtn").on("click", function() {
				location.href="/board/update?bno=" + bno;
				});
 */

			// 파일 번호
			var filesNo = new Array();

			// 파일 이름
			var filesName = new Array();
			
			$(".updateFileBtn").on("click", function(event) {
				// event.currentTarget = 이벤트가 생성된 지점
				// event.target = 이벤트가 발생된 지점
					var file_no = $(this).siblings(".board-file_no").val();
					var file_name = $(this).siblings(".board-file_name").val();
					
					filesNo.push(file_no);
					filesName.push(file_name);

					$(".filesNo").val(filesNo);
					$(".filesName").val(filesName);

					$(this).parent().remove();
											
						
				});
			
		});


</script>
</head>
<body>
<c:set var="board" value="${boardDto}"/>

	<div class="boardUpdate-container">
		<form action="/board/update" method="POST" class="boardUpdate-actionForm" enctype="multipart/form-data">
			<div class="boardUpdate-title-form">
				<input type="text" class="boardUpdate-title" value="${board.title}" id="boardUpdate-title" name="title" placeholder="&nbsp;&nbsp;제목">
			</div>
			
			<div class="boardUpdate-file-form">
			
			
				<!-- 업로드한 파일이 5개 미만이면 -->				 
				<c:if test="${fileCount < 5}">
				<i class="far fa-save fa-1x"></i><input type="file" name="file_0">
				<i class="far fa-save fa-1x"></i><input type="file" name="file_1">
				</c:if>
				
				
				<c:forEach var="fileList" items="${selectFileList}" varStatus="status">
							<span class="fileList_${status.index}">
							
								<input type="hidden" value="${fileList.file_no}" class="board-file_no">
								<input type="hidden" value="fileList_${status.index}" class="board-file_name">	
								
								<i class="far fa-save fa-1x"></i>
								<a href="#" class="fileDown-link">${fileList.org_file_name}</a>
								<input type="button" class="updateFileBtn" value="삭제">
							</span>
				</c:forEach>
			</div>
			
			<div class="boardUpdate-content-form">
				<input type="text" value="${board.content}" class="boardUpdate-content" id="boardUpdate-content" name="content" placeholder="&nbsp;&nbsp;내용">
				<input type="hidden" value="${board.bno}" name="bno" class="boardUpdate-bno">
				<input type="hidden" value="" class="filesNo" name="filesNo">
				<input type="hidden" value="" class="filesName" name="filesName">
				<input type="submit" value="작성" class="boardUpdate-writeBtn btn-primary">
			</div>
		</form>
	</div>


<!--  

			
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

-->





</body>
</html>