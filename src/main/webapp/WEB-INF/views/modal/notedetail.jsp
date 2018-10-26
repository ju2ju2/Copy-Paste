<%-- modal>>
@JSP : notedetail.jsp
@Date : 2018.10.11
@Author : 우나연
@Desc : 노트 상세보기 db값 입력(우나연, 10월 17일)
		댓글 신고 클릭시 모달창 추가, OK버튼 누를 때 스위트알럳 뜸. 버튼색은 추후 수정 필요.(이주원, 10월 12일)
		스위트 알럿 cdn방식이 아닌 js와 css를 임포트 하는 방식으로 변경. (이주원, 10월 15일)
		
@Date : 2018.10.25
@Author : 고은아
@Desc : 신고 버튼 모달
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function reportSomething(thisId) {
	$('#reportUserEmail').val('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}');
	$('#reportCauseCode').val('chooseReportCause');
	$('#reportContent').val('');
	if(thisId == 'reportNote') {
		$('#reportNoteNum').val(${note.noteNum});
		$('#noteOrCommCode').val('NC00');
	} else {
		$('#noteOrCommCode').val('NC01');
		
	}
}
function reportClose() {
	$('#insertReportModal').modal('toggle');
}

$(document).ready(function() {

		// 신고하기
		$('#reportSubmitBtn').click(function() {
			console.log("신고 버튼 누름");
			if ($('#reportCauseCode').val() == 'chooseReportCause'){
				swal("신고 사유 미선택", "신고 사유 선택 후 다시 시도 바랍니다.", "error");
			} else {
				console.log($('#reportUserEmail').val());
				console.log($('#reportNoteNum').val());
				console.log($('#noteOrCommCode').val());
				console.log($('#reportCauseCode').val());
				console.log($('#reportContent').val());
				
				$.ajax({
					url : '${pageContext.request.contextPath}/etc/insertReport.json',
					data : {"userEmail" : $('#reportUserEmail').val(),
						"noteNum" : $('#reportNoteNum').val(),
						"noteOrCommCode" : $('#noteOrCommCode').val(),
						"reportCauseCode" : $('#reportCauseCode').val(),
						"reportContent" : $('#reportContent').val()
						},
						success:function(data){
							swal("신고했습니다.", "관리자가 확인 후 해당 건을 블라인드 처리합니다.", "success");
							reportClose();
						}
				});
			}
		})
		
		//노트삭제
		$('#deleteNoteBtn').click(function(e) {
			swal(
					{
					  title: "정말 삭제하시겠습니까?",
					  text: "삭제 후에는 다시 복구 할 수 없습니다.",
					  type: 'warning',
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
							data: {	'noteNum': ${note.noteNum} }
						}).done(function(result) {
							swal(
									{type: "success",
									 title: '성공적으로 삭제되었습니다.',
						             confirmButtonClass : "btn-danger",
									 closeOnConfirm: false},
									function(){
										location.href="${pageContext.request.contextPath}/index.htm";
									}
								)
						
					
					})
					.fail(function(jqXhr, testStatus, errorText){
						alert("에러발생 :" + errorText);
					});
				}
			); 
			return false;
		});
		
	})
</script>


<!-- 신고 모달창 -->
<div id="insertReportModal" class="modal fade text-center overlay" role="dialog" style="display: none; z-index: 1060;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
		     	<button type="button" class="close" aria-hidden="true" onclick="reportClose()">×</button>
		    	<h4 class="modal-title" id="myModalLabel">신고하기</h4>
     		</div>
			<div class="modal-body">
				<input type="text" id="noteOrCommCode">
				<input type="text" id="reportUserEmail">
				<input type="text" id="reportNoteNum">
				<div class="form-group">
					<label class="control-label">신고사유</label>
					<select class="form-control" id="reportCauseCode">
						<option value="chooseReportCause">신고사유를 선택하세요</option>
						<option value="NR01">광고/음란성</option>
						<option value="NR02">비속어 사용</option>
						<option value="NR03">회원 비방</option>
						<option value="NR04">저작권 침해</option>
						<option value="NR00">기타</option>
					</select>
				</div>
					<label class="control-label">상세 신고 사유</label>
					<textarea rows="15" cols="40" id="reportContent"></textarea>
			</div>
			<div class="modal-footer">
				<input type="button"class="btn btn-danger" id="reportSubmitBtn" value="신고">
			</div>
		</div>
	</div>
</div>


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
		<div class="col-xs-6"></div>
		<div class="col-xs-6"></div>
	</div>
</div>
<!-- modal-body-->
<div class="modal-body">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="text-right col-sm-1"></div>
				<!-- 본문 -->
				<div class="text-left col-sm-10">${note.noteContent}</div>
				<div class="row">
					<br> <br> <br> <br>
					<div class="col-sm-9"></div>
					<div class="col-sm-3">
						<strong> 
								 <a href="${pageContext.request.contextPath}/note/updateNote.htm?noteNum=${note.noteNum}"><i class="far fa-edit 3x notewrite"></i> &nbsp;</a> 
								 <a href=""><i class="fas fa-arrow-down"></i> &nbsp;</a> 
								 <a id="deleteNoteBtn"><i class="fas fa-trash"></i> &nbsp;</a> 
								 <a href=""><i class="fas fa-archive"></i>&nbsp;</a>
								 <a href="#" id="reportNote" data-toggle="modal" data-target="#insertReportModal" onclick="reportSomething(this.id)"> <i class="fas fa-flag"></i></a>
						</strong>
					</div>
				</div>

			</div>
			<!-- modal-footer-->
			<div class="modal-footer">
				<div class="panel-footer">
					<div class="comment-box">

						<ul data-brackets-id="12674" id="sortable"
							class="list-unstyled ui-sortable">
							<c:choose>
								<c:when test="${empty noteCommList}">
									<div class="col-lg-12 col-sm-12 text-left">등록된 댓글이 없습니다.
									</div>
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
													<small> &ensp;${noteCommList.commDate}</small><br> 
													<small	class="pull-right text-muted"> <span class="">삭제</span>&ensp;
														<span class="">댓글</span>&ensp; <a href="#" id="reportComm" data-toggle="modal" data-target="#insertReportModal" onclick="reportSomething(this.id)">신고</a>&ensp;
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
							<span class="input-group-btn" onclick="addComment()">
								<div>
									<a href="#" class="btn main-btn center-block" id="commentbtn"><i
										class="fas fa-check"></i> Add Comment</a>
								</div>
							</span>
						</div>
					</div>		
					<!-- 닫기버튼 -->
					<input type="button" class="btn btn-default mr-10" data-dismiss="modal"
						value="Close" id="empbutton" />
					<div class="col-xs-10" id="lblstatus"></div>
				</div>
			</div>
		</div>

	</div>
</div>

