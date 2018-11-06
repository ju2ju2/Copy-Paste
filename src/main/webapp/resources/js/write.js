/*
@JS : write.js
@Date : 2018.10.24
@Author : 우나연
@Desc : note.js 스크립트
*/



//회원의 폴더목록  조회 및 옵션추가 
	function selectSubject(){
		$.ajax({
	      url: "../folder/selectAllFolder.json", // url_pettern 
	      type:"POST",
	      dataType:"json",
	      success:function(data){
	    		console.log(data)
	      	$.each(data, function(key,value){
	      			$("#folderList").append($("<option />")
				      				.val(value.folderName)
				      				.text(value.folderName) );
			      	//노트 작성시 폴더 기본폴더로 지정
			    	if(value.defaultFolder==1){
			      		$("#folderList > option[value="+value.defaultFolder+"]").attr("selected", "selected");
			      	}
	
			      	//수정시 note의  db폴더값 선택된 것으로 표시
			      	var selFolderName=$('#selfolderName').val();
				    if (selFolderName!=''){
				      	$("#folderList > option[value="+selFolderName+"]").attr("selected", "selected");
				    }
	      	
	      	})
	       }
	    })
	}
	
	//노트 주제 조회 및 옵션추가 
	function selectFolder(){
		$.ajax({
	      url: "../note/selectSubjectCode.json", // url_pettern 
	      type:"POST",
	      dataType:"json",
	      success:function(data){
	      	$.each(data, function(key,value){
	      			$("#subjectList").append($("<option />")
	      				.val(value.subjectCode)
	      				.text(value.subjectName) );
	      			//노트 작성시 회사를 기본 주제로 지정
	      			$("#subjectList > option[value='SJ01']").attr("selected", "selected");
	      		 	//수정시 note의  db폴더값 선택된 것으로 표시
			      	var selSubjectCode=$('#selSubjectCode').val();
				    if (selSubjectCode!=''){
				      	$("#subjectList > option[value="+selSubjectCode+"]").attr("selected", "selected");
				    }
	      	});
	       }
	    })
	}
	

	function selectNotePublic(){
		$('input:radio[name=notePublic]:input[value=0]').attr("checked", true);
		
		var selNotePublic=$('#selNotePublic').val();
	    if (selNotePublic!=''){
	      	$('input:radio[name=notePublic]:input[value=' + selNotePublic + ']').attr("checked", true);
	    }
	}
	
	
	//드래그,note vo
	var params = {
		"keyword" : "",
		"dragNum" : "",
		"sortCategory" : "",
		 "page": 0
	}

	
//시작	
$(document).ready(function() {
	selectSubject()
	selectFolder()
 	selectNotePublic()
	
	//등록 수정 버튼 클릭시
	function insertOrUpdateNote(url,msg){
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
	      url: url, // url_pettern 
	      type:"POST",
	      dataType:"json",
	      data: {'noteNum':$("#noteNum").val(),
	    	 	 'noteTitle':$("#noteTitle").val(),
	    	 	 'noteContent':tinymce.get('noteContent').getContent(),
	    	 	 'folderName':$("#folderList").val(),
	    	 	 'subjectCode':$("#subjectList").val(),
	    	 	 'notePublic':$("input[name='notePublic']:checked").val()
	     		 },	
	      success:function(result){
	    	    	  swal({type: "success",
	    				  title: '성공적으로 '+msg+'되었습니다.',
	    	              confirmButtonClass : "btn-danger",
	    				  closeOnConfirm: false
	    			},
	    			function(){
	    				location.href="../note/note.htm";
	    			});	
	    	       },
	       error:function(request,status,error){
	    	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	  }
	
	     		 
	    })
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	//노트 수정 실행
	$('#updateNoteBtn').click(function() {
		var url = "../note/updateNote.json"
		var msg = "수정";
		insertOrUpdateNote(url,msg);
	})

	//노트 작성 & 다른 노트이용해 새노트 작성
	$('#insertNoteBtn').click(function() {
		var url = "../note/insertNote.json"
		var msg = "등록";
		insertOrUpdateNote(url,msg);
	})
	
	
	//검색탭 확장 버튼 클릭시
    $('.searchBtn').click(
            function() {
               if ($('#sidebar').css('width') == '400px') {
                  $('#sidebar').css('width', '1120px');
                  $('.fa-angle-double-left').css('color','#fff');
                  $('#search-text-write').css('width', '90%');
                  $('#sidebar').addClass('col-sm-10');
                  $('.writeNoteNavSizeBtn').removeClass('fa-angle-double-right').addClass(
                              'fa-angle-double-left');
                 
               } else {
                  $('#sidebar').css('width', '400px');
                  $('#sidebar').removeClass('col-sm-10');
                  $('#search-text-write').css('width', '80%');
                  $('.fa-angle-double-left').css('color','#fff');
                  $('.writeNoteNavSizeBtn').removeClass('fa-angle-double-left')
                        .addClass('fa-angle-double-right');
               }
            });

      $('.writeNoteNavBtn').click(
            function() {
               $('#sidebar').css('width', '400px');
               $('#sidebar').removeClass('col-sm-10');
               $('.fa-angle-double-left').css('color','#fff');
               $('.writeNoteNavSizeBtn').removeClass('fa-angle-double-left')
                        .addClass('fa-angle-double-right');
            });
      
     
  


      
      
      
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
  					var nString= data.text.replace(/\n/g, "<br>");
  	    			editor.dom.add(editor.getBody(), 'p', {}, nString + "<br>");
  	    	
  			}).fail(function(request,status,error){
  	    	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  			});

  	})
  	
  	
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
      var result_html;
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
  //끝   
})
      
