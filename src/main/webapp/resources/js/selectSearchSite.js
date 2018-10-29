//드래그 중요표시 설정
	function setDragMark(dragNum){
	      $.ajax({
		  
		    url : "../drag/setDragMark.json",
		    DataType :"json",
		    type : "post",
		    data : { "dragNum" : dragNum},
		    success : function(data){
	      console.log("데이터 가지고 오는건지");
		  	location.reload();
		     }	
		 });
	};
	//드래그 마크 중요표시 삭제
	function removeDragMark(dragNum) {
	      $.ajax({
			    url : "../drag/removeDragMark.json",
			    DataType :"json",
			    type : "post",
			    data : { "dragNum" : dragNum},
			    success : function(data){
		      console.log("데이터 가지고 오는건지");
			  	location.reload();
			     }	
			 });
	};

	
$(function() {
	// 드래그 삭제
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
	
	//드래그 키워드 검색
	$('#searchdrag').click(function(e) {
	   alert("끼요옹");
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
		                	a += '<p class="mt-10" class="dragText" id="dragText">'+value.dragText+'</p> <code>';
		                	a += '&lt;출처 : <span class="Cgrapefruit">'+value.dragOrigin+'</span>&gt; ';
		                	a += '<span>'+value.dragDate+'</span>';
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
		                	a += '<p class="mt-10" class="dragText" id="dragText">'+value.dragText+'</p> <code>';
		                	a += '&lt;출처 : <span class="Cgrapefruit">'+value.dragOrigin+'</span>&gt; ';
		                	a += '<span>'+value.dragDate+'</span>';
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
		                	a += '<p class="mt-10" class="dragText" id="dragText">'+value.dragText+'</p> <code>';
		                	a += '&lt;출처 : <span class="Cgrapefruit">'+value.dragOrigin+'</span>&gt; ';
		                	a += '<span>'+value.dragDate+'</span>';
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
		      }
		 })
	
	
	
	$("#searchinsite").click(function(){
		if($("#searchinsite-text").val()==''){
			swal({
				  title: "검색어를 입력해주세요",
				  text: "",
				  type: "warning",
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "OK",
				  showCancelButton: false
				})
		}else{
			 $.ajax(
						{
				    url : "../etc/selectSearchSite.json",
				    type : "get",
				    data : {"keyword":$("#searchinsite-text").val(),
				    		"subjectCategory":$('#subject-category option:selected').val(),
				    		"boundary":$('input[name="demo-priority"]:checked').val()
				    },
				    dataType : 'json',
				    success : function(data){
				    		 var search = "";
					          	if(data!=null) {
					          		$.each(data, function(key, value){
					          			$("#searchList").empty();
					          			search+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
					          			search+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
					          			search+='	<!-- a HTML (to Trigger Modal) -->';
					          			search+='<a data-toggle="modal"';
					          			search+='href="../note/noteDetail.htm?noteNum='+value.noteNum+'"';
					          			search+='data-target="#modal-testNew" role="button" data-backdrop="static">';
					          			search+='<div class="item">';
					          			search+='<img class="img-rounded"';
					          			search+='src="'+value.noteThumnail+'"';
					          			search+='alt="'+value.noteTitle+'" width="100%">';
					          			search+='<div class="caption">';
					          			search+='<i class="fa fa-plus" aria-hidden="true"></i>';
					          			search+='</div>';
					          			search+='</div>';
					          			search+='<div>';
					          			search+='<h4>'+value.noteTitle+'</h4>';
					          			search+='<strong>'+value.userEmail+'</strong><span>'+value.noteDate+'</span>';
					          			search+='</div>';
					          			search+='</a>';
					          			search+='</div>';
					          			search+='</div>';
					          				
					          		})
					          	}
					          	
					          	if(data.length == 0){
					          		$("#searchList").empty();
					          		search += "<div class='text-center noteDiv'>";
					          		search += "<h3>검색된 결과가 없습니다.</h3>";
					          		search += "</div>";
								}
					          	
					          	$("#searchList").html(search);	
				    	
				          	
				    },
				    error : function(){
				    	alert("검색 실패");
				    }
						})
		}
		
	});

	
	
// 드래그 저장
$(document).mouseup(function(event){
	event.preventDefault(); 
	event.stopPropagation(); 
	
     var selection = window.getSelection();
	 var text = selection.toString();
	 
	 // 드래그 텍스트 공백인지 앞의 드래그와 중복되는지 체크
	 if (text !='' && text.length > 1 && $.trim(text).length != 0 && prevText != text) {
		 // 드래그 저장
		var dragfd = new FormData();
		
		dragfd.append("dragOrigin","copyNpaste");
		dragfd.append("dragText", text);
		$.ajax({
			url : "../drag/insertDrag.json",
			type:"POST",
			data :dragfd,
			dataType : "json",
			processData: false,
			contentType:false
		})
		.done(function (result) {
			swal({
				type : "success",
				title : '드래그가 저장되었습니다.',
				confirmButtonClass : "btn-danger",
				closeOnConfirm : false
			}, function() {
				location.reload();
				
			});
			
			prevText = text;
		})
		
		return false;
	 }	
 });

})