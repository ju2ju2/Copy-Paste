<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://fonts.googleapis.com/css?family=Montserrat|Nanum+Gothic" rel="stylesheet">
		<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		<!-- title 영역 -->
		<title><tiles:insertAttribute name="title" /></title>
	</head>
	<body>
		<!-- Header  영역 -->
		<tiles:insertAttribute name="header" />
		<!-- Main 영역 -->
		<div id="main">
		<!-- Content 영역 -->
		<tiles:insertAttribute name="content" />
		</div>
		<!-- Footer 영역  -->
		<tiles:insertAttribute name="footer" />
		
		<!-- Scripts -->
		<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
