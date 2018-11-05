<%-- qna>>
@JSP : selectQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 목록보기 입니다. 목록보기, 글쓰기, 검색이 가능합니다.
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
<section id="content">
	<div class="container">

	
	
	<table id="table_id" class="display">
    <thead>
        <tr>
            <td>No.</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일자</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>7</td>
            <td><a href="${pageContext.request.contextPath}/etc/selectDetailQna.htm">뒤늦게 이제와서 뭔...</a></td>
            <td>메리크리</td>
            <td>18/09/19</td>
        </tr>
        <tr>
            <td>8</td>
            <td>음란성 아닌데요 ㅡㅡ</td>
            <td>원샷투샷</td>
            <td>18/09/23</td>
        </tr>
    </tbody>
</table>
	<a href="" class="btn main-btn" id="qnaboard_btn_list" role="button">목록</a>
	<a href="${pageContext.request.contextPath}/etc/insertQnaboard.htm" class="btn main-btn" id="qnaboard_btn_write" role="button">글쓰기</a>
</div></section>
