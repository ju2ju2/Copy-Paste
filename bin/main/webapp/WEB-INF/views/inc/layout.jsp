<%-- inc>>
@JSP : header.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 전체 페이지 레이아웃 파일
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/api/weather/weather-icons.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/api/weather/weather-icons-wind.css" />
		<!-- title 영역 -->
		<title><tiles:insertAttribute name="title" /></title>
	</head>
	<body>
		<!-- <div class="container"> -->
		<!-- Header  영역 -->
		<tiles:insertAttribute name="header" />
		<!-- Main 영역 -->
		<div id="main">
		<!-- Content 영역 -->
		<tiles:insertAttribute name="content" />
		</div>
		<!-- </div> -->
		<!-- Footer 영역  -->
		<tiles:insertAttribute name="footer" />
		<!-- scripts -->
		<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
