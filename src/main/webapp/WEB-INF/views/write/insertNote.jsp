<!-- 
* @ jsp : insertNote.jsp
* @ Date : 2018.10.10
* @ Author : 고은아
* @ Desc : 노트 작성을 위해 들어오는 페이지
-->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector : 'textarea'
	});
</script>
<!-- 등록 전 띄워지는 모달창 -->
<form action="">
	<div id="publishModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="form-group">
              			<label>폴더 </label>
	                  		<select id="folderName" name="folderName">
	                  			<!-- 나중에 each문 돌려서 박아야 함 -->
	                  			<option value="" selected="selected"> 기본 폴더
	                  			<option value=""> 폴더1
	                  			<option value=""> 폴더2
	                  		</select>
					</div>
					<div class="form-group">
              			<label>주제 </label>
	                  		<select id="subjectCode" name="subjectCode">
	                  			<!-- 기타일 때는 텍스트 박스가 옆에 떠야 하는데 이걸 어떻게 if문을 돌려야 하는지 약간 의문 -->
	                  			<option value="SJ00" selected="selected"> 기타
	                  			<option value="SJ01"> 회사
	                  			<option value="SJ02"> 생활
	                  			<option value="SJ03"> 교육
	                  		</select>
	                  		<input type="text">
					</div>
					<div>
						<label>공개</label>
						<input type="radio" name="notePublic" value="1" checked="checked">전체 공개
					</div>
					<div>
						<label>설정</label>
						<input type="radio" name="notePublic" value="0">비공개
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">발행하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 텍스트 에디터 -->
	<div class="container">
		<div class="form-group">
			<input id="noteTitle" name="noteTitle" type="text" size="158">
		</div>
		<textarea id="noteContent" name="noteContent" rows="30"></textarea>
		<br>
		<div class="col-sm-16 text-right">
			<input type="button" class="btn btn-secondary" value="문자 인식">
			<input type="button" class="btn btn-secondary" value="맞춤법 검사">
		</div>
		<br>
		<div class="col-sm-16 text-center">
			<input id="submitBtn" name="submitBtn" class="btn btn-danger"
				type="button" value="등록" data-toggle="modal" data-target="#publishModal">
		</div>
	</div>
</form>