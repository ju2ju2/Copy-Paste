<%-- admin>>
@JSP : manageNote.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 관리자 노트관리
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/api/jquery/dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		$('#table_id').DataTable();

		$('#noteReport').click(function() {
			$.ajax({
				url : '/etc/noteReport.json',
				success : function(data) {
					//댓글 목록 불러오기
				}
			})
		})

		$('#commReport').click(function() {
			$.ajax({
				url : '/etc/commReport.json',
				success : function(data) {
					//댓글 목록 불러오기
				}
			})
		})

	});
</script>
<section>
	<div class="container">
		<div>
			<h3>신고 관리</h3>
			<button id="noteReport" class="btn btn-sm drop-btn">노트</button>
			<button id="commReport" class="btn  btn-sm drop-btn">댓글</button>
		</div>

		<br>
		<table id="table_id">
			<thead>
				<tr>
					<td>신고번호</td>
					<td>노트번호</td>
					<td>노트 누적 신고횟수</td>
					<td>작성자 이메일</td>
					<td>신고자 이메일</td>
					<td>신고일자</td>
					<td>신고사유</td>
					<td>처리상황 및 노트상태</td>
					<td>메모</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>5</td>
					<td>2</td>
					<td>1@1.com</td>
					<td>7@7.com</td>
					<td>2018.10.10</td>
					<td>저작권 위반</td>
					<td>확인/정상</td>
					<td>노트 작성자가 정말 기타를 쳤다 뭔데 이 미친 허위신고 </td>
				</tr>
				<tr>
					<td>2</td>
					<td>5</td>
					<td>2</td>
					<td>1@1.com</td>
					<td>8@8.com</td>
					<td>2018.10.10</td>
					<td>저작권 위반</td>
					<td>미확인</td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>6</td>
					<td>1</td>
					<td>2@2.com</td>
					<td>8@8.com</td>
					<td>2018.10.10</td>
					<td>음란물</td>
					<td>미확인</td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
