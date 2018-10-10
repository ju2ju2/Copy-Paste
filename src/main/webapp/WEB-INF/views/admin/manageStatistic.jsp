<%--
@JSP : manageMember.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 회원관리
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<script>
	$(document).ready(function() {
		$('#table_id').DataTable();

		$('#memberStatistic').click(function() {
			$.ajax({
				url : '/etc/noteReport.json',
				success : function(data) {
					//회원통계 차트
				}
			})
		})

		$('#noteStatistic').click(function() {
			$.ajax({
				url : '/etc/commReport.json',
				success : function(data) {
					//노트통계 차트
				}
			})
		})

	});
</script>
<section>
	<div class="container">
		<div>
			<h3>신고 관리</h3>
			<button id="memberStatistic" class="btn btn-success btn-sm">회원통계</button>
			<button id="noteStatistic" class="btn btn-success btn-sm">노트통계</button>
		</div>
</div>
</section>
