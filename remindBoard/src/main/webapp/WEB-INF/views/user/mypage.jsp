<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user 프로필</title>
<script type="text/javascript">
	$(document).ready(function() {
				
				$(".profile-file01").on("change", function(event) {
						var fileReader = new FileReader();
						fileReader.readAsDataURL(event.target.files[0]);

						console.log(event.target.files[0]);
						fileReader.onload = function(event) {

								$(".image-form").empty();
								$(".image-form").append("<img src='" + event.target.result + "'"  + "class='profile-image-file'>");
							}
					
					});

				$(".profile-deleteBtn").on("click", function() {
						$(".image-form").empty();
						$(".image-form").append("<img src='/img/default.png' class='profile-image-file'>");
					});


				$(".profile-submitBtn").on("click", function(event) {
						
						event.preventDefault();
						
						var email = $(".mypage-email").val();
						var phoneNumber = $(".mypage-phoneNumber").val();
						var password = $(".mypage-password-text").val();
						var passwordCheck = $(".mypage-password-textCheck").val();
						var id = $(".userId").val();
						
						if(password.trim() == "") {
							alert("비밀번호를 입력해주세요!");
							} else if(email.trim() == "" || phoneNumber.trim() == "" ) {
								alert("이메일 또는 핸드폰 번호를 입력해주세요!")
								} 
						
						if(password.trim() != "" && email.trim() != "" && phoneNumber.trim() != "") {
						
								$.ajax({
									  url:"/user/passwordCheck",
									  type:"POST",
									  data:{"password":password, "id":id},
									  success:function(data) {
										  console.log(data);
											if(data === true) {
													$(".mypage-actionForm").submit();
												} else if(data === false) {
													alert("입력한 비밀번호가 일치하지 않습니다.");
													} 
										  },
									  error:function(xhr) {
										  console.log(xhr.status + xhr.statusText);
										  }
							
							 	 });
							
							} else {
								
								}
					
						
						
					
					});
		
		});


</script>
</head>
<body>
	<div class="mypage-profile">
		마이페이지
	</div>
	<div class="mypage-container-form">
			<div class="mypage-container">
				<div class="mypage-category">
					<div class="mypage-category-profile-form">
						<span class="mypage-category-profile">프로필 사진</span>
					</div>
					
					<div class="mypage-category-password-form">
						<span class="mypage-category-password">비밀번호</span>
					</div>
					
					<div class="mypage-category-email-form">
						<span class="mypage-category-email">이메일</span>
					</div>
					
					<div class="mypage-category-phoneNumber-form">
						<span class="mypage-category-phoneNumber">핸드폰 번호</span>
					</div>
					
				</div>
				
				<form action="/user/mypage" method="POST" class="mypage-actionForm" enctype="multipart/form-data">
						<div class="mypage-update-form-profile">
							<div class="profile-image-form">
								<div class="image-form">
									<img src="/img/${userDto.image}" class="profile-image-file">
								</div>
									<input type="file" name="file01" class="profile-file01">
							</div>
							<div class="profile-updateBtn-form">
								<input type="button" value="삭제" class="profile-deleteBtn blue-btn">
							</div>
						</div>
						
						<div class="mypage-update-form-password">
							<input type="password" class="mypage-password-text" name="password" placeholder="비밀번호">
						</div>
						
						<div class="mypage-update-form-email">
							<input type="text" class="mypage-email" value="${userDto.email}" name="email" placeholder="이메일">
						</div>
						
						<div class="mypage-update-form-phoneNumber">
							<input type="text" class="mypage-phoneNumber" value="${userDto.phoneNumber}" name="phoneNumber" placeholder="핸드폰 번호">
						</div>
						
						<input type="submit" value="수정" class="profile-submitBtn">
						
						<input type="hidden" value="${userDto.id}" name="id" class="userId">
						<input type="hidden" value="${userDto.gender}" name="gender">
						
				</form>
			
			
			</div>
	</div>
</body>
</html>