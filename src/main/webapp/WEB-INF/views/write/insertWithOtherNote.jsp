<!-- write>>
* @ jsp : insertWithOtherNote.jsp
* @ Date : 2018.10.10
* @ Author : 우나연
* @ Desc : 다른 노트이용해 새노트 작성을 위해 들어오는 페이지
-->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<form method="post">
	<!-- 텍스트 에디터 -->
	<div class="n-container">
	<div class="n-inner">
		<div class="form-group">
			<input id="noteTitle" name="noteTitle" type="text" size="158" value="${note.noteTitle}">
		</div>
		<textarea id="noteContent" name="noteContent" rows="20">${note.noteContent}</textarea>
		<input name="image" type="file" id="upload" multiple class="hidden" onchange="">
		<br>
		<div class="col-sm-12 text-right">
			<input type="button" class="btn btn-secondary" value="문자 인식">
			<input type="button" class="btn btn-secondary" value="맞춤법 검사">
		</div>
		<br>
		<div class="col-sm-12 text-center">
			<input id="submitBtn" name="submitBtn" class="btn btn-danger"
				type="button" value="등록" data-toggle="modal"
				data-target="#publishModal">
		</div>
	</div>
	</div>
	<!-- 최종등록 전 띄워지는 모달창 -->
	<div id="publishModal" class="modal fade form-horizontal">
		<div class="modal-dialog noteModalSize">
			<div class="modal-content">
				<div class="modal-body">
					<div class="form-group">
					<br/>
						<label class="control-label col-sm-2 noteLabels">폴더 </label>
						<select id="folderList" name="folderName" class="form-control notePublish" ></select>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2 noteLabels">주제 </label> 
						<select	id="subjectList" name="subjectCode" class="form-control notePublish"></select>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2 noteLabels" id="noteLabel">공개<br/>설정</label>
						<input type="radio" name="notePublic" value="1"
							checked="checked" id="noteRadio1"> 전체 공개 <br/>
						<input type="radio" name="notePublic" value="0" > 비공개
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="insertNoteBtn">발행하기</button>
				</div>
			</div>
		</div>
	</div>
</form>

<!-- 문자추출 모달 -->
<div id="visionModal" class="modal fade form-horizontal">
	<div class="modal-dialog noteModalSize">
		<form id="visionform" name="visionform" enctype="multipart/form-data" accept-charset="utf-8">
			<div class="modal-content">
				<div class="modal-body">
					<div class="visionImg">
					<input type="file" name="visionImg" id="visionImg" aria-describedby="file_upload" accept="image/*">
					<br><small> * .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="visionBtn">문자 추출</button>
				</div>
			</div>
		</form>
	</div>
</div>

