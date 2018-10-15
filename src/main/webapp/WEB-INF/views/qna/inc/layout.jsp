<%-- qna>>inc
@JSP : layout.jsp
@Date : 2018.10.10
@Author : 이주원
@Desc : qna layout 
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>        
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<!-- title 영역 -->
		<title><tiles:insertAttribute name="title" ></tiles:insertAttribute></title>
		<!-- css 영역 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
	</head>
	<body>
		<!-- Header  영역 (공통 inc) -->
		<tiles:insertAttribute name="header" />
		<div id="main">
			<div class="top-wrapper clear">
				<!-- Content 영역 -->
				<tiles:insertAttribute name="content" />
			</div>
		</div>
		
		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer" />
		<!-- Scripts -->
		
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
				
		
	</body>
</html>
