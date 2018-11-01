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
	
	//맞춤법 검사기
	// 맞춤법 검사기 클래스
	var spellChecker = {
	    url : null,
	    parse : function() {
	        return {
	            text : null,
	            count : -1,
	        };
	    }
	}
	// 사람인 파싱
	function parseForSaramin(resp) {
	    json_text = resp;
	    json_obj = JSON.parse(json_text);

	    result_with_replace = json_obj.result_text;
	    // 결과 문자열 교체
	    for (var i in json_obj.word_list) {
	        result_with_replace = replaceAll(result_with_replace, json_obj.word_list[i].errorWord, json_obj.word_list[i].candWordList[0])
	    }

	    return {
	        text : result_with_replace,
	        count : json_obj.result_cnt
	    };
	};
	
	// Javascript의 replace는 첫 문자열만 교체하기 때문에 모든 문자열 교체를 위해 작성함.
	function replaceAll(str, old_word, new_word) {
	    return str.split(old_word).join(new_word);
	}
	
	const SARAMIN_URL = "http://www.saramin.co.kr/zf_user/tools/spell-check?content=";

    var keepResultHtml;
    var keepResultText;
    var origin_text;
    var result_html
    var editor = tinyMCE.activeEditor;
    var sc = Object.create(spellChecker);
    
    var client = new XMLHttpRequest();
    function run(origin_text, callback) {
        client.onreadystatechange = function () {
            if (client.readyState === XMLHttpRequest.DONE && client.status === 200) {
                
                var results = sc.parse(client.responseText);
                
                if ("function" === typeof callback) {
                    callback(
                        results.text,
                        results.count
                    );
                }
            }
        }
        
        sc.parse = parseForSaramin;
        sc.url = SARAMIN_URL + origin_text;
        sc.url= encodeURI(sc.url);    
        
        client.open("GET", sc.url, true);
        client.send(null);
    }
    
    
    $("#checkSpellbtn").click(function() {
        // 입력 값 획득

        var origin_text = tinymce.get('noteContent').getContent({format: 'text'});
        var $check_result_label = $('#checkResultLabel');

        // 입력 값이 공백일 경우 처리
        if ("" == $.trim(origin_text)) {
            $('#check-result').text("");
            $check_result_label.removeClass("bg-secondary bg-success bg-danger").addClass("bg-secondary");
            $check_result_label.text("0");
            return;
        }
        
        // 맞춤법 검사
        run(origin_text, function(result_html, error_count) {
		   

            if (0 < error_count) {
                $check_result_label.removeClass("bg-secondary bg-success bg-danger").addClass("bg-danger");
                $check_result_label.text("오류(" + error_count + ")");
            }
            else {
                $check_result_label.removeClass("bg-secondary bg-success bg-danger").addClass("bg-success");
                $check_result_label.text("정확");
            }
        
            keepResultHtml = result_html;
            keepResultText = origin_text;
            
            tinyMCE.activeEditor.setContent(keepResultHtml);
        });
    });
    
    tinymce.activeEditor.on('keydown', function(e) {
   	 if (e.keyCode == 13) {//enter key
            $("#checkSpellbtn").click();
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
			<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#visionModal">문자 인식</button>
			<button type="button" class="btn btn-secondary" id="checkSpellbtn">맞춤법 검사 <span class="badge" id="checkResultLabel">0</span></button>
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
					<button type="button" class="btn btn-danger" id="visionBtn">맞춤법 검사</button>
				</div>
			</div>
		</form>
	</div>
</div>

