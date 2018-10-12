<!-- write>>
* @ jsp : insertNote.jsp
* @ Date : 2018.10.10
* @ Author : 고은아
* @ Desc : 노트 작성을 위해 들어오는 페이지
-->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>
var demoBaseConfig = {
		  selector: "textarea",
		  branding: false,
		  resize: false,
		  autosave_ask_before_unload: false,
		  powerpaste_allow_local_images: true,
		  plugins: [
		    "advcode advlist anchor autolink codesample colorpicker fullscreen help image imagetools",
		    " lists link media noneditable powerpaste preview",
		    " searchreplace table textcolor visualblocks wordcount"
		  ],
		  toolbar:
		    "undo redo | bold italic | forecolor backcolor codesample | alignleft aligncenter alignright alignjustify | bullist numlist | link image",
		  content_css: [
		    "http://fonts.googleapis.com/css?family=Lato:300,300i,400,400i",
		    "http://www.tiny.cloud/css/content-standard.min.css"
		  ],
		};

		var table = '<p>This table uses features of the non-editable plugin to make the text in the<br /><strong>top row</strong> and <strong>left column</strong> uneditable.</p>' +
		'    <table style="width: 60%; border-collapse: collapse;" border="1"> ' +
		'        <caption class="mceNonEditable">Ephox Sales Analysis</caption> ' +
		'       <tbody> ' +
		'          <tr class="mceNonEditable"> ' +
		'                <th style="width: 40%;">&nbsp;</th><th style="width: 15%;">Q1</th> ' +
		'                <th style="width: 15%;">Q2</th><th style="width: 15%;">Q3</th> ' +
		'                <th style="width: 15%;">Q4</th> ' +
		'            </tr> ' +
		'            <tr> ' +
		'                <td class="mceNonEditable">East Region</td> ' +
		'                <td>100</td> <td>110</td> <td>115</td> <td>130</td> ' +
		'            </tr> ' +
		'            <tr> ' +
		'                <td class="mceNonEditable">Central Region</td> ' +
		'                <td>100</td> <td>110</td> <td>115</td> <td>130</td> ' + 
		'            </tr> ' +
		'            <tr> ' +
		'                <td class="mceNonEditable">West Region</td> ' +
		'                <td>100</td> <td>110</td> <td>115</td> <td>130</td> ' +
		'            </tr> ' +
		'        </tbody> ' +
		'    </table>';

		var table2 = '<div> ' +
		'        <p>' +
		'            Templates are a great way to help content authors get started creating content.  You can define the HTML for the template and ' +
		'            then when the author inserts the template they have a great start towards creating content! ' +
		'        </p> ' +
		'        <p> ' +
		'            In this example we create a simple table for providing product details for a product page on your web site.  The headings are ' +
		'            made non-editable by loading the non-editable plugin and placing the correct class on the appropriate table cells. ' +
		'        </p> ' +
		'        <table style="width:90%; border-collapse: collapse;" border="1"> ' +
		'        <tbody> ' +
		'        <tr style="height: 30px;"> ' +
		'            <th class="mceNonEditable" style="width:40%; text-align: left;">Product Name:</td><td style="width:60%;">{insert name here}</td> ' +
		'        </tr> ' +
		'        <tr style="height: 30px;"> ' +
		'            <th class="mceNonEditable" style="width:40%; text-align: left;">Product Description:</td><td style="width:60%;">{insert description here}</td> ' +
		'        </tr> ' +
		'        <tr style="height: 30px;"> ' +
		'            <th class="mceNonEditable" style="width:40%; text-align: left;">Product Price:</td><td style="width:60%;">{insert price here}</td> ' +
		'        </tr> ' +
		'        </tbody> ' +
		'        </table> ' +
		'    </div> '; 

		tinymce.init(demoBaseConfig);

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
						<select id="folderName" name="folderName" class="form-control notePublish" >
							<!-- 나중에 each문 돌려서 박아야 함 -->
							<option value="" selected="selected">기본 폴더
							<option value="">폴더1
							<option value="">폴더2
						</select>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2 noteLabels">주제 </label> <select
							id="subjectCode" name="subjectCode" class="form-control notePublish">
							<!-- 기타일 때는 텍스트 박스가 옆에 떠야 하는데 이걸 어떻게 if문을 돌려야 하는지 약간 의문 -->
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
	<div class="container">
		<div class="form-group">
			<input id="noteTitle" name="noteTitle" type="text" size="158" placeholder="제목">
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
				type="button" value="등록" data-toggle="modal"
				data-target="#publishModal">
		</div>
	</div>
</form>