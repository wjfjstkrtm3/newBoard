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

#boardPointer, #bookMarkIcon {
	cursor:pointer;
	width:120px;
	font-weight:bold;
}

#boardPointer:hover, #bookMarkIcon:hover {
	opacity:0.5;
}

.clicked {
	display:none;
}

.clicked2 {
	display:none;
}


[id^='boardContent_']:hover {
	opacity:0.5;
}

[id^='boardContent_'] {
	cursor:pointer;
	margin-left: 15px;
	
}

[id^='boardDetail_'] {
	border: 2px solid orange;
    border-radius: 10px;
    padding: 15px;
    width: 50%;
    display:none;
}

[id^='bookMarkTitle_']:hover {
	cursor:pointer;
	opacity:0.5;
}

[id^='bookMarkContent_'] {
	display:none;
	margin-left:15px;
}

[id^='bookMarkTitle_'] > a {
	text-decoration:none;
}

.fa-book {
	color:#3BAEE5;
}

.fa-pen-square {
	color:#5AC18E;
}
</style>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
<script type="text/javascript">
	window.onload = function() {
		let boardPointer = document.querySelector("#boardPointer");
		let boardList = document.querySelector("#writeBoardList");		
		let boardContent = document.querySelector("#boardContent");
		let boardContentDetail  = document.querySelector("#boardContentDetail");
		
		boardPointer.addEventListener("click", boardListPage);
	
		function boardListPage() {
			// boardList가 자식이 있을경우  즉 쓴글이 있을경우를 뜻함
			if(boardList != null) {
				boardList.classList.toggle("clicked");
				}
			}


		

			$("[id^='boardContent_']").on("click", function(event) {
					var board_bno = $(this).next().val();
					var content = $(this).parent().next();
					var contentId = $(this).parent().next().prop('id');
					var contentStatus = $(this).parent().next();
					if(contentStatus.prop('class') === "contentClicked") {
						content.hide();
						contentStatus.attr("class", "");
						return;
						}

					// var contentClicked = $(this).parent().next().attr("class", "contentClicked");
					// var contentClass = $(this).parent().next().prop('class');

					

					
						$.ajax({
							url:"/user/getBoardContent",
							type:"POST",
							data:{"bno":board_bno},
							success:function(data) {
								document.getElementById(contentId).style.display="block";
								var regDate = new Date(data.regDate);

								var year = regDate.getFullYear();
								var month = regDate.getMonth() + 1;
								month = (month < 10) ? "0" + month : month;
								var date = regDate.getDate();
								date = (date < 10) ? "0" + date : date;
								var resultRegDate = year + "-" + month + "-" + date;
							var html = "<div id='content'>" + data.content + "</div>";
								html += "<span id='regDate'>" + resultRegDate + "</span>";
								html += "<span id='viewCnt'>" + "조회수" + data.viewCnt + "</span>";
								content.html(html);	

								contentStatus.attr("class", "contentClicked");
								
								
								},
							error:function(xhr) {
								console.log(xhr.status + "||"  + xhr.statusText);
								}


						});
				});
	
				$("#bookMarkIcon").on("click", function() {
						$("[id^='bookMarkContent_']").toggle();

						

						
					});
					
		


		
	
		

		}


</script>


</head>
<body>

<div id="list-container">
	<div id="writeBoardListForm">
	
		<span id="boardPointer">▶내가 쓴글</span>
		
		<div id="writeBoardList" class="clicked">
		
		<c:forEach var="board" items="${boardList}" varStatus="status">
			<div>
			     <span id="boardContent_${status.index}">
			     <span id="contentPointer"><i class="fas fa-pen-square"></i></span>${board.title}
			     </span>
				 <input type="hidden" value="${board.bno}" id="board_bno">
		    </div>
		    
			<div id="boardDetail_${status.index}"></div>
		</c:forEach>
	
		</div>
		
		
	</div>
	<div id="bookMarkListForm">
		<span id="bookMarkIcon">▶북마크 한 글</span>
		<div id="bookMarkList">
		
			<div id="bookMarkForm">
			<c:forEach var="book" items="${bookMarkList}" varStatus="status">
			<div id="bookMarkContent_${status}">
			<div id="bookMarkTitle_${status}">
			<i class="fas fa-book"></i>
			<a href="/board/boardDetail?bno=${book.bno}">${book.title}</a>
			</div>
			</div>
			
			</c:forEach>
			
			
			
			
			</div>
		
		
		</div>
	</div>

</div>


</body>
</html>