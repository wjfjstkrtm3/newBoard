<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	width:100%;
	height:100%;
}

#list-container {
	display:flex;
	flex-direction:row;
	width:100%;
	height:100%;
}

#writeBoardListForm, #bookMarkListForm {
	border-right:2px solid black;
	flex:1;
	padding:4px;
	display:flex;
	flex-direction:column;
}

#boardPointer {
	cursor:pointer;
	width:100px;
}

#boardPointer:hover {
	opacity:0.5;
}

.clicked {
	display:none;
}

.clicked2 {
	display:none;
}

#contentPointer_* {
	cursor:pointer;
}

[id^='boardContent_']:hover {
	opacity:0.5;
}

[id^='boardContent_'] {
	cursor:pointer;
}

</style>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script type="text/javascript">
	window.onload = function() {
		let boardPointer = document.querySelector("#boardPointer");
		let boardList = document.querySelector("#writeBoardList");		
		let boardContent = document.querySelector("#boardContent");
		let boardContentDetail  = document.querySelector("#boardContentDetail");
		
		boardPointer.addEventListener("click", boardListPage);
	
		function boardListPage() {
			// boardList가 자식이 없을경우  즉 쓴글이 없을경우를 뜻함
			if(boardList != null) {
				boardList.classList.toggle("clicked");
				}
			}


			$("[id^='boardContent_']").on("click", function(event) {

					var board_bno = $(this).next().val();
					var content = $(this).parent().next();
					$.ajax({
							url:"/user/getBoardContent",
							type:"POST",
							data:{"bno":board_bno},
							success:function(data) {
							var html = "<div>" + data.content + "</div>";
								html += "<span>" + data.regDate + "</span>";
								html += "<span>" + data.viewCnt + "</span>";
								content.html(html);	
								
								},
							error:function(xhr) {
								console.log(xhr.status + "||"  + xhr.statusText);
								}


						});
				});
	
			


		
	
		

		}


</script>


</head>
<body>

<div id="list-container">
	<div id="writeBoardListForm">
	
		<span id="boardPointer"><c:if test="${!empty boardList}">▶</c:if>내가 쓴글</span>
		
		<div id="writeBoardList" class="clicked">
		
		<c:forEach var="board" items="${boardList}" varStatus="status">
			<div>
			     <span id="boardContent_${status.index}">
			     <span id="contentPointer">→</span>${board.title}
			     </span>
				 <input type="hidden" value="${board.bno}" id="board_bno">
		    </div>
		    
			<div id="boardDetail_${status.index}"></div>
		</c:forEach>
	
		</div>
		
		
	</div>
	<div id="bookMarkListForm">
		<span>북마크 한 글</span>
		<div id="bookMarkList">
		
			<div></div>
		
		
		</div>
	</div>

</div>


</body>
</html>