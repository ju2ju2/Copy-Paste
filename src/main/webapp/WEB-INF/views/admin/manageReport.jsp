<%-- admin>>
@JSP : manageNote.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 관리자 노트관리

@Date : 2018.10.19
@Author : 고은아
@Desc : 관리자 신고 관리

--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<section>
	<div class="container">
		<div>
			<h3>신고 관리</h3>		
		</div>
		<div id="adminBtnDiv">
			<button id="report" class="btn btn-sm drop-btn">전체 신고 내역</button>
			<button id="noteReport" class="btn btn-sm drop-btn">노트 신고 내역</button>
			<button id="commReport" class="btn  btn-sm drop-btn">댓글 신고 내역</button>
			</div>
		<br>
		<table id="table_id">
			<thead>
				<tr>
					<th>신고번호</th>
					<th>신고자 이메일</th>
					<th>대상</th>
					<th>대상번호</th>
					<th>신고사유</th>
					<th>상세내용</th>
					<th>신고일자</th>
					<th>처리여부</th>
					<th>처리</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
	</div>
</section>
<script>
	function selectAll() {
		$.ajax({
			url : '../etc/allReport.json',
			dataType:"json",
			success : function(data) {
				$('tbody').empty();
				$.each(data, function(index, obj) {
					$('tbody').append('<tr><td>'+obj.reportNum+'</td><td>'
							+obj.userEmail+'</td><td>'+obj.noteOrCommCode+'</td><td>'
							+obj.noteNum+'</td><td>'+obj.reportCauseCode+'</td><td>'
							+obj.reportContent+'</td><td>'+obj.reportInDate+'</td><td>'
							+obj.checkCode+'</td><td><button class="btn btn-sm drop-btn">설정</button></td><td>'
							+obj.reportmemo+'</td><td></tr>');
				})
			}
		})
	}
	
	$(document).ready(function() {
		$('#table_id').DataTable();

		$('#report').click(selectAll());
		
		$('#noteReport').click(function() {
			$.ajax({
				url : '../etc/noteReport.json',
				success : function(data) {
					$('tbody').empty();
					$.each(data, function(index, obj) {
						$('tbody').append('<tr><td>'+obj.reportNum+'</td><td>'
								+obj.userEmail+'</td><td>'+obj.noteOrCommCode+'</td><td>'
								+obj.noteNum+'</td><td>'+obj.reportCauseCode+'</td><td>'
								+obj.reportContent+'</td><td>'+obj.reportInDate+'</td><td>'
								+obj.checkCode+'</td><td><button class="btn btn-sm drop-btn">설정</button></td><td>'
								+obj.reportmemo+'</td><td></tr>');
					})
				}
			})
		})

		$('#commReport').click(function() {
			$.ajax({
				url : '../etc/commReport.json',
				success : function(data) {
					$('tbody').empty();
					$.each(data, function(index, obj) {
						$('tbody').append('<tr><td>'+obj.reportNum+'</td><td>'
								+obj.userEmail+'</td><td>'+obj.noteOrCommCode+'</td><td>'
								+obj.noteNum+'</td><td>'+obj.reportCauseCode+'</td><td>'
								+obj.reportContent+'</td><td>'+obj.reportInDate+'</td><td>'
								+obj.checkCode+'</td><td><button class="btn btn-sm drop-btn">설정</button></td><td>'
								+obj.reportmemo+'</td><td></tr>');
					})
				}
			})
		})

	});
</script>