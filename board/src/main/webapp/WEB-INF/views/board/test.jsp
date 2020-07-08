<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body {
	width:100%;
	height:100%;
}
#flex-container {
	width:100%;
	height:100%;
	display:flex;
	flex-direction:row;
}

#flex-item, #flex-item2, #flex-item3 {
	flex: 1;
    border-right: 2px solid black;
    padding: 10px;
}

#bookMark, #bookMark2, #bookMark3 {
	cursor:pointer;
	
}
#bookMark:hover, #bookMark2:hover, #bookMark3:hover {
	opacity:0.5;
}

#bookParent > :hover {
	cursor:pointer;
}

#flex-item {
	display:flex;
	flex-direction:column;
}

.clicked {
	display:none;

}

.clicked2 {
	display:none;
}

</style>
<script type="text/javascript">
	window.onload = function() {
			let bookParent = document.querySelector("#bookParent");
			let clicked_class = "clicked";
			let clicked_class2 = "clicked2";
			let book1 = document.querySelector("#book1");
			bookMark.addEventListener("click", showContent);
			book1.addEventListener("click", showContent2);
			function showContent() {
				bookParent.classList.toggle(clicked_class);
				}
			function showContent2() {
				for(var i = 0; i < book1.children.length; i++) {
						book1.children[i].classList.toggle(clicked_class2);
					}

				
				}
		}

</script>	

</head>
<body>
		
		<div id="flex-container">
			<div id="flex-item">
				<span id="bookMark">북마크 목록</span>
				<div id="bookParent" class="clicked">
				<div id="book1">ㄴ북1
				<div class="clicked2">&nbsp;&nbsp;ㄴㄴ북1내용1</div>
				<div class="clicked2">&nbsp;&nbsp;ㄴㄴ북1내용2</div>
				</div>
				<div>ㄴ북2</div>
				<div>ㄴ북3</div>
				<div>ㄴ북4</div>
				</div>
				
			</div>
			<div id="flex-item2">
			<span id="bookMark2">북마크 목록2</span>
			</div>
			<div id="flex-item3">
			<span id="bookMark3">북마크 목록3</span>
			</div>
		
		
		</div>
		
		
		
		

</body>
</html>