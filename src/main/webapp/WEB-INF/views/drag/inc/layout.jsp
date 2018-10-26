<!-- drag>>
@JSP : layout.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진
@Desc : drag layout jsp
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- title 영역 -->
		<title><tiles:insertAttribute name="title" /></title>
		<!-- css  영역 -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat|Nanum+Gothic">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/drag.css" />
		
		<!-- Scripts -->
		<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/datepicker.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/drag.js"></script>

				<!-- Sweet Alert cdn -->
		<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/alert/sweetalert.css" />
		<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
	</head>
	<body>
		<!-- Header  영역 (공통 inc) -->
		<header id="header"><tiles:insertAttribute name="header" /></header>
 		<div id="main">
			<div class="page-body-wrapper">
				<!-- aside 영역 -->
				<tiles:insertAttribute name="aside" />
				<!-- Content 영역 -->
				<tiles:insertAttribute name="content" />
			</div>
		</div> 
		
		<!-- Footer 영역 -->     
        <footer id="footer" class="clear">
            <tiles:insertAttribute name="footer" />
        </footer>
	</body>
</html>
