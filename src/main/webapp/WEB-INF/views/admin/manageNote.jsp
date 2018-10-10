<%--
@JSP : manageNote.jsp
@Date : 2018.10.10
@Author : 우나연
@Desc : 관리자 노트관리
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script>
$(document).ready(function() {
    $('#table_id').DataTable();
} );
</script>
<section>
	<div class="container">
	<div>
		<h3>회원노트관리 </h3>
	</div>
	
	
	<table id="table_id" >
    <thead>
        <tr>
            <td>번호</td>
            <td>노트제목</td>
            <td>노트상태</td>
            <td>작성일자</td>
			<td>작성자 이메일</td>
			<td>작성자 계정상태</td>
			<td>노트 삭제</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>5</td>
            <td>성적정정요청</td>
            <td>정상</td>
            <td>2018.08.31</td>
			<td>1@1.com</td>
			<td>자진 탈퇴</td>
            <td><button class="btn btn-danger btn-xs">삭제</button></td>
        </tr>
        <tr>
        	<td>4</td>
        	<td>시말서 양식</td>
            <td>블라인드</td>
            <td>2018.06.31</td>
			<td>2@2.com</td>
			<td>강제 탈퇴</td>
            <td><button class="btn btn-danger btn-xs">삭제</button></td>
        </tr>
        <tr>
        	<td>1</td>
			<td>가을에 보내는 편지</td>
            <td>정상</td>
            <td>2018.09.05</td>
			<td>1@1.com</td>
			<td>정상</td>
            <td><button class="btn btn-danger btn-xs">삭제</button></td>
        </tr>
    </tbody>
</table>

</div>
</section>
