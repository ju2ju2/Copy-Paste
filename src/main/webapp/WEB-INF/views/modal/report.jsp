<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<strong>작성자</strong> <span id="commWriterOut"></span>
				</p>
				<p style="width: 300px; padding-top: 10px;">
					<strong>작성내용</strong> <span id="commContentOut"></span>
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
					<strong>위와 같은 내용으로 <br/>해당 댓글을 신고하시겠습니까?</strong>
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




