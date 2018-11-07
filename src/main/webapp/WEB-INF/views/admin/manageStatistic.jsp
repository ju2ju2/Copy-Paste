<%-- admin>>
@JSP : manageMember.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 통계 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/admin/chart.js"></script>
<section>
	<div class="container">
		<div>
			<h3  class="major">통계 관리</h3>
		</div>
		<div id="chartDiv"></div>
		<br/>
		<div id="adminBtnDiv">
			<button id="joinStatistic" class="btn btn-sm drop-btn">가입통계</button>
			<button id="memberStatistic" class="btn btn-sm drop-btn">회원통계</button>
			<button id="noteStatistic" class="btn btn-sm drop-btn">노트통계</button>
		</div>
	</div>
	<br>
</section>
