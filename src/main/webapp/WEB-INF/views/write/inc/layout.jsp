<!-- write>>inc
@JSP : layout.jsp
@Date : 2018.10.09
@Author : 고은아
@Desc : write layout 부분 jsp
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/note.css" />
<!-- Scripts -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
<body>
	<!-- Header  영역 (공통 inc) -->
	<header id="header">
		<tiles:insertAttribute name="header" />
	</header>

	<div id="main" class="top-wrapper clear">
		<div class="clear col-sm-3 " id="writeNoteNavDiv">
			<!-- aside 영역 -->
			<tiles:insertAttribute name="aside" />
		</div>
		<div class="clear col-sm-9">
			<!-- Content 영역 -->
			<tiles:insertAttribute name="content" />

		</div>
	</div>

	<!-- Footer 영역 -->
	<footer id="footer">
		<tiles:insertAttribute name="footer" />
	</footer>

	<!-- Scripts -->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var leftNoteWriteNavDiv = $('#writeNoteNavDiv');
			var writeNoteNavSizeBtn = $('.writeNoteNavSizeBtn');

			$('.searchBtn').click(
					function() {
						if (leftNoteWriteNavDiv.hasClass('col-sm-3')) {
							leftNoteWriteNavDiv.removeClass('col-sm-3')
									.addClass('col-sm-10');
							writeNoteNavSizeBtn.removeClass(
									'fa-angle-double-right').addClass(
									'fa-angle-double-left');
							$('#portalSearch').css('width', '1120px');
							$('#inSiteSearch').css('width', '1120px');
						} else {
							leftNoteWriteNavDiv.removeClass('col-sm-10')
									.addClass('col-sm-3');
							writeNoteNavSizeBtn.removeClass(
									'fa-angle-double-left').addClass(
									'fa-angle-double-right');
							$('#portalSearch').css('width', '');
							$('#inSiteSearch').css('width', '');
						}
					});

			$('.writeNoteNavBtn').click(
					function() {
						if (leftNoteWriteNavDiv.hasClass('col-sm-10')) {
							leftNoteWriteNavDiv.removeClass('col-sm-10')
									.addClass('col-sm-3');
							writeNoteNavSizeBtn.removeClass(
									'fa-angle-double-left').addClass(
									'fa-angle-double-right');
							$('#portalSearch').css('width', '');
							$('#inSiteSearch').css('width', '');
						}
					});
		})
	</script>
	<!-- Scripts -->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
