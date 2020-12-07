<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="memberManage title">
		멤버 관리
	</div>
	
	<div class="memberManage-container">
		
		<div class="memberManage-container-form">
				<div class="member-count">
			참여 중인 멤버(10)
				</div>
				
				<div class="memberManageSearchForm">
					<input type="button" class="memberManageBtn" value="멤버 관리">
					<select class="member-selectBox">
						<option value="member-name">멤버 이름</option>
						<option value="member-phoneNumber">핸드폰 번호</option>
						<option value="member-email">이메일</option>
					</select>
					<input type="text" class="memeber-search-text" placeholder="검색어를 입력하세요">
				</div>
				
				<div class="member-content-form">
					<div class="checkBoxAllForm">
						<input type="checkbox" class="checkBoxAll">
					</div>
					<div>멤버</div>
					<div>핸드폰 번호</div>
					<div>성별</div>
					<div>권한</div>
				
					<c:forEach var="user" items="${list}">
					<div class="checkBoxForm">
						<input type="checkbox" class="member-checkbox">
					</div>
					
					<div class="member-info">
						<div class="member-image-form"><img src="/img/${user.image}" class="user-image-form"></div>
						<div class="member-idEmail-form">
							<div class="member-id-form">${user.id}</div>
							<div class="member-email-form">${user.email}</div>
						</div>
					</div>
					
					<div class="member-phoneNumber-form">
						<div class="member-phoneNumber">${user.phoneNumber}</div>
					</div>
					
					<div class="member-gender-form">
						<div class="member-gender">${user.gender}</div>
					</div>
					
					<div class="member-authority-form">
						<div class="member-authority">
						<c:if test="${user.authority == 'ROLE_USER'}">
							정회원
						</c:if>
						
						
						
						</div>
					</div>
					
					
					</c:forEach>
				
				
				</div>
			
			
			
		</div>
	
	
	
	</div>

</body>
</html>