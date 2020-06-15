<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/weather-icons.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/weather-icons-wind.css" />" rel="stylesheet">


<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}
#flex_container {
	display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    justify-content: center;
    align-items: center;
}


#flex_container_child {
	font-weight : bold;
    border-radius: 10px;
    border: 2px solid black;
}


#flex_top {
	display: flex;
    flex-direction: row;
    
}

#weather_info {
	margin-left: auto;
}

#flex_bottom {
	display: flex;
    /* flex-direction: column; */
    justify-content: space-around;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var cityId = "1835847";
		var weather_api = "http://api.openweathermap.org/data/2.5/weather?id=1835847&appid=c467a51ad8b7075e645266c97d051df0&units=metric";

		$.ajax({
			url : weather_api,
			dataType : "JSON",
			type : "GET",
			success : function(data) {
				console.log(data);
				console.log("현재온도 : " + (data.main.temp));
				console.log("현재습도 : " + data.main.humidity);
				console.log("날씨 : " + data.weather[0].main);
				console.log("상세날씨설명 : " + data.weather[0].description);
				console.log("날씨 이미지 : " + data.weather[0].icon);
				console.log("바람   : " + data.wind.speed);
				console.log("나라   : " + data.sys.country);
				console.log("도시이름  : " + data.name);
				console.log("구름  : " + (data.clouds.all) + "%");
				var temp = data.main.temp;
				var humidity = data.main.humidity;
				var weather = data.weather[0].main;
				var weather_description = data.weather[0].description;
				var wind = data.wind.speed;
				var country = data.sys.country;
				var city = data.name;
				var cloud = (data.clouds.all) + "%";

				var imgURL = "http://openweathermap.org/img/w/"
						+ data.weather[0].icon + ".png";
				$("#weather_iconImg").attr("src", imgURL);
				$("#weather_temp").append(temp);
				$("#weather_weather").append(weather);
				$("#weather_countryCity").append(country +"/" + city);
				$("#weather_wind").append(wind);
				$("#weather_cloud").append(cloud);
			},
			error : function(xhr) {
				console.log("xhr.status : " + xhr.status + "|| xhr.statusText"
						+ xhr.statusText);
			}

		});

		$.ajax({
			url:"/login/news",
			type:"POST",
			success: function(data) {
				var news = JSON.parse(data);
				console.log(data);
				$.each(news, function(key, element) {
						console.log("key : "+ key + "|| element : " + element);	
						if(element instanceof(Object)) {
							for(var index in element) {
								console.log(element[index]);
								var link = element[index].originallink;
								$("#news").append(link);
								}
							}
					});
				
				},
			error : function(xhr) {
				console.log(xhr.status + "||" + xhr.statusText);
				}

			})

		
	};
</script>
</head>
<body>
	<sec:authorize access="isAnonymous()">
		<form action="/login" method="POST">
			아이디 : <input type="text" name="user_id" id="user_id"> 비밀번호 :
			<input type="password" name="user_pwd" id="user_pwd"> <input
				type="submit" name="submit" value="로그인"> <input
				name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			<a href="/user/userSignUp">회원가입</a>
		</form>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<form action="/logout" method="POST" id="logout_form">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <a href="#"
				onclick="document.getElementById('logout_form').submit();">로그아웃</a>
		</form>
	</sec:authorize>


	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
		<font color="red">
			<p>아이디와 비밀번호를 다시 확인해주세요</p>
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} <c:remove
				var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
		</font>
	</c:if>
<div id="flex_container">
	<div id="flex_container_child">
		<div id="flex_top">

			<div id="weather_icon">
				<img src="" id="weather_iconImg">
			</div>
			
			<div id="weather_info">
				<div id="weather_temp"></div>
				<div id="weather_weather"></div>
				<div id="weather_countryCity"></div>
			</div>
			
			
		</div>

	<div id="flex_bottom">
		<div id="weather_wind">
		<i class="wi wi-strong-wind"></i>
		</div>	
		<div id="weather_cloud">
		<i class="wi wi-night-alt-cloudy"></i>
		</div>
	
	</div>


	</div>
	
	<div id="news"></div>
	
</div>

</body>
</html>