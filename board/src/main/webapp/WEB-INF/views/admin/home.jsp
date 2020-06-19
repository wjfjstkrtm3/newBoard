<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style type="text/css">
#memberInfo {
	border: 1px solid black;
}

input[type=checkbox] {
	display:none;
}


input[type=checkbox] + label {
	color : red;
}

input[type=checkbox]:checked+label {
	color : green;
}

table {
	border-collapse : collapse;

}

td{
	border: 2px solid black;	
}

</style>

<script type="text/javascript">

	window.onload = function() {
		$.ajax({
			url:"/admin/chart",
			type:"POST",
			success:function(data) {
				var enabled = data.enabled;
				var disEnabled = data.disEnabled;
				console.log(enabled);
				
				var ctx = document.getElementById("myChart");
				var chart = new Chart(ctx, {
					type: "pie",
					data: {
						datasets: [{
							data: [enabled,disEnabled],
							backgroundColor: ["red", "green"],
							borderAlign : "center",
							borderWidth: 2,
							weight: 10
							}],
						labels: ["비활성화", "활성화"],
						
						},
					options: {
						responsive: false
						}
					
					});

				},
			error:function(xhr) {
				console.log(xhr.status + "||" + xhr.statusText);
				}


			
			});
		}
	



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
					
					// 여기까지가 활성화 / 비활성화 비동기

					
						


				
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
			<td>ENABLED</td>
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
		
		<canvas id="myChart" width="200" height="200"></canvas>
		
</body>
</html>