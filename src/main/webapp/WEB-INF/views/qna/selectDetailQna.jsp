<%-- qna>>
@JSP : selectQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 상세보기 화면 입니다. 
		댓글 신고 기능 추가. 2018. 10. 12 이주원
		
@Date : 2018.10.09
@Author : 임지현
@Desc : Q&A 게시판 상세보기
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<se:authentication property="name" var="loginuser" />
<se:authentication property="authorities" var="role" />

<section id="content">
	<div class="container qnaDitailContent">
		<form action="./BoardAddAction.bo" method="post" id="insertQnaform"
			class="contact-form">
			<input type="hidden" name="Member_email"
				value="${sessionScope.email}">
			<!-- QnA 게시판 디테일 -->
			<div class="col-md-12">
				<div class="form-group">
					<h3 align="center">
						<strong>${qna.qnaTitle}</strong>
					</h3>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group" align="right">

					<strong>${qna.userNick}</strong>&nbsp;&nbsp;${qna.qnaDate}
				</div>
			</div>
			<div class="col-md-12">
				<div class="qnacontent">${qna.qnaContent}</div><br/>
			</div>
		</form>
		<!-- QnA 댓글 -->
	<div class="col-lg-12 col-sm-12 text-left">
			
			<c:forEach var="qnaComm" items="${qnaCommList}">
				
				<div class="">
					<ul data-brackets-id="12674" id="sortable" class="list-unstyled ui-sortable">
						<div class="media-body">
							<strong class="pull-left primary-font">
							<c:if test="${qnaComm.qnaCommDept==1}">ㄴ</c:if>
							${qnaComm.userNick}</strong>${qnaComm.qnaCommDate}<br>
							<small class="pull-right text-muted">
								<c:choose>
									<c:when test="${qnaComm.userEmail==loginuser}">
										<i class="fas fa-trash"></i>
									</c:when>
									<c:when test="${role=='ROLE_ADMIN'}">
										<i class="fas fa-trash"></i>
									</c:when>
								</c:choose>
								<c:if test="${qnaComm.userEmail==loginuser}">
									
								</c:if>
								 &ensp; 
								 <c:if test="${qna.userEmail==loginuser}">
									<i class="fas fa-comment"></i>
								</c:if>
							</small>
							<div class="qnaCommContent">
							<c:if test="${qnaComm.qnaCommDept==1}">&ensp;&ensp;</c:if>
							${qnaComm.qnaCommContent}</div>
						</div>
					</ul>
				</div>
			</c:forEach>
			
			<div class="input-group">
				<input type="text" id="userComment"
					class="form-control input-sm chat-input" placeholder="댓글을 입력하세요" />
				<span class="input-group-btn" onclick="addComment()">
					<div>
						<a href="#" class="btn main-btn center-block" id="commentbtn"><i
							class="fas fa-check"></i> Add Comment</a>
					</div>
				</span>
			</div>
		</div>
	</div>
</section>
