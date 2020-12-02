<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/login/login.css">
<script type="text/javascript" src="/webjars/jquery/3.5.1/jquery.min.js" ></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
			$(".userPwdCheckBtn").on("click", function(event) {

					var id = $(".checkId").val();
					var email = $(".checkEmail").val();

					if(id.trim() === "" || email.trim() === "") {
							alert("아이디 또는 이메일을 입력해주세요!");
							return;
						} else {
							var data = {"id":id, "email":email};
							
							
							$.ajax({
										url:"/user/checkIdEmail",
										type:"POST",
										data:JSON.stringify(data),
										contentType:"application/json; charset=utf-8",
										success:function(data) {

											if(data === 1) {
												$(".alert-text").empty();
												$(".alert-text").append("<h3>비밀번호를 바꿔주세요!!</h3>");
												$("#password-send-modal").modal();
													
												

												
											}else {
												alert("아이디 또는 이메일이 틀립니다!")
											}
											
											},
										error:function(xhr) {
											console.log(xhr.status + "/" + xhr.statusText);
											}
								});
							}		
				});

				$(".temPwdBtn").on("click", function() {
						$(".checkIdEmail-form").append("<input type='password' class='updatePwd' placeholder='비밀번호를 입력해주세요'>");
						$(".checkIdEmail-form").append("<input type='button' class='confirmBtn' value='확인'>");
					
					});		

				$(document).on("click", ".confirmBtn", function() {
							var id = $(".checkId").val();
							var updatePwd = $(".updatePwd").val();
							var data = {"id":id, "password":updatePwd};
							
							if(updatePwd.trim() == "") {
								alert("바꿀 비밀번호를 다시 입력해주세요!");
								} else {
										$.ajax({
													url:"/user/updatePassword",
													type:"POST",
													contentType:"application/json; chartset=utf-8",
													data:JSON.stringify(data),
													success:function(data) {
															if(data ===1) {
																	alert("비밀번호가 변경되었습니다. 다시 로그인해주세요!");
																	
																	// Modal 닫기
																	$("#passwordModal").modal("hide");												
																}
														},
													error:function(xhr) {
														console.log(xhr.status + "/" + xhr.statusText);
														}

											
											});
											
										
									
									}
					});
	
		});

</script>
</head>
<body>
<div class="login-container">
			<!-- 기본 action= /login, method="POST" -->
	<form action="/login" method="POST" class="login-form">
		<div class="login-image-form">
			<div class="login-image">
				<img src="${path}/resources/imgs/login.png" class="character-image">
		
			</div>
		</div>
	
		<div class="login-userIdPwd-form">	
			<!-- 기본 name = username -->
			<input type="text" name="userId" class="login-userId" placeholder="아이디">
			<!-- 기본 name = password -->
			<input type="password" name="userPwd" class="login-userPwd" placeholder="비밀번호">
			<div class="etc-form">
				<div class="checkbox-form">
					
					<input type="checkbox" id="remember_me_label" class="remember_me" name="remember-me">
					<label for="remember_me_label">아이디 기억하기</label>
					
				</div>
				<a href="/user/signUp" class="user-signUp">회원가입</a>
			</div>
		</div>
		
		<div class="login-btn-form">
			<input type="submit" value="로그인" class="login-btn">
			<input type="button" value="비밀번호 찾기" class="findPassword-btn" data-toggle="modal" data-target="#passwordModal">
			
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			<div class="login-errorMessage">
			        ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		    </div>
		        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
		</c:if>
		</div>
		
		<input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">


	</form>
	
	
</div>	

	<!-- 
	class="fade" Modal 창이 위쪽에서 아래로 부드럽게 열림
	data-backdrop="static" 바깥쪽 클릭해도 안닫히게
	modal-dialog 뒤에 modal-dialog-centered modal-dialog-centered 추가 가능 
	(수직 중앙 모달), (스크롤 가능모달) 두개 같이쓰면 수직 중앙에 스크롤가능
	-->
	<div class="modal fade" id="passwordModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header modal-header-size">
					<h5 class="modal-title">비밀번호 찾기</h5>
					<button type="button" class="close" id="test" data-dismiss="modal" aria-label="Close">X</button>
				</div>
				
				<!-- body -->
				<div class="modal-body modal-body-size">
					<div class="checkIdEmail-form">
					<input type="text" class="checkId" name="id" placeholder="아이디">
					<input type="text" class="checkEmail" name="email" placeholder="이메일">
					<input type="button" value="찾기" class="userPwdCheckBtn">
					</div>
				</div>
				
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="close" data-dismiss="modal">닫기</button>
				
				</div>
			
			</div>
		</div>
	</div>

	<div class="modal fade" id="password-send-modal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content ">
				<div class="modal-header modal-header-size">
					<button type="button" class="close temPwdBtn" data-dismiss="modal">X</button>
				
				</div>
				<div class="modal-body alert-text">
					
				</div>
			</div>
		</div>
	</div>


	
	
	
	
	
</body>
</html>