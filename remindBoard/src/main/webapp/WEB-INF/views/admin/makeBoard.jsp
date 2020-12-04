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

				$(".boardAddBtn").on("click", function() {
							var addBoardText = $(".addBoardText").val();
							var currentBoardHtml = "";
							if(addBoardText.trim() == "") {
								alert("게시판 이름을 입력해주세요 !!");
								return;
								} else {
									currentBoardHtml += "<div class='addForm'><div class='board-title_'>" + addBoardText + "</div>";
									currentBoardHtml += "<div class='delete-icon'><i class='far fa-minus-square fa-1x'></i></div></div>";

										
										$(".current-board-status").append(currentBoardHtml);
									}
					});


				$(document).on("click", ".delete-icon", function(event) {
							$(this).parent().remove();
					});

				
		
		});

</script>
</head>
<body>
	
	<div class="makeBoard-text">
		게시판 만들기
	</div>
	
	<div class="makeBoard-container">
		<div class="makeBoard-form">
			<div class="current-board-status">
				
			</div>
			
			<div class="boardAddDeleteBtn">
					<input type="text" class= "addBoardText" placeholder="추가할 게시판 이름 입력">
					<input type="button" class="boardAddBtn" value="추가하기">
					<div class="arrow-form">
						<i class="fas fa-arrow-alt-circle-left fa-3x"></i>
						<i class="fas fa-arrow-alt-circle-right fa-3x"></i>
					</div>
			</div>
			
			<div class="delete-board-status">
			
			</div>
		
		</div>
	
	
	</div>
	
</body>
</html>