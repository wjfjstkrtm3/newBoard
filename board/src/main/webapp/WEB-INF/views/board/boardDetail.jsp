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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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

			// 북마크했는지 상태체크
			$.ajax({
				url:"/user/scrapCheck",
				type:"POST",
				data:{"bno":$("#board_bno").val()},
				success:function(data) {
					// 북마크 된 게시물이면
					if(data >=1) {
						
						$("#scrap-icon").attr("id", "scrap-noIcon");
						
						// 만약 다시 클릭했을경우 해당 북마크를 없애버려야함
						$(document).on("click", "#scrap-noIcon", function() {
							$.ajax({
								url:"/user/scrapBoardDelete",
								type:"POST",
								data:{"bno":$("#board_bno").val()},
								success:function(data) {
									console.log(data);
									alert("북마크가 취소되었습니다");
									$("#scrap-noIcon").attr("id", "scrap-icon");
									},
								error:function(xhr) {
									console.log(xhr.status + "||" + xhr.statusText);
									}

								});
							});
						
					} else {

						// 북마크 된 게시물아닌걸 눌렀을때
						// 북마크 한 상태로 바꿔주기
						$(document).on("click", "#scrap-icon", function() {
							$.ajax({
								url:"/user/scrapBoard",
								type:"POST",
								data:{"bno":$("#board_bno").val()},
								success:function(data) {
									console.log(data);
									alert("북마크 되었습니다");
									$("#scrap-icon").attr("id", "scrap-noIcon");
									},
								error:function(xhr) {
									console.log(xhr.status + "||" + xhr.statusText);
									}

								});
							
							});
						

						}
					},
				error:function(xhr) {
					console.log(xhr.status + "||" + xhr.statusText);
					}
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
<style type="text/css">
html, body {
	width:100%;
	height:100%;
}

#detail-container {
	display:flex;
	flex-direction:column;
	border: 2px solid orange;
	border-radius:10px;
	width:50%;
	height:50%;
	justify-content:space-around;
	align-items:center;
	position: relative;
}
#flex-box {
	display: flex;
	flex-direction:column;
    width: 100%;
    height: 100%;
    align-items:center;
    margin-top: 100px;
}

.scrap {
	position: absolute;
    left: 100;
    right: 130px;
    bottom: 270px;
 	padding: 5px;
 	cursor: pointer;
}

.scrap:hover {
	opacity:0.2;
}

#scrap-noIcon {
	color:orange;
}


.fa-bookmark {
	color:green;
	font-size:50px;
}

#board-title, #board-content, #board-writer {
	border:2px solid orange;
	border-radius:10px;
	padding:3px;
	
	
}

#board-content p {
	display:inline-block;
}
</style>
</head>
<body>

<c:set var="detail" value="${one}"></c:set>
<input type="hidden" value="${detail.bno}" id="board_bno">
<input type="hidden" id="scrap-check-value">

<div>
<%@include file="../include/nav.jsp"%>

</div>
<div id="flex-box">

	<div id="detail-container">
	<i class="fas fa-bookmark scrap" id="scrap-icon"></i>
	
	
	
	
	<div><span>제목</span><span id="board-title">${detail.title}</span></div>
	<div><span>내용</span><span id="board-content">${detail.content}</span></div>
	<div><span>글쓴이</span><span id="board-writer">${detail.writer}</span></div>
	<c:forEach var="fileList" items="${fileMap}">
		<a href="#" onclick="fn_fileDown('${fileList.f_bno}'); return false;">${fileList.original_file_name}</a>
		${fileList.file_size}
		<input type="hidden" value="${fileList.f_bno}" id="f_bno"><br>
	</c:forEach>
	
	<div>
		<a href="/board/boardUpdate?bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">수정페이지 이동</a>
		<a href="/board/boardDelete?bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">게시글 삭제</a>
	</div>
</div>

<div id="reply-form">

	
		<ol>
	<c:forEach var="reply" items="${reply}">
	
			<li>
				<div>
				작성자 : ${reply.writer} <br>
				날짜 : <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd"/> <br>
				내용 :  ${reply.content}
				</div>
			</li>
			
			<a href="/board/reply/boardReplyUpdate?rno=${reply.rno}&bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">수정</a>
			<a href="/board/reply/boardReplyDelete?rno=${reply.rno}&bno=${detail.bno}&num=${num}&searchType=${sc.searchType}&keyword=${sc.keyword}">삭제</a>
			
	</c:forEach>
		</ol>
	
	</div>
		<c:set var="page" value="${replyPage}"/>
		
		<c:if test="${page.prev}">
			<a href="/board/boardDetail?replyPageNum=${page.startPageNum-1}&bno=${detail.bno}&num=${num}">[이전]</a>
		</c:if>
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="replyPageNum">
			<%-- <a href="/board/boardDetail?replyPageNum=${replyPageNum}&bno=${detail.bno}&num=${num}">[${replyPageNum}]</a> --%>
			<c:if test="${replyPageNum == page.num}">
			<b><a href="/board/boardDetail?replyPageNum=${replyPageNum}&bno=${detail.bno}&num=${num}">[${replyPageNum}]</a></b>
			</c:if>
			<c:if test="${replyPageNum != page.num}">
			<a href="/board/boardDetail?replyPageNum=${replyPageNum}&bno=${detail.bno}&num=${num}">[${replyPageNum}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${page.next}">
			<a href="/board/boardDetail?replyPageNum=${page.endPageNum+1}&bno=${detail.bno}&num=${num}">[다음]</a>
		</c:if>
		 

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

</div>



</body>
</html>