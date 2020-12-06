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
			var addNum = 0;
			var removeNum = 0;
			var dataArray = new Array();
			var deleteArray = new Array();
			var ajaxHtml = "";
			var menuHtml = "";
			$.ajax({
					url:"/admin/getBoardTitleList",
					type:"POST",
					success:function(data) {
						var currentBoardHtml = "";
						if(data !== null) {
						
							$.each(data, function(index, element) {
								
								ajaxHtml += "<div class='addForm_"+ index + "'><div class='board-title_" + index + "'>" + element.type + "</div>";
								ajaxHtml += "<div class='delete-icon'><i class='far fa-minus-square fa-1x'></i></div></div>";

								// menu 게시판 제목 등록
								menuHtml += "<div class='board-title'><a href='/admin/goBoardByType?id=" + element.id + "'>" + element.type + "</a></div>";
								});

								
								$(".current-board-status").append(ajaxHtml);
								$(".main-content-menu-items").append(menuHtml);
						    
							
							}
						
					},
					error:function(xhr) {
						console.log(xhr.status + "/" + xhr.statusText);	
					}
					
				});



			
		// 게시물 '-' 눌렀을때 쓰는 함수  (오른쪽에 나오게)
		function boardRemove(text) {
			for(var i = 0; i < dataArray.length; i++) {
					console.log(dataArray[i]);
				}

			// 중복 게시판 생성안되게
			
			
			// 저장된 게시판 배열에서 해당 게시판 이름을 push
			dataArray.pop(text);

			// 삭제될 게시판 배열에 push
			deleteArray.push(text);
			
			removeNum ++;
				var deleteBoardHtml = "<div class='deleteForm'><div class='deleteBoard-title_" + removeNum + "'>" + text + "</div>";
					deleteBoardHtml += "<div class='add-icon'><i class='far fa-plus-square'></i></div></div>";
				$(".delete-board-status").append(deleteBoardHtml);
			
			}

		function invalidateBoard(text) {
				if(dataArray[index] == text) {
					alert("중복된 게시판 제목입니다! 다시입력해주세요");
					return;
				}
			}
		
		// 게시물 '+' 눌렀을때 쓰는 함수 (왼쪽에 나오게) or 추가하기 버튼을 눌렀을때 
		function boardAdd(text) {
			for(var index in dataArray) {
				
				}
							// 게시판 배열에 해당 게시판 이름을 push
							dataArray.push(text);

							// 삭제될 게시판에서 해당 게시판 이름을 pop
							deleteArray.pop(text);
							addNum ++;
			
			

			
			
			var currentBoardHtml = "<div class='addForm_"+ addNum + "'><div class='board-title_" + addNum + "'>" + text + "</div>";
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
									$(".addBoardText").val("");
									
									}
					});

				// 게시물 '-' 눌렀을때
				$(document).on("click", ".delete-icon", function(event) {
							$(this).parent().remove();
							
							// 삭제버튼을 누른 게시판의 이름
							var text = $(this).siblings().text();
							
							boardRemove(text);
					});

				// 게시물 '+' 눌렀을때
				$(document).on("click", '.add-icon', function(event) {
							$(this).parent().remove();

							// 추가버튼을 누른 게시판의 이름
							var text = $(this).siblings().text();
							boardAdd(text);
					});
				

			// 수정하기 버튼을 눌렀을 경우
			$(".updateBtn").on("click", function() {
						console.log(dataArray);
						location.href="/admin/makeBoardWrite?dataArray=" + dataArray + "&deleteArray=" + deleteArray;

					
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
					<input type="button" class="updateBtn" value="수정하기">
					<input type="hidden" class="title-append" value="${sessionScope.boardTitle}">
			</div>
			
			<div class="delete-board-status">
				
			</div>
		
		</div>
	
	</div>
	
</body>
</html>