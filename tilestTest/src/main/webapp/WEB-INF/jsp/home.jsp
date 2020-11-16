<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="ko">

<body>
	<header id="siteTop">
		<tiles:insertAttribute name="siteTop"/>
	</header>

	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
 
	<footer id="siteBottom">
		<tiles:insertAttribute name="siteBottom"/>
	</footer>
</body>
</html>