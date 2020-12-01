<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user 프로필</title>
</head>
<body>
	<div class="mypage-profile">
		프로필 수정
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
					
					<div class="mypage-category-passwordCheck-form">
						<span class="mypage-category-passwordCheck">비밀번호 확인</span>
					</div>
					
					<div class="mypage-category-email-form">
						<span class="mypage-category-email">이메일</span>
					</div>
					
					<div class="mypage-category-phoneNumber-form">
						<span class="mypage-category-phoneNumber">핸드폰 번호</span>
					</div>
					
				</div>
				
				<form action="#" method="POST" class="mypage-actionForm">
						<div class="mypage-update-form-profile">
							<div class="profile-image-form">
								<img src="/img/${userDto.image}" class="profile-image-file">
								<input type="file" name="file01" class="profile-file01">
							</div>
							<div class="profile-updateBtn-form">
								<input type="button" value="사진변경" class="profile-updateBtn blue-btn">
								<input type="button" value="삭제" class="profile-deleteBtn blue-btn">
							</div>
						</div>
						
						<div class="mypage-update-form-password">
							<input type="text" class="mypage-password-text" placeholder="비밀번호">
						</div>
						
						<div class="mypage-update-form-passwordCheck">
							<input type="text" class="mypage-password-textCheck" placeholder="비밀번호 확인">
						</div>
						
						<div class="mypage-update-form-email">
							<input type="text" class="mypage-email" placeholder="이메일">
						</div>
						
						<div class="mypage-update-form-phoneNumber">
							<input type="text" class="mypage-phoneNumber" placeholder="핸드폰 번호">
						</div>
						
				</form>
			
			
			</div>
	</div>
</body>
</html>