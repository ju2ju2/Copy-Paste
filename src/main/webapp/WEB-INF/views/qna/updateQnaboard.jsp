<%-- qna>>
@JSP : insertQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 글쓰기 화면입니다. 동기식으로 이동합니다.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<se:authentication property="name" var="loginuser" />
<se:authentication property="authorities" var="role" />
<section id="content">
	<div class="container">
		<form action="${pageContext.request.contextPath}/qna/updateQna.htm" method="post" id="insertQnaform" class="contact-form">
			<input type="hidden" name="qnaNum" value="${qna.qnaNum}" />
			<div class="col-md-12">
				<div class="form-group">
					<input type="text" class="form-control qnaTitle" name="qnaTitle"
						autocomplete="off" id="qnatitle" value="${qna.qnaTitle}"/>&ensp;
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<textarea class="form-control textarea" rows="15" name="qnaContent"
						id="qnacontent" >${qna.qnaContent}</textarea>
				</div>
			</div>
			<div class="col-md-12">
				<div class="qnaSecret">
				<button type="submit" class="btn btn-danger center-block"
					id="qnainsertbtn">수정</button></div>
			</div>
		</form>
	</div>
</section>
