<%-- qna>>
@JSP : selectQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 목록보기 입니다. 목록보기, 글쓰기, 검색이 가능합니다.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script>
$(document).ready(function() {
    $('#table_id').DataTable();
} );
</script>
<section id="content">
	<div class="container">
	${qnaData}
	<%-- <table id="table_id" class="display">
    <thead>
        <tr>
            <td>No.</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일자</td>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="data" items="${qnaData}">
    		<c:if test="${data.qnaDept eq 0}">
    			<tr>
					<td>${data.qnaNum}</td>
					<td><a href="${pageContext.request.contextPath}/qna/selectDetailQna.htm?no=${data.qnaNum}">${data.qnaTitle}</a></td>
					<td>${data.userEmail}</td>
					<td>${data.qnaDate}</td>
				</tr>
    		</c:if>
    	</c:forEach>
    </tbody>
</table> --%>
	<a href="" class="btn main-btn" id="qnaboard_btn_list" role="button">목록</a>
	<a href="${pageContext.request.contextPath}/qna/insertQnaboard.htm" class="btn main-btn" id="qnaboard_btn_write" role="button">글쓰기</a>
</div></section>
