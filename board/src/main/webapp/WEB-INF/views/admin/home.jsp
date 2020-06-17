<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style type="text/css">
#memberInfo {
	border: 1px solid black;
}

input[type=checkbox] {
	display:none;
}


input[type=checkbox] + label {
	color : #a6a6a6;
}

input[type=checkbox]:checked+label {
	color : #c62917;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
			
			$("input[type=checkbox]").change(function(event) {
				var id = event.target.value;
				var enabledName = event.target.name;
				var enabled = null;
				
			
				$.ajax({
					url: "/admin/memberDisEnabled",
					type: "POST",
					data: {"id":id, "enabled":enabledName},
					success:function() {
						},
					error:function(xhr) {
						console.log(xhr.status + "||" + xhr.statusText);
						}
					
					});
					
				
				});
		
		});


</script>
</head>
<body>
	
		<fieldset>
			<legend>회원정보</legend>
			<table id="memberInfo">
			<tr>
			<td>ID</td>
			<td>PASSWORD</td>
			<td>NAME</td>
			<td>EMAIL</td>
			<td>PHONENUMBER</td>
			<td>ENABLEDM</td>
			</tr>
			
			<c:forEach var="memberList" items="${memberList}" varStatus="status">
			
			<tr>
			<td>${memberList.id} </td>
			<td>${memberList.password}</td>
			<td>${memberList.name}</td>
			<td>${memberList.email}</td>
			<td>${memberList.phoneNumber}</td>
			<td>
				<input type="checkbox" value="${memberList.id}" id="isAdmin${status.index}" name="${memberList.enabled}" <c:if test="${memberList.enabled == true}">checked = 'checked'</c:if>> 
				<label for="isAdmin${status.index}"><i class="fas fa-dot-circle"></i></label>
			</td>
			</tr>
			</c:forEach>
		</table>
		</fieldset>
</body>
</html>