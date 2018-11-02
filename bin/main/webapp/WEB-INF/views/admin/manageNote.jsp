<%-- admin>>
@JSP : qnaboardList.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 노트 일괄 삭제를 위한 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/api/jquery/dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script>
$(document).ready(function() {
    $('#table_id').DataTable();
} );
</script>
<section>
	<div class="container">
	<div>
		<h3>노트관리 </h3>
	</div>
	
	
	<table id="table_id" >
    <thead>
        <tr>
            <td>번호</td>
            <td>노트번호</td>
            <td>노트상태</td>
            <td>작성일자</td>
            <td>작성자 이메일</td>
            <td>작성자 상태</td>
            <td>노트삭제</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>a123</a></td>
            <td>블라인드</a></td>
              <td>2018/10/12</a></td>
               <td>a@a.com</a></td>
                <td>정상</a></td>
            <td><button class="btn btn-danger btn-xs">삭제</button></td>
        </tr>
        <tr>
            <td>1</td>
            <td>a123</a></td>
            <td>블라인드</a></td>
              <td>2018/10/12</a></td>
               <td>a@a.com</a></td>
                <td>정상</a></td>
            <td><button class="btn btn-danger btn-xs">삭제</button></td>
        </tr>
        <tr>
            <td>1</td>
            <td>a123</a></td>
            <td>블라인드</a></td>
              <td>2018/10/12</a></td>
               <td>a@a.com</a></td>
                <td>정상</a></td>
            <td><button class="btn btn-danger btn-xs">삭제</button></td>
        </tr>
        <tr>
            <td>1</td>
            <td>a123</a></td>
            <td>블라인드</a></td>
              <td>2018/10/12</a></td>
               <td>a@a.com</a></td>
                <td>정상</a></td>
            <td><button class="btn btn-danger btn-xs">삭제</button></td>
        </tr>
    </tbody>
</table>

</div>
</section>
