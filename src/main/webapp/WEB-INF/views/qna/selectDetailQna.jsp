<%--
@JSP : selectQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 상세보기 화면 입니다. 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<section id="content">
	<div class="container">

		<form action="./BoardAddAction.bo" method="post" id="insertQnaform"
			class="contact-form">
			<input type="hidden" name="Member_email"
				value="${sessionScope.email}">
			<c:if test="${sessionScope.email=='admin@admin.org'}">
				<tr>
					<td style="font-family: 돋음; font-size: 12" width="10%" height="16">
						<div align="left">
							<h3>Q&A 게시판</h3>
						</div>
					</td>
				</tr>
			</c:if>

			<%-- <tr> 
			<td style="Display:none"><strong>작성자</strong></td>
			<td style="Display:none">${sessionScope.email}</td>
		</tr> --%>

			<div class="col-md-12">
				<div class="form-group">
					<h3 align="center">
						<strong>청소년에게 왜 부적절한데요;;;</strong>
					</h3>
				</div>
			</div>

			<div class="col-md-12">
				<div class="form-group" align="right">
					<strong>발렌티</strong>&nbsp;&nbsp;18/08/27
				</div>
			</div>

			<div class="col-md-12">
				<div class="qnacontent">
					<p>맨날 술만 처마시냐 발렌티라고 발렌티 발렌타인이 아니고 아니 그리고 발렌타인이라고 청소년에게 유해하다는 것도
						웃기네 발렌타인 데이가 뉴스에서 필터링 돼서 나오는 거 봤냐? 아 진짜 운영자 핵미친놈 빨리 블라인드 풀어</p>
				</div>
				<div class="col-md-12">
		</form>

		<div class="col-lg-12 col-sm-12 text-left">
			<div class="comment-box">
				<ul data-brackets-id="12674" id="sortable"
					class="list-unstyled ui-sortable">
					<div class="media-left">
						<img class="img-responsive user-photo"
							src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div>
					<div class="media-body">
						<strong class="pull-left primary-font">blueblue</strong><br>
						<small class="pull-right text-muted">	
							<span class="">삭제</span>&ensp; 
							<span class="">댓글</span>&ensp;
							<span class="">신고</span>&ensp;
						</small>
						<p>운영자 일 안하십니까? 답변 안하시냐구요. 지금 질문한지 7분 13초나 지났는데 아직도 답변 안주시네요.
							사이트 폭망하시길 기원합니다.</p>

					</div>
				</ul>
				<div class="media-left">
					<img class="img-responsive user-photo"
						src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
				</div>
				<div class="media-body">
					<strong class="pull-left primary-font">green</strong><br> <small
						class="pull-right text-muted">	
						<span class="">삭제</span>&ensp; 
						<span class="">댓글</span>&ensp;
						<span class="">신고</span>&ensp;
					</small>
					<p>위엣분 성격 더럽게 급하시네요.</p>
				</div>

				<div class="input-group">
					<input type="text" id="userComment"
						class="form-control input-sm chat-input" placeholder="댓글을 입력하세요" />
					<span class="input-group-btn" onclick="addComment()">
						
							<a href="#" class="btn main-btn center-block" id="commentbtn"><span
								class=""></span> Add Comment</a>

						
					</span>

				</div>

			</div>
		</div>
	</div>
</section>
