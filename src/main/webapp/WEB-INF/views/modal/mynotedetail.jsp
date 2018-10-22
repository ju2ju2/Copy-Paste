<%-- modal>>
@JSP : notedetail.jsp
@Date : 2018.10.11
@Author : 우나연
@Desc : 노트 상세보기 db값 입력(우나연, 10월 17일)
		댓글 신고 클릭시 모달창 추가, OK버튼 누를 때 스위트알럳 뜸. 버튼색은 추후 수정 필요.(이주원, 10월 12일)
		스위트 알럿 cdn방식이 아닌 js와 css를 임포트 하는 방식으로 변경. (이주원, 10월 15일)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 신고 모달창에서 ok버튼 눌렀을 때 스윗알럳 띄우기 -->
<script>


	$(document).ready(function() {
		//노트삭제
		$('#deleteNoteBtn').click(function(e) {
			swal({
				  title: "정말 삭제하시겠습니까?",
				  text: "삭제 후에는 다시 복구 할 수 없습니다.",
				  type: 'warning',
				  showCancelButton: false,
				  showCancelButton: true,
				  confirmButtonClass : "btn-danger btn-sm",
				  cancelButtonClass: "btn btn-sm",
				  confirmButtonText: '확인',
				  closeOnConfirm: false
				},
				function(){
					$.ajax ({
						url: "${pageContext.request.contextPath}/note/deleteNote.json",
						type: "POST",
						dataType: "json",
						data: {	'noteNum': ${note.noteNum} }//
					}).done(function(result) {
						swal({type: "success",
							  title: '성공적으로 삭제되었습니다.',
				              confirmButtonClass : "btn-danger",
							  closeOnConfirm: false
						},
						function(){
							location.href="${pageContext.request.contextPath}/index.htm";
						})
						
					
					})
					.fail(function(jqXhr, testStatus, errorText){
						alert("에러발생 :" + errorText);
					});
				});
			return false;
		});
			
		
		
		//신고 모달 클릭시 db 댓글 조회
		$('#report').click(function() {
			$('#commWriterOut').text($('#commWriter').text());
			$('#commContentOut').text($('#commContent').text());
		});

		//신고 모달 모달에서 확인시 경고창.
		$('#noteReportForm').click(function() {
			swal({
				  title:'<span class="title">노트신고</span>',
				  text: '<form><p><strong>작성자</strong> <span id="commWriterOut">${note.userNick}</span></p>'+
						'<input type="hidden" value=${note.userEmail}/>'+
						'</p><p style="padding-top: 10px;">'+
						'<strong>신고 사유</strong>&ensp; <select name="cause-category"'+
						'	id="cause-category">'+
						'	<option>신고 사유를 선택하세요</option>'+
						'	<option>저작권 위반</option>'+
						'	<option>음란성</option>'+
						'	<option>명예훼손</option>'+
						'	<option>개인정보 유출</option>'+
						'	<option>부적절한 홍보</option>'+
						'	<option>기타</option>'+
						'</select></p> <p style="padding-top: 10px;"><strong>신고 사유 상세</strong>'+
						'</p><textarea rows="5" class="form-control textarea noresize"'+
						'placeholder="신고 사유를 입력하세요"></textarea><br>'+
						'<p align="center"><strong>위와 같은 내용으로 <br/>해당 댓글을 신고하시겠습니까?</strong>'+
						'</p></div></form>'
				  ,
				  html: true,
				  inputAttributes: { autocapitalize: 'off' },
				  showCancelButton: true,
				  confirmButtonText : "OK",
				  confirmButtonClass : "btn-danger btn-sm",
				  cancelButtonClass : "btn btn-sm"
			},
			function(){
				$.ajax ({
					/* url: "${pageContext.request.contextPath}/note/deleteNote.json",
					type: "POST",
					dataType: "json",
					data: {	'noteNum': ${note.noteNum} } *///
				}).done(function(result) {
					swal({type: "success",
						  title: '성공적으로 신고되었습니다.',
			              confirmButtonClass : "btn-danger",
						  closeOnConfirm: false
					},
					function(){
						location.href="${pageContext.request.contextPath}/index.htm";
					})
					
				
				})
				.fail(function(jqXhr, testStatus, errorText){
					alert("에러발생 :" + errorText);
				});
			});
		return false;
	});
		
	
		
		
	});
</script>
<!-- modal-header -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<br>
	<!-- 노트제목 -->
	<h2 class="modal-title">${note.noteTitle}</h2>
	<div class="row">
		<div class="col-xs-6"></div>
		<div class="col-xs-6">
			<!-- 작성자/작성일 -->
			<strong>${note.userNick}</strong>&nbsp;&nbsp;${note.noteDate}
		</div>
	</div>
	<div class="row">
		<div class="text-right col-sm-1"></div>
		<!-- 본문 -->
		<div class="text-left col-sm-10">${note.noteContent}</div>
		<div class="row">
			<br> <br> <br> <br>
			<div class="col-sm-9"></div>
			<div class="col-sm-3">
				<strong> <a
					href="${pageContext.request.contextPath}/note/updateNote.htm?noteNum=${note.noteNum}"><i
						class="far fa-edit 3x notewrite"></i> &nbsp;</a> <a href=""><i
						class="fas fa-arrow-down"></i> &nbsp;</a> <a id="deleteNoteBtn"><i
						class="fas fa-trash"></i> &nbsp;</a> <a href=""><i
						class="fas fa-archive"></i>&nbsp;</a> <a id="noteReportForm"> <i
						class="fas fa-flag"></i></a>
				</strong>
			</div>
		</div>

		<div class="comment-box">

			<ul data-brackets-id="12674" id="sortable"
				class="list-unstyled ui-sortable">
				<c:choose>
					<c:when test="${empty noteCommList}">
						<div class="col-lg-12 col-sm-12 text-left">등록된 댓글이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="noteCommList" items="${noteCommList}">
							<div class="row">
								<div class="col-lg-12 col-sm-12 text-left">
									<div class="media-left">
										<img class="user-photo"
											src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
									</div>
									<div class="media-body">
										<strong class="pull-left primary-font" id="commWriter">${noteCommList.userNick}</strong>
										<small> &ensp;${noteCommList.commDate}</small><br> <small
											class="pull-right text-muted"> <span class="">삭제</span>&ensp;
											<span class="">댓글</span>&ensp; <a href="#"
											id="commReportForm">신고</a>&ensp;
										</small>
										<p id="commContent">${noteCommList.commContent}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>


			<!-- 댓글입력 -->
			<div class="input-group">
				<input type="text" id="userComment"
					class="form-control input-sm chat-input" placeholder="댓글을 입력하세요" />
				<span class="input-group-btn" onclick="addComment()"> <a
					href="#" class="btn main-btn center-block" id="commentbtn"><i
						class="fas fa-check"></i> Add Comment</a>
				</span>
			</div>
		</div>
		<!-- 닫기버튼 -->
		<input type="button" class="btn btn-default mr-10"
			data-dismiss="modal" value="Close" id="empbutton" />
		<div class="col-xs-10" id="lblstatus"></div>
	</div>

</div>
