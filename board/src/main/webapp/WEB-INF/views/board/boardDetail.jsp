<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var cleanText = $("#board_content").val().replace(/<\/?[^>]+(>|$)/g, "");
		$("#board_content").val(cleanText);
		
			$("#list_btn").click(function() {
					location.href="/board/boardListPageSearch?num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}";
				});

			/* $("#reply_btn").on("click", function(event) {
					event.preventDefault();
					$("#reply_form").attr("action", "/board/boardReplyWrite");
					$("#reply_form").submit();
				});	 */
			
			$("#reply_btn").click(function(event) {
					var replyWriter = $("#replyWriter").val();
					var replyContent = $("#replyContent").val();
					console.log($("#reply_form").serializeObject());
					var dataForm = JSON.stringify({
						"replyWriter":replyWriter,
						"replyContent":replyContent
						});
					var dataForm3 = JSON.stringify($("#reply_form").serializeObject());
					
					$.ajax({
						url : "/board/boardReplyWrite",
						type : "POST",
						data : dataForm3,
						contentType : "application/json; charset=UTF-8",
						success :  function(data) {
						},
						error : function(xhr) {
							console.log(xhr.status + "||" + xhr.statusText);
						}


						
						});

					
				});
		});
	
		function fn_fileDown(f_bno) {
			location.href="/board/fileDown?f_bno=" + f_bno;
		}
		
		jQuery.fn.serializeObject = function() {
		    var obj = null;
		    try {
		        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
		            var arr = this.serializeArray();
		            if (arr) {
		                obj = {};
		                jQuery.each(arr, function() {
		                    obj[this.name] = this.value;
		                });
		            }//if ( arr ) {
		        }
		    } catch (e) {
		        alert(e.message);
		    } finally {
		    }
		 
		    return obj;
		};



</script>
</head>
<body>

<c:set var="detail" value="${one}"></c:set>
<div>
<%@include file="../include/nav.jsp"%>

</div>
	
	제목 : <input type="text" name="title" value="${detail.title}" readonly="readonly">
	내용 : <input type="text" name="content" id="board_content" value="${detail.content}" readonly="readonly">
	글쓴이 : <input type="text" name="writer" value="${detail.writer}" readonly="readonly">
	
	<c:forEach var="fileList" items="${fileMap}">
		<a href="#" onclick="fn_fileDown('${fileList.f_bno}'); return false;">${fileList.original_file_name}</a>
		${fileList.file_size}
		<input type="hidden" value="${fileList.f_bno}" id="f_bno"><br>
	</c:forEach>
	
<div>
	<a href="/board/boardUpdate?bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">수정페이지 이동</a>
	<a href="/board/boardDelete?bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">게시글 삭제</a>
</div>

<div>
		<ol>
	<c:forEach var="reply" items="${reply}">
			<li>
				작성자 : ${reply.writer} <br>
				날짜 : <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd"/> <br>
				내용 :  ${reply.content}
			</li>
			
			<a href="/board/reply/boardReplyUpdate?rno=${reply.rno}&bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">수정</a>
			<a href="/board/reply/boardReplyDelete?rno=${reply.rno}&bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">삭제</a>
			
	</c:forEach>
		</ol>
		
</div>
<div>
	<form method="POST" id="reply_form">
		<input type="hidden" name="bno" id="bno" value="${detail.bno }">
		<input type="hidden" name="num" id="num" value="${num}">
		<input type="hidden" name="searchType" id="searchType" value="${sc.searchType}">
		<input type="hidden" name="keyword" id="keyword" value="${sc.keyword}">
	
		작성자 : <input type="text" name="writer" id="replyWriter">
		내용 : <input type="text" name="content" id="replyContent">
		<input type="submit" value="댓글작성" id="reply_btn">
	</form>


</div>

</body>
</html>