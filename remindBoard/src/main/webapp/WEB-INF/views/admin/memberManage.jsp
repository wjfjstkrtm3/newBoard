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


		var checkUserCount = 0;
		var checkboxParent = $(".checkBoxAll");
			checkboxParent.on("change", function(event) {
						$("input[class='member-checkbox']:checkbox").each(function(event) {
							if(checkboxParent.is(":checked") == true) {
									$(this).prop("checked", true);
								}else {
									$(this).prop("checked", false);
									}
						});
				/* if(checkboxParent.is(":checked") == true) {
							$("input:checkbox[class='member-checkbox']").prop("checked", true);			
					}else {
							$("input:checkbox[class='member-checkbox']").prop("checked", false);			
						} */
				});

			function getCheckedList() {


				// user id 배열
				var checkUsergetIdArr = new Array();

				// user authority 권한 초기화
				var checkUserGetAuthorityArr = new Array("정회원");

				// user 권한 개수를 세기위한 배열
				var authorityCountArr = new Array();

				// 정회원 user 수
				var memberCount = 0;

				// 준회원 user 수
				var noMemberCount = 0;
				$("input[class='member-checkbox']:checkbox").each(function(index, element) {
					
					
					// index 붙여주기
					var idEmailForm = ".member-id-form_" + index;
					var authorityFrom = ".member-authority_" + index;

					
					if($(this).is(":checked") == true ) {
						
						
						// user id push
						checkUsergetIdArr.push($(element).parent().siblings(".member-info").children(".member-idEmail-form").children(idEmailForm).text());
						$(".userIdArray").val(checkUsergetIdArr);
						
						// user 권한 form
						var authorityText = $(element).parent().siblings(".member-authority-form").children(authorityFrom).text().trim();

						// user 권한 개수를 세기위한 배열에 push
						authorityCountArr.push(authorityText);
						

						
						// 권한을 가지고있는 배열을 돌려서 만약에 같은 권한이면 하나만 넣을수있게
						for(var index in checkUserGetAuthorityArr) {
							
								if(checkUserGetAuthorityArr[index] != authorityText) {
									checkUserGetAuthorityArr.push(authorityText);
									
									}else {
										
										}
							}
						
						}
				});

				// 권한에 따른 user 수
				for(var index in authorityCountArr) {
						if(authorityCountArr[index] == "정회원") {
							memberCount++;
							} else if(authorityCountArr[index] == "준회원") {
								noMemberCount++;
								}
						
					}

				var countSelector = 0;
				// 정회원 // 몇명 표시
				for(var index in checkUserGetAuthorityArr) {
					
					if(checkUserGetAuthorityArr[index] == "정회원") {
							countSelector = memberCount;
						} else if(checkUserGetAuthorityArr[index] == "준회원") {
							countSelector = noMemberCount;
							}
					
					
					var appendHtml = "";
					appendHtml += "<div class='authority-form'>";
				    appendHtml += "<div class='authority-text'>" + checkUserGetAuthorityArr[index] + "</div>";	
					appendHtml += "<div class='authority-number'>" + countSelector + "</div></div>";
					}
				
				$(".authority-container-form").append(appendHtml);



				
			}

			function getCheckboxCount() {
				return $("input[class='member-checkbox']:checkbox:checked").length;
				}
			$(".memberManageBtn").on("click", function() {
					$(".checkboxUserCount").empty();
					$(".authority-container-form").empty();
					$(".checkboxUserCount").append("총 " + getCheckboxCount() + "명을 선택하셨습니다.");
					
					getCheckedList();
					
					$("#memberManageModal").modal();
				
				});


			
			$(".memberManageUpdateBtn").on("click", function() {
				var userIdArr = $(".userIdArray").val();
				var selectVal = $(".authority-select option:selected").val();
					if(selectVal == "" || selectVal == "authority-default") {
						alert("적용할 동작을 선택해주세요!");
						return;
						}
						
					if(userIdArr.length ==0) {
						alert("수정할 멤버를 선택해주시고 눌러주세요");
						return;
						} else {
								$.ajax({
										url:"/admin/selectMemberUpdate",
										type:"POST",
										data:{"userIdArr":userIdArr, "selectVal":selectVal},
										success:function(data) {
											console.log(data);
											
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
	<div class="memberManage title">
		멤버 관리
	</div>
	
	<div class="memberManage-container">
		
		<div class="memberManage-container-form">
				<div class="member-count">
			참여 중인 멤버(${userCount})
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
					<div>활성화 여부</div>
				
					<c:forEach var="user" items="${list}" varStatus="status">
					<div class="checkBoxForm">
						<input type="checkbox" class="member-checkbox">
					</div>
					
					<div class="member-info">
						<div class="member-image-form"><img src="/img/${user.image}" class="user-image-form"></div>
						<div class="member-idEmail-form">
							<div class="member-id-form_${status.index}">${user.id}</div>
							<div class="member-email-form">${user.email}</div>
						</div>
					</div>
					
					<div class="member-phoneNumber-form">
						<div class="member-phoneNumber">${user.phoneNumber}</div>
					</div>
					
					<div class="member-gender-form">
						<div class="member-gender">
						<c:if test="${user.gender == 'woman'}">
								여자
						</c:if>
						<c:if test="${user.gender == 'men'}">
								남자						
						</c:if>
						
						</div>
					</div>
					
					<div class="member-authority-form">
						<div class="member-authority_${status.index}">
						<c:if test="${user.authority == 'ROLE_USER'}">
							정회원
						</c:if>
						</div>
					</div>
					
					<div class="member-enabled-form">
						<c:choose>
							<c:when test="${user.enabled == 0}">
									<div class="">비활성화</div>
							</c:when>
							<c:when test="${user.enabled == 1}">
									<div class="">활성화</div>
							</c:when>
						
						</c:choose>
					</div>
					
					</c:forEach>
				
				
				</div>
			
			
			
		</div>
	
	
	
	</div>


<div class="modal fade" id="memberManageModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-header-container">
					<span class="memberManage-text">멤버 관리</span>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">X</button>
				</div>
			</div>
			<div class="modal-body memberManage-body">
				<div class="modal-body-container">
					<div class="selectMember-text">선택된 멤버</div>
					<div class="selectMember-form">
						<div class="member-count-form"><i class="fas fa-check fa-1x"></i><span class="checkboxUserCount"></span></div>
						 <div class="authority-container-form">
						 <!-- 
							<div class="authority-form">
							
								<div class="authority-text">
									정회원
								</div>
								<div class="authority-number">
									1
								</div>
						
							</div>
						 -->
						</div>
							
					</div>
					
					<div class="updateAuthority-text">동작</div>
					<div class="Authority-selectForm">
						<select class="authority-select">
							<option value="authority-default">적용할 동작을 선택해주세요</option>
							<option value="deleteMember">삭제</option>
							<option value="authorityDisabled">비활성화</option>
						</select>
					</div>				
				</div>
			</div>
			<div class="modal-bottom memberManage-bottom">
				<div class="modal-bottom-container">
					<button type="button" class="memberManageUpdateBtn">수정하기</button>
				
				</div>
			</div>
		
		
		</div>
	
	</div>

	<input type="hidden" class="userIdArray">

</div>



</body>
</html>