<%-- qna>>
@JSP : updateQnaboard.jsp
@Date : 2018.10.09
@Author : 임지현
@Desc : Q&A 게시판 수정 화면
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
				<c:choose>
					<c:when test="${qna.qnaSecret==0}">
						<input type="checkbox" value="1" name="qnaSecret" class="qnaSecret">&nbsp;비공개
					</c:when>
					<c:when test="${qna.qnaSecret==1}">
						<input type="checkbox" value="1" name="qnaSecret" class="qnaSecret" checked="checked">&nbsp;비공개
					</c:when>
				</c:choose>
				<button type="submit" class="btn btn-danger center-block"
					id="qnainsertbtn">수정</button></div>
			</div>
		</form>
	</div>
</section>
