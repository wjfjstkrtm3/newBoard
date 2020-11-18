<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script type="text/javascript" src="/webjars/jquery/3.5.1/jquery.min.js" ></script>
<link rel="stylesheet" href="${path}/resources/css/layout/layout.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<tiles:insertAttribute name="css"/>

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
