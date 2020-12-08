<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script type="text/javascript" src="/webjars/jquery/3.5.1/jquery.min.js" ></script>
<link rel="stylesheet" href="<tiles:getAsString name='css'/>">
<link rel="stylesheet" href="${path}/resources/css/layout/layout.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
	<!-- 전체 컨테이너 영역 -->
	<div class="all-container">
		
		<!-- header -->
		<div class="header-container">
			<tiles:insertAttribute name="header"/>
		</div>
		<!-- Main -->	
		<div class="main-content-container">
			<!-- Main sidebar -->
			<div class="main-content-menu">
				<tiles:insertAttribute name="menu"/>
				
			</div>
			<!-- Main Content -->
			<div class="main-content">
				<tiles:insertAttribute name="content"/>
			</div>
		
		
		</div>
	
	
	
	</div>



</body>
</html>
