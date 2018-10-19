<%-- admin>>
@JSP : manageMember.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 통계 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
<section>
	<div class="container">
		<div>
			<h3>통계 관리</h3>
		</div>
		<div id="chartDiv"></div>
		<br/>
		<div id="adminBtnDiv">
			<button id="memberStatistic" class="btn btn-sm drop-btn">회원통계</button>
			<button id="noteStatistic" class="btn btn-sm drop-btn">노트통계</button>
			</div>
	</div>
	<br>
</section>
