<%-- qna>>
@JSP : selectQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 목록보기 입니다. 목록보기, 글쓰기, 검색이 가능합니다.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<section id="content">
	<div class="container">
	<%-- ${qnaList} --%>
	<table id="table_id" class="hover">
    <thead>
        <tr>
            <th>No.</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="qna" items="${qnaList}" >
    		<tr>
				<td><c:if test="${qna.qnaNotice >0}">-</c:if><c:if test="${qna.qnaNotice ==0}">${qna.qnaNum}</c:if> </td>
				<td>
					<a href="${pageContext.request.contextPath}/qna/selectDetailQna.htm?qnaNum=${qna.qnaNum}" class="title">
						<c:if test="${qna.qnaDept == 1}">ㄴ답변: </c:if>
						<c:if test="${qna.qnaSecret == 1}"><i class="fas fa-lock"></i></c:if>
						 ${qna.qnaTitle}
					</a>
				</td>
				<td>${qna.userNick}</td>
				<td>${qna.qnaDate}</td>
			</tr>
    	 </c:forEach> 
    	
    </tbody>
</table>
	<div style="text-align: right;">
	<a href="" class="btn main-btn" id="qnaboard_btn_list" role="button">목록</a>
	<a href="${pageContext.request.contextPath}/qna/insertQnaboard.htm" class="btn main-btn" id="qnaboard_btn_write" role="button">글쓰기</a>
	</div>
</div>
</section>
<!-- DataTable -->
<script>
$(document).ready(function() {
    $('#table_id').DataTable({
    	"order": false
    });
} );
</script>