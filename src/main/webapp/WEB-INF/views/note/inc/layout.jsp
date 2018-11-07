<!-- note>>inc
@JSP : layout.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진
@Desc : note layout 부분 jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- css  영역 -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/note.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/api/jquery/jquery-ui.theme.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/api/jquery/jquery-ui.structure.css" />
<!-- Scripts -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/api/datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/note.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/folder.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/inc.js"></script>
<!-- Sweet Alert cdn -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/api/alert/sweetalert.css" />
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/api/sweetalert.min.js"></script>
<!-- title 영역 -->
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<!-- Header  영역 (공통 inc) -->
	<header id="header">
		<tiles:insertAttribute name="header" />
	</header>
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
