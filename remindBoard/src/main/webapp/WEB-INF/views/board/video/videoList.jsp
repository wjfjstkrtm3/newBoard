<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비디오 게시판</title>
<script type="text/javascript">


$(document).ready(function() {
	

		$(".video-searchBtn").on("click", function() {
				var searchText = $(".video-search-text").val();
				if(searchText.trim() == "" || searchText == null) {
							alert("검색어를 입력해주세요 !!");
							return;
					}
				searchVideo(searchText);
				
			});


		function searchVideo(searchText) {

			$.ajax({
				url:"https://www.googleapis.com/youtube/v3/search?key=AIzaSyCkJiZsGkuJkQ4yT8m_abjslAjEPeCHisE&part=snippet&q=" + searchText + "&order=date",
				type:"GET",
				dataType:"JSON",
				success:function(data) {
					$.each(data.items, function(index, element) {
							var videoId = element.id.videoId;
							console.log(element.id.videoId);
							var youtubeURL = '<iframe width="950" height="350" src="https://www.youtube.com/embed/' + videoId + '"frameborder="0" allowfullscreen></iframe>';
							var html = "<div class='youtube-data_" + index + "'>" + youtubeURL + "</div>";
							$(".video-container-form").append(html);

						});

					/*
					for(var i = 0; i < data.items.length; i++) {
						console.log(data.items[i].id.videoId);
						}
					*/
				},
				error:function(xhr) {
					console.log(xhr.status + xhr.statusText());	
				}


			});


			}

	
});
</script> 
</head>
<body>

	<div class="video-container">
		<div class="video-category">
				<span>동영상 게시판</span>
				
				<div class="video-write-form">
					<input type="text" class="video-search-text" placeholder="검색어">
					
					<div class="video-orderBy-form">
						<select class="video-select-form">
							<option value="order-relevance">=== 관련순 === </option>
							<option value="order-date">=== 날짜순 ===</option>
							<option value="order-rating">=== 평가순 ===</option>
						</select>
					</div>
					
					<input type="button" value="검색" class="video-searchBtn">
					
				</div>
		
				
		</div>
		
		
			
		
		
		
	
		<div class="video-container-form">
			
		
		
		</div>
		
	
	</div>








</body>
</html>