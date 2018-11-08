<!-- write>>inc
@JSP : layout.jsp
@Date : 2018.10.09
@Author : 고은아, 임효진
@Desc : write layout 부분 jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle var="apikeys" basename="META-INF.api.apikeys" />
<!DOCTYPE>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- css  영역 -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/note.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/search.css" />
<!-- Scripts -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/write.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/inc.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/dragaside.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/writeaside.js"></script>
<!-- sweetalert -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/api/alert/sweetalert.css" />
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/api/sweetalert.min.js"></script>
<!-- tinymce-->
<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=<fmt:message bundle="${apikeys}" key="tinymce.apiKey"/> "/></script>
<script src="${pageContext.request.contextPath}/resources/js/api/textEditer.js"></script>
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

