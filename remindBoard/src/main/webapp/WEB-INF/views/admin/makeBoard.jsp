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

		// 게시물 '-' 눌렀을때 쓰는 함수  (오른쪽에 나오게)
		function boardRemove(text) {
				var deleteBoardHtml = "<div class='deleteForm'><div class='deleteBoard-title_'>" + text + "</div>";
					deleteBoardHtml += "<div class='add-icon'><i class='far fa-plus-square'></i></div></div>";
				$(".delete-board-status").append(deleteBoardHtml);
			
			}

		// 게시물 '+' 눌렀을때 쓰는 함수 (왼쪽에 나오게)
		function boardAdd(text) {
			var currentBoardHtml = "<div class='addForm'><div class='board-title_'>" + text + "</div>";
				currentBoardHtml += "<div class='delete-icon'><i class='far fa-minus-square fa-1x'></i></div></div>";
			$(".current-board-status").append(currentBoardHtml);
			
			}

				// 추가하기 버튼을 눌렀을때
				$(".boardAddBtn").on("click", function() {
							var text = $(".addBoardText").val();
							
							if(text.trim() == "") {
								alert("게시판 이름을 입력해주세요 !!");
								return;
								} else {
									boardAdd(text);
									}
					});

				// 게시물 '-' 눌렀을때
				$(document).on("click", ".delete-icon", function(event) {
							$(this).parent().remove();
							
							// 삭제버튼을 누른 게시판의 이름
							var text = $(this).siblings(".board-title_").text();
							
							boardRemove(text);
					});

				// 게시물 '+' 눌렀을때
				$(document).on("click", '.add-icon', function(event) {
							$(this).parent().remove();

							// 추가버튼을 누른 게시판의 이름
							var text = $(this).siblings(".deleteBoard-title_").text();
							boardAdd(text);
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