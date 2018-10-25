<!-- write>>
* @ jsp : insertWithOtherNote.jsp
* @ Date : 2018.10.10
* @ Author : 우나연
* @ Desc : 다른 노트이용해 새노트 작성을 위해 들어오는 페이지
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
      type:"POST",
      dataType:"json",
      success:function(data){
 
      	$.each(data, function(key,value){
      			$("#folderList").append($("<option />")
      				.val(value.folderName)
      				.text(value.folderName));
      			  if($(this).val()=="${note.folderName}"){
      			      $(this).prop("selected",true); // attr적용안될경우 prop으로 
      			    }
      	//$('select[val=${note.subjectCode}]').prop("selected", true);		
      	
      	});
       }
    }); 
	
	//노트 주제 조회 및 옵션추가 
	$.ajax({
      url: "${pageContext.request.contextPath}/note/selectSubjectCode.json", // url_pettern 
      type:"POST",
      dataType:"json",
      success:function(data){
      	$.each(data, function(key,value){
      			$("#subjectList").append($("<option />")
      				.val(value.subjectCode)
      				.text(value.subjectName) );
      	});
       }
    }); 

	//다른 노트이용해 새노트 작성
	$('#insertNoteBtn').click(function() {
	 	$.ajax({
	      url: "${pageContext.request.contextPath}/note/insertNote.json", // url_pettern 
	      type:"post",
	      dataType:"json",
	      data: {'noteTitle':$("#noteTitle").val(),
	    	 	 'noteContent':tinymce.get('noteContent').getContent(),
	    	 	 'folderName':$("#folderList").val(),
	    	 	 'subjectCode':$("#subjectList").val(),
	    	 	 'notePublic':$("input:radio[name=notePublic] :selected").val()
	     		 },	
	      success:function(result){
	    	  swal({type: "success",
				  title: '성공적으로 등록되었습니다.',
	              confirmButtonClass : "btn-danger",
				  closeOnConfirm: false
			},
			function(){
				location.href="${pageContext.request.contextPath}/note/note.htm";
			});	
	       },
	      error:function(request,status,error){
	    	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }

	     		 
	    })
	})

	
	
})

</script>
<!-- 등록 전 띄워지는 모달창 -->
<form action="" method="post">
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
</form>

