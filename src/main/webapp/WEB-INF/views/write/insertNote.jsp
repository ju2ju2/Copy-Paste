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
      type:"POST",
      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
      success:function(data){  	
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
      type:"POST",
      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
      success:function(data){
      	$("#folderList").prepend("<option value='주제 선택'/>");
      	$.each(data, function(key,value){
      			$("#subjectList").append($("<option />")
      				.val(value.subjectCode)
      				.text(value.subjectName) );
      	});
       }
    }); 
	

	//노트 등록	
	$('#insertNoteBtn').click(function() {
		if ($('#noteTitle').val()==''){
			swal({type: "success",
				  title: '제목을 입력해주세요',
	              confirmButtonClass : "btn-danger btn-sm",
				  closeOnConfirm: true
			})
		}else if (tinymce.get('noteContent').getContent()==''){
			swal({type: "success",
				  title: '내용을 입력해주세요',
	              confirmButtonClass : "btn-danger btn-sm",
				  closeOnConfirm: true
			})
		} 
		else {
		 	$.ajax({
		      url: "${pageContext.request.contextPath}/note/insertNote.json", // url_pettern 
		      type:"post",
		      dataType:"json",
		      data: {'noteTitle':$("#noteTitle").val(),
		    	 	 'noteContent':tinymce.get('noteContent').getContent(),
		    	 	 'folderName':$("#folderList").val(),
		    	 	 'subjectCode':$("#subjectList").val(),
		    	 	 'notePublic':$("input[name='notePublic']:checked").val()
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
		}
	})

	
	
	
	//문자추출 vision
	$('#visionBtn').click(function(e) {
		      var form = document.getElementById("visionform")
		      var formData = new FormData(form);
		$.ajax({
		      url: "../note/visionAnalizeImg.json", // url_pettern 
		      type : 'post',
		      data: formData, 
		      enctype: 'multipart/form-data; charset=UTF-8',
		      processData : false,
		      contentType: false,
		      dataType: 'json'
		    }).done(function(data){
					$(".modal").modal("hide");
					var editor = tinyMCE.activeEditor;
	    			var noteContent = $('#noteContent').html();
	    			editor.dom.add(editor.getBody(), 'p', {}, data.text+ "<br>");
			}).fail(function(request,status,error){
	    	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			});

	})
	
	
	
	
	
	
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
						<select id="folderList" name="folderName" class="form-control notePublish" ></select>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2 noteLabels">주제 </label> 
						<select	id="subjectList" name="subjectCode" class="form-control notePublish" ></select>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2 noteLabels" id="noteLabel">공개<br/>설정</label>
						<input type="radio" name="notePublic" value="1" checked="checked" id="noteRadio1"> 전체 공개 <br/>
						<input type="radio" name="notePublic" value="0" >비공개
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
			<input id="noteTitle" name="noteTitle" type="text" size="158" required placeholder="제목을 입력해주세요">
		</div>
		<textarea id="noteContent" name="noteContent" rows="22" required></textarea>
		<input name="image" type="file" id="upload" multiple class="hidden" onchange="">
		<br>
		<div class="col-sm-12 text-right">
			<input type="button" class="btn btn-secondary" value="문자 인식" data-toggle="modal"
				data-target="#visionModal">
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

<div id="visionModal" class="modal fade form-horizontal">
	<div class="modal-dialog noteModalSize">
		<form id="visionform" name="visionform" enctype="multipart/form-data" accept-charset="utf-8">
			<div class="modal-content">
				<div class="modal-body">
				<input type="file" name="visionImg" id="visionImg" aria-describedby="file_upload" accept="image/*">
				<small> * .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="visionBtn">문자 추출하기</button>
				</div>
			</div>
		</form>
	</div>
</div>
