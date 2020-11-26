<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				url:"/test",
				dataType:"text",
				success: function(data) {
					console.log(data);
					},
				error:function(xhr) {
					console.log(xhr.status + xhr.statusText);
					}
				
				});

				
		
		});
	


</script>

</head>
<body>

</body>
</html>