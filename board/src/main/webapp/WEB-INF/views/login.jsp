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
<link rel="stylesheet" href="/resources/css/newsWeather.css"/> 

<style type="text/css">

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
								console.log(index);
								if(index < 5) {
									var link = element[index].originallink;
									var title = element[index].title;
									var content = element[index].description;
									console.log(content);
									console.log(title);
									var newsHTML = "<div id='flex-news'><a href='" + link + "' id='newsInfo'>" + title + "</a>" +
									"<div id='newsContent'>" + content+ "</div></div>";
									$("#flex-news-container").append(newsHTML);
									}
								
								
								
								}
							}
					});
				
				},
			error : function(xhr) {
				console.log(xhr.status + "||" + xhr.statusText);
				}

			})
		$("#dot1").on("click", function() {
			$("#flex-news-container").empty();
			$.ajax({
				url:"/login/news",
				type:"POST",
				success: function(data) {
					var news = JSON.parse(data);
					$.each(news, function(key, element) {
							if(element instanceof(Object)) {
								for(var index in element) {
									if(index < 5) {
										var link = element[index].originallink;
										var title = element[index].title;
										var content = element[index].description;
										var newsHTML = "<div id='flex-news'><a href='" + link + "' id='newsInfo'>" + title + "</a>" +
										"<div id='newsContent'>" + content+ "</div></div>";
										$("#flex-news-container").append(newsHTML);
										}
									}
								}
						});
					
					},
				error : function(xhr) {
					console.log(xhr.status + "||" + xhr.statusText);
					}

				})
			
			});


		$("#dot2").on("click", function() {
			$("#flex-news-container").empty();
			$.ajax({
				url:"/login/news",
				type:"POST",
				success: function(data) {
					var news = JSON.parse(data);
					$.each(news, function(key, element) {
							if(element instanceof(Object)) {
								for(var index in element) {
									if(index > 4 && index < 10) {
										var link = element[index].originallink;
										var title = element[index].title;
										var content = element[index].description;
										var newsHTML = "<div id='flex-news'><a href='" + link + "' id='newsInfo'>" + title + "</a>" +
										"<div id='newsContent'>" + content+ "</div></div>";
										$("#flex-news-container").append(newsHTML);
										}
									}
								}
						});
					
					},
				error : function(xhr) {
					console.log(xhr.status + "||" + xhr.statusText);
					}

				})
			
			});

		$("#dot3").on("click", function() {
			$("#flex-news-container").empty();
			$.ajax({
				url:"/login/news",
				type:"POST",
				success: function(data) {
					var news = JSON.parse(data);
					$.each(news, function(key, element) {
							if(element instanceof(Object)) {
								for(var index in element) {
									if(index > 9 && index < 15) {
										var link = element[index].originallink;
										var title = element[index].title;
										var content = element[index].description;
										var newsHTML = "<div id='flex-news'><a href='" + link + "' id='newsInfo'>" + title + "</a>" +
										"<div id='newsContent'>" + content+ "</div></div>";
										$("#flex-news-container").append(newsHTML);
										}
									}
								}
						});
					
					},
				error : function(xhr) {
					console.log(xhr.status + "||" + xhr.statusText);
					}

				})
			
			});


		/* 아이디 저장하기 (Cookie) */
	// 맨처음에 쿠키를 가져와서 id text박스에 cookie값을 넣는다
	// 없는 경우에는 빈문자가 들어감
	var userInputId = getCookie("userInputId");
	$("#user_id").val(userInputId);


	
	// 쿠키가 적용이되서 아이디값이 적혀있으면 체크박스를 체크한상태로 적용
	if($("#user_id").val() != "") {
			$("#idSaveCheck").attr("checked", true);
		}

	// 체크박스 상태가 바뀌면 Cookie 저장
	$("#idSaveCheck").change(function() {
		 if($("#idSaveCheck").is(":checked")) {
			var userInputId = $("#user_id").val();
			setCookie("userInputId", userInputId, 7);
			setCookie("test", "value", 7);
			 } else {
			deleteCookie("userInputId");
				 }
		});

	// ID 저장하기를 체크한 상태에서 ID를 입력하는경우에도 Cookie 저장
	$("#user_id").keyup(function() {
		if($("#idSaveCheck").is(":checked")) {
			var userInputId = $("#user_id").val();
			setCookie("userInputId", userInputId, 7);
			}
		});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
		}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() -1);
		document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
		}
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        // userInputId=admin;expires=zzz
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	        // 12, 17 12 16  25 29
	    }
	    return unescape(cookieValue);

	};
	
	};
</script>
</head>
<body>
	<sec:authorize access="isAnonymous()">
		<form action="/login" method="POST">
			아이디 : <input type="text" name="user_id" id="user_id"> 비밀번호 :
			<input type="password" name="user_pwd" id="user_pwd"> 
			<input type="checkbox" id="idSaveCheck">아이디 기억하기
			<input
				type="submit" name="submit" value="로그인" id="loginBtn"> <input
				name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			<a href="/user/userSignUp">회원가입</a>
			<a href="/user/userFindId">아이디 찾기</a>
			<a href="/user/userFindPassword">비밀번호 찾기</a>
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
	
	<div id="flex-news-container">
	
	</div>
	<div style="text-align:center">
  <span class="dot1" id="dot1"></span> 
  <span class="dot2" id="dot2"></span> 
  <span class="dot3" id="dot3"></span> 
</div>
</div>

</body>
</html>