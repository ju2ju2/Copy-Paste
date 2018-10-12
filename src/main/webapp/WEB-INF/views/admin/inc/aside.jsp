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
					href="${pageContext.request.contextPath}/etc/admin.htm">회원관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/etc/adminNote.htm">노트관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/etc/adminReport.htm">신고관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/etc/adminStatistic.htm">통계</a></li>
				<li><a
					href="${pageContext.request.contextPath}/etc/selectQnaboard.htm">Q&A</a></li>
			</ul>

</div>


