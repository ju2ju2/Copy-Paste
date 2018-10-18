<!-- write>>
* @ jsp : insertNote.jsp
* @ Date : 2018.10.10
* @ Author : 고은아
* @ Desc : 노트 작성을 위해 들어오는 페이지
-->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=yaps0ah95j72p1podkonpizywofdvarpwuuzjrfbjm1ysadp"></script>
<script src="${pageContext.request.contextPath}/resources/js/textEditer.js"></script>
<script>
$(document).ready(function() {
	
	//회원의 폴더목록  조회 및 옵션추가 
	$.ajax({
      url: "${pageContext.request.contextPath}/folder/selectAllFolder.json", // url_pettern 
      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
      success:function(data){
      	 //console.log(uniqueLoc);
      	$.each(data, function(key,value){
      			$("#folderList").append($("<option />")
      				.val(value.folderName)
      				.text(value.folderName) );
      	});
       }
    }); 
	
	//노트 주제 조회 및 옵션추가 
	$.ajax({
      url: "${pageContext.request.contextPath}/note/selectSubjectCode.json", // url_pettern 
      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
      success:function(data){
      	 //console.log(uniqueLoc);
      	$.each(data, function(key,value){
      			$("#folderList").append($("<option />")
      				.val(value.folderName)
      				.text(value.folderName) );
      	});
       }
    }); 
	
	
})



</script>
<!-- 등록 전 띄워지는 모달창 -->
<form action="">
	<div id="publishModal" class="modal fade form-horizontal">
		<div class="modal-dialog noteModalSize">
			<div class="modal-content">
				<div class="modal-body">
					<div class="form-group">
					<br/>
						<label class="control-label col-sm-2 noteLabels">폴더 </label>
						<select id="folderList" name="folderList" class="form-control notePublish" >
							
							
						</select>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2 noteLabels">주제 </label> <select
							id="subjectCode" name="subjectCode" class="form-control notePublish">
							<option value="SJ00" selected="selected">기타
							<option value="SJ01">회사
							<option value="SJ02">생활
							<option value="SJ03">교육
						</select>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2 noteLabels" id="noteLabel">공개<br/>설정</label>
						<input type="radio" name="notePublic" value="1"
							checked="checked" id="noteRadio1"> 전체 공개 <br/>
						<input type="radio" name="notePublic" value="0" > 비공개
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">발행하기</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 텍스트 에디터 -->
	<div class="n-container">
	<div class="n-inner">
		<div class="form-group">
			<input id="noteTitle" name="noteTitle" type="text" size="158" placeholder="제목">
		</div>
		<textarea id="noteContent" name="noteContent" rows="20"></textarea>
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
</form>

