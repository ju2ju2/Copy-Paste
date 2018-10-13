<%-- admin>>
@JSP : manageMember.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 통계 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

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
			<h3>통계 관리</h3>
			<button id="memberStatistic" class="btn btn-sm drop-btn" >회원통계</button>
			<button id="noteStatistic" class="btn btn-sm drop-btn">노트통계</button>
		</div>
</div>
</section>
