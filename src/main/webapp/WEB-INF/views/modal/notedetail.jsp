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
<!-- Sweet Alert cdn -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/alert/sweetalert.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
<!-- 신고 모달창에서 ok버튼 눌렀을 때 스윗알럳 띄우기 -->
<script>
	$(document).ready(function() {
		$('#reportOK').click(function() {
			swal({
				title : "신고되었습니다.",
				text : "",
				type : "success",
				confirmButtonText : "OK",
				confirmButtonClass : "btn-danger"
			});
		});
	})
</script>
<!-- modal-header -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<br>
	<h2 class="modal-title">${note.noteTitle}</h2>
	<div class="row">
		<div class="col-xs-6" />
		<div class="col-xs-6">
			<strong>${note.userNick}</strong>&nbsp;&nbsp;${note.noteDate}
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6" />
		<div class="col-xs-6"></div>
	</div>
</div>
<!-- modal-body-->
<div class="modal-body">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="text-right col-sm-1" />
				<!-- 본문 -->
				<div class="text-left col-sm-10">${note.noteContent}</div>
				<div class="row">
					<br> <br> <br> <br>
					<div class="col-sm-9"></div>
					<div class="col-sm-3">
						<strong> <a href=""><i
								class="far fa-edit 3x notewrite"></i> &nbsp;</a> <a href=""><i
								class="fas fa-arrow-down"></i> &nbsp;</a> <a href=""><i
								class="fas fa-trash"></i> &nbsp;</a> <a href=""><i
								class="fas fa-archive"></i></strong></a>
					</div>
				</div>

			</div>
			<!-- modal-footer-->
			<div class="modal-footer">
				<div class="panel-footer">
					<div class="row">
						<div class="col-lg-12 col-sm-12 text-left">
							<div class="comment-box">
								<ul data-brackets-id="12674" id="sortable"
									class="list-unstyled ui-sortable">
									<div class="media-left">
										<img class="user-photo"
											src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
									</div>
									<div class="media-body">
										<strong class="pull-left primary-font">blueblue</strong><br>
										<small class="pull-right text-muted"> <span class="">삭제</span>&ensp;
											<span class="">댓글</span>&ensp; <a href="#"
											data-toggle="modal" data-target="#reportModal" id="report">신고</a>&ensp;
										</small>
										<p>운영자 일 안하십니까? 답변 안하시냐구요. 지금 질문한지 7분 13초나 지났는데 아직도 답변
											안주시네요. 사이트 폭망하시길 기원합니다.</p>

									</div>
								</ul>

								<div class="media-left">
									<img class="user-photo"
										src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
								</div>
								<div class="media-body">
									<strong class="pull-left primary-font">green</strong><br>
									<small class="pull-right text-muted"> <span class="">삭제</span>&ensp;
										<span class="">댓글</span>&ensp; <a href="#" data-toggle="modal"
										data-target="#reportModal" id="report">신고</a>&ensp;
									</small>
									<p>위엣분 성격 더럽게 급하시네요.</p>
								</div>

								<div class="input-group">
									<input type="text" id="userComment"
										class="form-control input-sm chat-input"
										placeholder="댓글을 입력하세요" /> <span class="input-group-btn"
										onclick="addComment()">
										<div>
											<a href="#" class="btn main-btn center-block" id="commentbtn"><i
												class="fas fa-check"></i> Add Comment</a>
										</div>
									</span>
								</div>


							</div>
						</div>
					</div>
				</div>

				<input type="button" class="btn btn-default" data-dismiss="modal"
					value="Close" id="empbutton" />
				<div class="col-xs-10" id="lblstatus"></div>
			</div>
		</div>
	</div>

</div>


<!-- 댓글 신고 Modal -->
<div class="modal fade" id="reportModal" role="dialog">
	<div class="modal-dialog">
		<!-- 댓글 신고 Modal content-->
		<div class="modal-content" align="left">
			<div class="modal-header" align="center">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">댓글 신고</h4>
			</div>
			<div class="modal-body">
				<p>
					<strong>작성자</strong>&ensp;&ensp;&ensp;똥싸개
				</p>
				<p style="width: 300px; padding-top: 10px;">
					<strong>작성내용</strong>
				<div>운영자 이 xxxx xx야 너를 xxxx해서 운영자의 하느님이 주신 용돈을 내가 취하고 싶다.</div>
				</p>
				<p style="padding-top: 10px;">
					<strong>신고 사유</strong>&ensp; <select name="cause-category"
						id="cause-category">
						<option value="">신고 사유를 선택하세요</option>
						<option value="1">저작권 위반</option>
						<option value="1">음란성</option>
						<option value="1">명예훼손</option>
						<option value="1">개인정보 유출</option>
						<option value="1">부적절한 홍보</option>
						<option value="1">기타</option>
					</select>
				</p>
				<p style="padding-top: 10px;">
					<strong>신고 사유 상세</strong>
				</p>
				<textarea rows="5" class="form-control textarea"
					placeholder="신고 사유를 입력하세요"></textarea>
				<br>
				<p align="center">
					<strong>위와 같은 내용으로 해당 댓글을 신고하시겠습니까?</strong>
				</p>
			</div>

			<div class="modal-footer">
				<div>
					<a data-toggle="modal" href="#" data-target="#reportModal"
						role="button" class="btn main-btn" data-backdrop="static"
						id="reportOK">OK</a> <a data-toggle="modal" href="#"
						data-target="#reportModal" role="button" class="btn btn-default"
						data-backdrop="static">Cancel</a>
				</div>
			</div>
		</div>

	</div>
</div>


