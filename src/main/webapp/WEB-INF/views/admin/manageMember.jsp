<%-- admin>>
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
} );
</script>
<section>
	<div class="container">
	<div>
		<h3>회원관리 </h3>
	</div>
	
	
	<table id="table_id" >
    <thead>
        <tr>
            <td>회원이메일</td>
            <td>회원닉네임</td>
            <td>강 제 탈 퇴</td>

        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1@1.com</td>
            <td>김정보</a></td>
            <td><button class="btn btn-danger btn-xs">강제탈퇴</button></td>
        </tr>
        <tr>
        	<td>2@2.com</td>
            <td>나루터</a></td>
            <td><button class="btn btn-danger btn-xs">강제탈퇴</button></td>
        </tr>
        <tr>
        	<td>3@3.com</td>
            <td>노란색</a></td>
            <td><button class="btn btn-danger btn-xs">강제탈퇴</button></td>
        </tr>
    </tbody>
</table>

</div>
</section>
