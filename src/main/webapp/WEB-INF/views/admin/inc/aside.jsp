<!-- admin>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : admin aside부분 jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<div class="sidebar">

		<!-- Menu -->
				
			<ul id="sidbar"><!-- nav아래로 정렬 찾아보기 -->
				<li><h2 id="menuH2">Menu</h2></li>
				<li class="active"><a
					href="${pageContext.request.contextPath}/etc/admin.htm"><i class="far fa-user"></i>&nbsp;회원관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/etc/adminNote.htm"><i class="far fa-sticky-note"></i>&nbsp;노트관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/etc/adminReport.htm"><i class="fas fa-exclamation-triangle"></i>신고관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/etc/adminStatistic.htm"><i class="fas fa-chart-line"></i>&nbsp;&nbsp;통계</a></li>
				<li><a
					href="${pageContext.request.contextPath}/qna/selectQnaboard.htm"><i class="far fa-question-circle"></i>&nbsp;&nbsp;Q&A</a></li>
			</ul>

</div>


