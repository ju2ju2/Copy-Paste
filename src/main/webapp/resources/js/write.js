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
	 
	      	$.each(data, function(key,value){
	      			$("#folderList").append($("<option />")
	      				.val(value.folderName)
	      				.text(value.folderName));
	      			/*  <option value="tochi" <c:if test="${Name eq 'tochi'}">selected</c:if>>또치</option> */
	   	//$('select[val=${note.subjectCode}]').prop("selected", true);		
	      	
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
	      	});
	       }
	    })
	}
	
	
	
	//드래그,note vo
	var params = {
		"keyword" : "",
		"dragNum" : "",
		"sortCategory" : ""
	}

	// 드래그 마크 중요표시
	function setDragMark(dragNum) {
		url = "../drag/setDragMark.json"
		params.dragNum = dragNum
		makeAsideDragList(url, params);
	};

	// 드래그 마크 중요표시 삭제
	function removeDragMark(dragNum) {
		url = "../drag/removeDragMark.json", params.dragNum = dragNum
		makeAsideDragList(url, params);
	};

	// 노트 드래그로 삭제
	function deleteDrag(dragNum) {
		var dragNum = dragNum;
		swal({
			title : "정말 삭제하시겠습니까?",
			text : "삭제 후에는 다시 복구 할 수 없습니다.",
			type : 'warning',
			showCancelButton : true,
			confirmButtonClass : "btn-danger btn-sm",
			cancelButtonClass : "btn btn-sm",
			confirmButtonText : '확인',
			cancelButtonText : "아니요!",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					url : "../drag/deleteDrag.json",
					dataType : "json",
					data : {
						"dragNum" : dragNum
					},
					type : "POST"
				}).done(function(result) {
					swal({
						type : "success",
						title : '성공적으로 삭제되었습니다.',
						confirmButtonClass : "btn-danger",
						closeOnConfirm : true
					}, function() {
						url = "../drag/selectAllDrag.json";
						makeAsideDragList(url);
					})
				});
			}
		});
	}

	// 드래그목록
	function makeAsideDragList(url, params){
		$.ajax({
			url : url, // url_pettern
			type : "POST",
			dataType : "json",// 서버에서 응답하는 데이터 타입(xml,json,script,html)
			data : params,
			success : function(data) {
				var a = "";
				if (data != null) {
					$
					.each(
							data,
							function(key, value) {
								$('#dragList').empty();
								a += '<div class="text-center dragDiv mt-10 dragDiv" id="'
									+ value.dragNum + '">';
								a += '<blockquote class="grapefruit">';

								a += '<!-- 별 아이콘 -->';
								a += '<div class="icon-right starDiv">	<br>';
								if (value.dragMark == 1) {
									a += '<br> <i class="fas fa-star icon-size" id="starDrag" onclick=removeDragMark("'
										+ value.dragNum
										+ '");></i>';
								} else {
									setDragMark
									a += '<br> <i class="far fa-star icon-size" id="starDrag" onclick=setDragMark("'
										+ value.dragNum
										+ '");></i>';
								}
								a += '</div>';
								a += '<!-- 모달 창 -->';
								a += '<div class="dragContent">';
								a += '<div class="drag-a">';
								a += '<div class="mt-10" class="dragText" id="dragText">'
									+ value.dragText
									+ '</div> <code>';
								a += ' <span class="Cgrapefruit" id="dragOrigin">출처 : '
									+ value.dragOrigin
									+ '</span> ';
								a += '<span id="dragDate">'
									+ value.dragDate
									+ '</span>';
								a += '</code>';
								a += '</div>';
								a += '</blockquote>';
								a += '</div>';
							})
				}

				if (data.length == 0) {
					a += "<div class='text-center'>";
					a += "<h6>등록된 드래그가 없습니다.</h6>";
					a += "</div>";
				}
				$("#dragList").html(a);
				$('.dragDiv').draggable({
					revert : true,
					revertDuration : 200,
					snapMode : "inner",
					scroll : true,
					scrollSensitivity : 100,
					scrollSpeed : 100,
					stop: function (event, ui) {
						 $( ".dragDiv" ).css("top","-140px");
		            }
		        })

			

				$("#droppable").droppable({
					activeClass : "ui-state-active",
					accept : ".dragDiv",
					drop : function(event, ui) {
						console.log("드랍이세끼;")
						var dragNum = ui.draggable.prop("id")
						deleteDrag(dragNum)
					}
				});

				// 드래그 클릭시 텍스트 에디터기에 추가
				$('.dragDiv')
				.on(
						"click",
						function() {
							var editor = tinyMCE.activeEditor;
							var dragText = $(this)
							.find('#dragText').text();
							editor.dom.add(editor.getBody(), 'p',
									{}, dragText + "<br>");
						})

			}
		})
	}

	
	
	
	
	
	
	
	
//시작	
$(document).ready(function() {
	selectSubject()
	selectFolder()
	
	var url = "";
	url = "../drag/selectAllDrag.json";
	makeAsideDragList(url);

	// 드래그 키워드 검색
	$('#search').click(function(e) {
		url = "../drag/selectByKeyDrag.json"
		params.keyword = $('#search-Text').val()
		makeAsideDragList(url, params);
	})

	// 드래그 정렬
	$('#sort-category').change(function(e) {
		url = "../drag/selectOrderbyDrag.json"
		params.sortCategory = $('#sort-category option:selected').val()
		makeAsideDragList(url, params);
	})
	
	
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	//검색택 확장 버튼 클릭시
    $('.searchBtn').click(
            function() {
               if ($('#sidebar').css('width') == '400px') {
                  $('#sidebar').css('width', '1120px');
                  $('#sidebar').addClass('col-sm-10');
                  $('.writeNoteNavSizeBtn').removeClass('fa-angle-double-right').addClass(
                              'fa-angle-double-left');
               } else {
                  $('#sidebar').css('width', '400px');
                  $('#sidebar').removeClass('col-sm-10');
                  $('.writeNoteNavSizeBtn').removeClass('fa-angle-double-left')
                        .addClass('fa-angle-double-right');
               }
            });

      $('.writeNoteNavBtn').click(
            function() {
               $('#sidebar').css('width', '400px');
               $('#sidebar').removeClass('col-sm-10');
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
  	    			var noteContent = $('#noteContent').html();
  	    			editor.dom.add(editor.getBody(), 'p', {}, data.text+ "<br>");
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
          console.log(origin_text)
          // 입력 값이 공백일 경우 처리
          if ("" == $.trim(origin_text)) {
              $('#check-result').text("");
              $check_result_label.removeClass("bg-secondary bg-success bg-danger").addClass("bg-secondary");
              $check_result_label.text("0");
              return;
          }
          
          // 맞춤법 검사
          run(origin_text, function(result_html, error_count) {
  		   
        	  console.log(result_html)
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
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
	    // 노트  드래그로 삭제
		function deleteDrag(dragNum) {
			var dragNum = dragNum;
			swal({
				 title: "정말 삭제하시겠습니까?",
				  text: "삭제 후에는 다시 복구 할 수 없습니다.",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonClass : "btn-danger btn-sm",
				  cancelButtonClass: "btn btn-sm",
				  confirmButtonText: '확인',
				  cancelButtonText: "아니요!",
				  closeOnConfirm: false
				},
				function(isConfirm){
				if(isConfirm){
					$.ajax({
						url:"../drag/deleteDrag.json",
						dataType:"json",
						data: {"dragNum":dragNum},
						type: "POST"
						}).done(function (result){
								console.log("드래그가 성공적으로 삭제됨");
								swal({type: "success",
									  title: '성공적으로 삭제되었습니다.',
						              confirmButtonClass : "btn-danger",
									  closeOnConfirm: false
								},function(){
									location.reload();
								})
						});
				}
					}
				);
			}	
		// dragDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
 	    $('.dragDiv').draggable({
 	    	revert: true, 
 	    	 revertDuration: 200,
 	    	 snapMode: "inner",
 	    	 scroll: true,
 	    	 scrollSensitivity: 100 ,
 	    	 scrollSpeed: 100
 	    	});
 	   // 노트를 드랍하여 삭제 메소드 
	    $("#droppable").droppable({
	        activeClass:"ui-state-active",
	        accept:".dragDiv",
	        drop: function(event,ui) {
	        	var dragNum = $(this).find('#dragNum').text();
	        	alert($(this).find('#dragNum').text());
	         }     
	      });  


	    //aside 드래그 목록 
		$.ajax({
			      url: "../drag/selectAllDrag.json", // url_pettern 
			      type:"POST",
			      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
			      success:function(data){
			    	  var a = "";
			        	if(data != null) {
			        		$.each(data, function(key, value){
			        			$('#dragList').empty();
			                	a += '<div class="text-center dragDiv mt-10 dragDiv" id="'+value.dragNum+'">';
			                	a += '<blockquote class="grapefruit">';
			                	
			                	a += '<!-- 별 아이콘 -->';
			                	a += '<div class="icon-right starDiv">	<br>';
			                	if(value.dragMark==1){   
			          				a += '<br> <i class="fas fa-star icon-size" id="starDrag" onclick=removeDragMark("'+value.dragNum+'");></i>';
			          			}else{	setDragMark
			          				a += '<br> <i class="far fa-star icon-size" id="starDrag" onclick=setDragMark("'+value.dragNum+'");></i>';
			          			}
			                	a += '</div>';
			            		a += '<!-- 모달 창 -->';
			            		a += '<div class="dragContent">';
			                	a += '<div class="drag-a">';
			                	a += '<div class="mt-10" class="dragText" id="dragText">'+value.dragText+'</div> <code>';
			                	a += ' <span class="Cgrapefruit" id="dragOrigin">출처 : '+value.dragOrigin+'</span> ';
			                	a += '<span id="dragDate">'+value.dragDate+'</span>';
			                	a += '</code>';
			                	a += '</div>';
			                	a += '</blockquote>';
			                	a += '</div>';		
			        		})
			        	}
			        
			        	if (data.length == 0) {
							a += "<div class='text-center'>";
							a += "<h6>등록된 드래그가 없습니다.</h6>";
							a += "</div>";
						}
						$("#dragList").html(a);
			         	$('.dragDiv').draggable({
			            	revert: true, 
			            	 revertDuration: 200,
			            	 snapMode: "inner",
			            	 scroll: true,
			            	 scrollSensitivity: 100 ,
			            	 scrollSpeed: 100
			            })
			              $("#droppable").droppable({
			            	  activeClass:"ui-state-active",
			            	  accept:".dragDiv",
			            	  drop: function(event,ui) {
			            		  var dragNum = ui.draggable.prop("id")
			            		  deleteDrag(dragNum)
			            	  }     
			              });  
			            
			            // 드래그 클릭시 텍스트 에디터기에 추가
			        	$('.dragDiv').on("click",function(){
			        		var editor = tinyMCE.activeEditor;
			    			var dragText = $(this).find('#dragText').text();
			    			editor.dom.add(editor.getBody(), 'p', {}, dragText+ "<br>");
			    		})
			      }
			 })


			//드래그 키워드 검색
			$('#search').click(function(e) {
			 
				$.ajax({
			     url: "../drag/selectByKeyDrag.json", // url_pettern 
			     type:"get",
			     data:{"keyword":$('#search-text').val()},
			     dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
			     success:function(data){
				    	  var a = "";
				        	if(data != null) {
				        		$.each(data, function(key, value){
				        			$('#dragList').empty();
				                	a += '<div class="text-center dragDiv mt-10 dragDiv" id="'+value.dragNum+'">';
				                	a += '<blockquote class="grapefruit">';
				                	
				                	a += '<!-- 별 아이콘 -->';
				                	a += '<div class="icon-right starDiv">	<br>';
				                	if(value.dragMark==1){   
				          				a += '<br> <i class="fas fa-star icon-size" id="starDrag" onclick=removeDragMark("'+value.dragNum+'");></i>';
				          			}else{	setDragMark
				          				a += '<br> <i class="far fa-star icon-size" id="starDrag" onclick=setDragMark("'+value.dragNum+'");></i>';
				          			}
				                	a += '</div>';
				            		a += '<!-- 모달 창 -->';
				            		a += '<div class="dragContent">';
				                	a += '<div class="drag-a">';
				                	a += '<div class="mt-10" class="dragText" id="dragText">'+value.dragText+'</div> <code>';
				                	a += ' <span class="Cgrapefruit" id="dragOrigin">출처 : '+value.dragOrigin+'</span> ';
				                	a += '<span id="dragDate">'+value.dragDate+'</span>';
				                	a += '</code>';
				                	a += '</div>';
				                	a += '</blockquote>';
				                	a += '</div>';		
				        		})
				        	}
				        
				        	if (data.length == 0) {
								a += "<div class='text-center'>";
								a += "<h6>등록된 드래그가 없습니다.</h6>";
								a += "</div>";
							}
							$("#dragList").html(a);
				         	$('.dragDiv').draggable({
				            	revert: true, 
				            	 revertDuration: 200,
				            	 snapMode: "inner",
				            	 scroll: true,
				            	 scrollSensitivity: 100 ,
				            	 scrollSpeed: 100
				            })
				              $("#droppable").droppable({
				            	  activeClass:"ui-state-active",
				            	  accept:".dragDiv",
				            	  drop: function(event,ui) {
				            		  var dragNum = ui.draggable.prop("id")
				            		  deleteDrag(dragNum)
				            	  }     
				              });  
				            
				            // 드래그 클릭시 텍스트 에디터기에 추가
				        	$('.dragDiv').on("click",function(){
				        		var editor = tinyMCE.activeEditor;
				    			var dragText = $(this).find('#dragText').text();
				    			editor.dom.add(editor.getBody(), 'p', {}, dragText+ "<br>");
				    		})
				      }
				 })
			})
			
			//드래그 정렬 
			$('#sort-category').on("change",function(e) {
			
				$.ajax({
			     url: "../drag/selectOrderbyDrag.json", // url_pettern 
			     type:"post",
			     data:{"sortCategory":$('#sort-category option:selected').val()},
			     dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
			     success:function(data){
				    	  var a = "";
				        	if(data != null) {
				        		$.each(data, function(key, value){
				        			$('#dragList').empty();
				                	a += '<div class="text-center dragDiv mt-10 dragDiv" id="'+value.dragNum+'">';
				                	a += '<blockquote class="grapefruit">';
				                	
				                	a += '<!-- 별 아이콘 -->';
				                	a += '<div class="icon-right starDiv">	<br>';
				                	if(value.dragMark==1){   
				          				a += '<br> <i class="fas fa-star icon-size" id="starDrag" onclick=removeDragMark("'+value.dragNum+'");></i>';
				          			}else{	setDragMark
				          				a += '<br> <i class="far fa-star icon-size" id="starDrag" onclick=setDragMark("'+value.dragNum+'");></i>';
				          			}
				                	a += '</div>';
				            		a += '<!-- 모달 창 -->';
				            		a += '<div class="dragContent">';
				                	a += '<div class="drag-a">';
				                	a += '<div class="mt-10" class="dragText" id="dragText">'+value.dragText+'</div> <code>';
				                	a += ' <span class="Cgrapefruit" id="dragOrigin">출처 : '+value.dragOrigin+'</span> ';
				                	a += '<span id="dragDate">'+value.dragDate+'</span>';
				                	a += '</code>';
				                	a += '</div>';
				                	a += '</blockquote>';
				                	a += '</div>';		
				        		})
				        	}
				        
				        	if (data.length == 0) {
								a += "<div class='text-center'>";
								a += "<h6>등록된 드래그가 없습니다.</h6>";
								a += "</div>";
							}
							$("#dragList").html(a);
				         	$('.dragDiv').draggable({
				            	revert: true, 
				            	 revertDuration: 200,
				            	 snapMode: "inner",
				            	 scroll: true,
				            	 scrollSensitivity: 100 ,
				            	 scrollSpeed: 100
				            })
				              $("#droppable").droppable({
				            	  activeClass:"ui-state-active",
				            	  accept:".dragDiv",
				            	  drop: function(event,ui) {
				            		  var dragNum = ui.draggable.prop("id")
				            		  deleteDrag(dragNum)
				            	  }     
				              });  
				            
				            // 드래그 클릭시 텍스트 에디터기에 추가
				        	$('.dragDiv').on("click",function(){
				        		var editor = tinyMCE.activeEditor;
				    			var dragText = $(this).find('#dragText').text();
				    			editor.dom.add(editor.getBody(), 'p', {}, dragText+ "<br>");
				    		})
				      }
				 })
			})














//끝      
})

