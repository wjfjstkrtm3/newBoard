<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		var id = $(".boardDetail-writer").val();	
		var bno = $(".boardDetail-bno").val();	
		var statusData = {"id":id, "bno":bno};
		// 북마크 상태 가져오기
			$.ajax({
					url:"/user/boardBookMarkStatus",
					type:"POST",
					contentType:"application/json; charset=utf-8",
					data:JSON.stringify(statusData),
					success: function(data) {
							if(data === 1) {
								$(".bookMarkStatusText").val("true");
									$(".bookMark-span").empty();
									$(".bookMark-span").append("<i class='fas fa-star fa-3x bookMarked-color'></i>");
								} else {
									$(".bookMarkStatusText").val("false");
									}
						
						},
					error:function(xhr) {
						console.log(xhr.status + xhr.statusText);
						}
				});



		
					

				// 북마크 클릭했을때
				$(".bookMarkBtn").on("click", function() {
					var bookMarkStatusText = $(".bookMarkStatusText").val();
					var statusData = {"id":id, "bno":bno, "bmStatus":bookMarkStatusText};

					$.ajax({
						url:"/user/boardBookMark",
						type:"POST",
						data:JSON.stringify(statusData),
						contentType:"application/json; charset=utf-8",
						success:function(data) {

							// 북마크를 등록했을경우
							if(data === "insert") {
							$(".bookMarkStatusText").val("true");
							alert("북마크를 등록하였습니다");
							
							$(".bookMark-span").empty();
							$(".bookMark-span").append("<i class='fas fa-star fa-3x bookMarked-color'></i>");
								}

							// 북마크를 해재했을경우
							if(data === "delete") {
							$(".bookMarkStatusText").val("false");	
							alert("북마크를 해제하였습니다");
							
							$(".bookMark-span").empty();
							$(".bookMark-span").append("<i class='far fa-star fa-3x bookMark-color'></i>");
								}
							
							
							},
						error:function(xhr) {
							console.log(xhr.status + "/" + xhr.stautsText);
							}
					
						});





					
					});
		
			
			


			
		
			/* 첨부파일 다운 */
			$(".fileDown-link").on("click", function(event) {
					var file_no = $(this).siblings(".board-file_no").val();
					location.href="/board/fileDown?file_no=" + file_no;		
				});

			var bno = $(".boardDetail-bno").val();
			/* 수정 버튼 */
			$(".boardDetail-updateBtn").on("click", function() {
				location.href="/board/update?bno=" + bno;

				
				});
			
			
			/* 삭제 버튼 */
			$(".boardDetail-deleteBtn").on("click", function() {
				location.href="/board/delete?bno=" + bno;
				});



			
		});


</script>
</head>
<body>
<c:set var="board" value="${boardDto}"/>


	<div class="boardDetail-container">
		<div class="boardDetail-form">
			<div class="boarDetail-title">
				 <span class="boardDetail-title-text">${board.title}</span>
				 	<div class="boardDetail-board-info">
				 	
				 		<div class="boardDetail-board-writer-form">
							<i class="far fa-user fa-1x"></i>
							<span class="boardDetail-board-writer">${board.writer}</span>
				 		</div>
				 		
				 		<div class="boardDetail-board-regDate-form">
				 			<i class="far fa-clock fa-1x"></i>
				 			<span class="boardDetail-board-regDate">
				 			<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm"/>
				 			</span>
				 		</div>
				 		
				 		<div class="boardDetail-board-viewCnt-form">
				 			<i class="far fa-eye fa-1x"></i>
				 			<span class="boardDetail-board-viewCnt">${board.viewCnt}</span>
				 		</div>
				 		
				 		<div class="boardDetail-board-replyCount-form">
				 			<i class="far fa-comment-dots fa-1x"></i>
				 			<span class="boardDetail-board-replyCount">댓글 수</span>
				 		</div>
				 		
				 		<div class="bookMark-span">
				 			<i class="far fa-star fa-3x bookMark-color"></i>
				 		</div>
				 			<button class="bookMarkBtn">북마크</button>
				 		
				 		
					</div>
					
					<div class="boardDetail-file-form">
						<div class="boardDetail-file">
						<c:forEach var="fileList" items="${selectFileList}" varStatus="status">
							<span class="fileList_${status.index}">
							<input type="hidden" value="${fileList.file_no}" class="board-file_no">
							<i class="far fa-save fa-1x"></i>
							<a href="#" class="fileDown-link">${fileList.org_file_name}</a>
							</span>
						</c:forEach>
						</div>
					</div>
					
					
			</div>
			<div class="boarDetail-content-form">
				<span class="boardDetail-content-text">
					${board.content}
				</span>
			
			</div>
		</div>
		
		<div class="boardDetail-button-form">
		<input type="button" value="수정" class="boardDetail-updateBtn btn-primary">
		<input type="button" value="삭제" class="boardDetail-deleteBtn btn-primary">
		<input type="hidden" value="${board.bno}" class="boardDetail-bno">
		<input type="hidden" value="${userDto.id}" class="boardDetail-writer">
		<input type="hidden" value="" class="bookMarkStatusText">
		</div>
		
		
		<div class="boarDetail-replyBoard">
			댓글
		
		</div>
	
	

<%-- 
${board.bno}
${board.title}
${board.writer}
${board.content}
${board.regDate}
${board.viewCnt} --%>




 

</div>





</body>
</html>