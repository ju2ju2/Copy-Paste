/* 폴더 삭제 */
function folderDelete(folderName, defaultFolder){
	if(defaultFolder==1){
		swal({
			  title: "기본 폴더는 삭제할 수 없습니다.",
			  text: "",
			  type: "info",
			  confirmButtonClass: "btn-danger",
			  confirmButtonText: "OK",
			  showCancelButton: false
			})
	}else{
		swal({
			  title: "폴더를 삭제하시겠습니까?",
			  text: "",
			  type: "warning",
			  confirmButtonClass: "btn-danger",
			  confirmButtonText: "OK",
			  showCancelButton: true
			},
			function(isConfirm) {
			  if (isConfirm) {
				  $.ajax(
							{
					    url : "../folder/deletefolder.json",
					    type : "post",
					    data : {"folderName": folderName},
					    success : function(data){
					    	location.reload();
					    },
					    error : function(){
					    	swal({
								  title: "폴더 삭제에 실패하였습니다",
								  text: "",
								  type: "error",
								  confirmButtonClass: "btn-danger",
								  confirmButtonText: "OK",
								  showCancelButton: true
								});
					    }
							});
			  }
			});
	}
	
}

/* 폴더 수정 */
function folderEdit(fedit, folderName, count){
	var a = "";
	a += "<h5 class='ml-10 f-name'>";
	a += "<span class='f-count'>";
	a += count;
	a += "</span>";
	a += "<input type='text' id='folname' required minlength='1' maxlength='8' style='width:200px;height:40px;margin-left:25px;margin-top:-25px;' placeholder=";
	a += folderName;
	a += " autofocus/ >";
	a += "</h5>";
	$(fedit).closest('h5').replaceWith(a);

	/* 엔터키 → 폴더명 수정 */
	$("#folname").keypress(function(key){
		if(key.keyCode == 13){
			 {
				$.ajax(
							{
					    url : "../folder/updatefolder.json",
					    DataType :"text",
					    type : "post",
					    data : {"beforefolderName": folderName,
					    		"folderName" : $(this).val(),
					    		"count" : count},
					    success : function(data){
					    	location.reload();
					    },
					    error : function(){
					    	swal({
								  title: "폴더 수정에 실패하였습니다",
								  text: "",
								  type: "warning",
								  confirmButtonClass: "btn-danger",
								  confirmButtonText: "OK",
								  showCancelButton: true
								});
					   		 }
						});
				}
					
		}
	 });
}

/* 디폴트폴더 설정 */
function setDefaultFolder(bookmark, folderName){

 /* 스크랩 아이콘 토글 
	fas → 디폴트 폴더 O
	far → 디폴트 폴더 X
 $('.fa-bookmark').click(function() {
		if ($(this).hasClass('far')) {
			    	$('.fa-bookmark').removeClass('fas').addClass('far');
        			$(this).removeClass('far').addClass('fas');	
			    }
	});   */
	 
	$.ajax(
			{
	    url : "../folder/setDefaultFolder.json",
	    DataType :"text",
	    type : "post",
	    data : {"beforefolderName": $('#bookmarkO').text(),
	    		"folderName" : folderName},
	    success : function(data){
	    	location.reload();
	    },
	    error : function(){
	    	swal({
				  title: "폴더 수정에 실패하였습니다",
				  text: "",
				  type: "warning",
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "OK",
				  showCancelButton: true
				});
	    }
			});	 
		
	}

/* 드래그로 노트 삭제 */
		function deleteNote(noteNum) {
			var noteNum = noteNum;
		
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
				function(){
					$.ajax({
						url:"../note/deleteNote.json",
						dataType:"json",
						data: {"noteNum":noteNum},
						type: "POST"
						}).done(function (result){
								swal({type: "success",
									  title: '성공적으로 삭제되었습니다.',
						              confirmButtonClass : "btn-danger",
									  closeOnConfirm: false
								},function(){
									location.reload()
						})
					});
				}
			);
		}	 


/* 폴더에 들어있는 콘텐츠 뿌리기 */
function folderContents(folder,folderName){
	$.ajax(
			{
	    url : "../note/selectByFolderNote.json",
	    DataType :"json",
	    type : "post",
	    data : {"folderName" : folderName},
	    success : function(data){
	    	 if(data != null) {
		      		var b = "";
		      		var c = "";
		      		$.each(data, function(key, value){
			      		$('#droppable').empty();
			      		c+='<header class="major">';
			      		c+='<h3 id="fName">';
		      			c+=value.folderName
		      			c+='<i class="fas fa-trash icon-size"></i>';
		      			c+='</h3>';
		      			$('#droppable').append(c);
		      			c="";
		      			$('#noteList').empty();	
		      			b+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
		      			b+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
		      			b+='	<!-- a HTML (to Trigger Modal) -->';
		      			b+='<a data-toggle="modal"';
		      			b+='href="../note/noteDetail.htm?noteNum='+value.noteNum+'"';
		      			b+='data-target="#modal-testNew" role="button" data-backdrop="static">';
		      			b+='<div class="item">';
		      			b+='<img class="img-rounded"';
		      			b+='src="'+value.noteThumnail+'"';
		      			b+='alt="'+value.noteTitle+'" width="100%">';
		      			b+='<div class="caption">';
		      			b+='<i class="fa fa-plus" aria-hidden="true"></i>';
		      			b+='</div>';
		      			b+='</div>';
		      			b+='<div>';
		      			b+='<h4>'+value.noteTitle+'</h4>';
		      			b+='<strong>'+value.userNick+'</strong><span>'+value.noteDate+'</span>';
		      			b+='</div>';
		      			b+='</a>';
		      			b+='</div>';
		      			b+='</div>';
		      			/* $("div[alt='"+value.folderName+"']").find("#foldernoteList").html(b); */
		      			$('#noteList').append(b);
		      		});

		      	}
	    },
	    error : function(){
	    	swal({
				  title: "폴더 내용을 가져오는데 실패했습니다.",
				  text: "",
				  type: "warning",
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "OK",
				  showCancelButton: true
					});
			    }
			}).done(function (result){
	  		  // noteDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
	    	    $('.noteDiv').draggable({
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
	    	        accept:".noteDiv",
	    	        drop: function(event,ui) {
	    	        	var noteNum = ui.draggable.prop("id");
	    	        	deleteNote(noteNum)
	    	         }     
	    	      });  
	        })
	}

//노트 키워드 검색
$('#search').click(function(e) {
   
 	$.ajax({
       url: "../note/selectByKeyNote.json", // url_pettern 
       type:"get",
       data:{"keyword":$('#search-Text').val()},
       dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
 	   success:function(data){
	    var noteList ="";   	    
  	if(data != null) {
  		$.each(data, function(key, value){
  			$('#noteList').empty();
  			noteList+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
  			noteList+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
  			noteList+='	<!-- a HTML (to Trigger Modal) -->';
  			noteList+='<a data-toggle="modal"';
  			noteList+='href="../note/noteDetail.htm?noteNum='+value.noteNum+'"';
  			noteList+='data-target="#modal-testNew" role="button" data-backdrop="static">';
  			noteList+='<div class="item">';
  			noteList+='<img class="img-rounded"';
  			noteList+='src="'+value.noteThumnail+'"';
  			noteList+='alt="'+value.noteTitle+'" width="100%">';
  			noteList+='<div class="caption">';
  			noteList+='<i class="fa fa-plus" aria-hidden="true"></i>';
  			noteList+='</div>';
  			noteList+='</div>';
  			noteList+='<div>';
  			noteList+='<h4>'+value.noteTitle+'</h4>';
  			noteList+='<strong>'+value.userNick+'</strong><span>'+value.noteDate+'</span>';
  			noteList+='</div>';
  			noteList+='</a>';
  			noteList+='</div>';
  			noteList+='</div>';
  			$("#noteList").html(noteList);
  		})
  	}
  },error : function(){
	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  }
    
       
       }).done(function (result){
 		  // dragDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
      	    $('.dragDiv').draggable({
      	    	revert: true, 
      	    	 revertDuration: 200,
      	    	 snapMode: "inner",
      	    	 scroll: true,
      	    	 scrollSensitivity: 100 ,
      	    	 scrollSpeed: 100
      	    	});
      	     // 드래그를 드랍하여 삭제 메소드 
      	    $("#droppable").droppable({
      	        activeClass:"ui-state-active",
      	        accept:".dragDiv",
      	        drop: function(event,ui) {
      	        	var dragNum = ui.draggable.prop("id")
      	        	deleteDrag(dragNum)
      	         }     
      	      });  
       })
})


/* 날짜 별 검색 */
$("#toDate").change(function() {
	if($("#fromDate").val()!="" && $("#toDate").val()!=""){
		 $.ajax(
		         {
		            url : "../note/selectByCalNote.json",
		            type : "get",
		            DataType :"json",
		            data : {"fromDate": $("#fromDate").val(),
		                 	"toDate" :  $("#toDate").val()
		                 	},
		            success : function(data){
		                var notecal ="";
		                 if(data != null) {
		                    $.each(data, function(key, value){
		                       $('#noteList').empty();
		                       notecal+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
		                       notecal+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
		                       notecal+='   <!-- a HTML (to Trigger Modal) -->';
		                       notecal+='<a data-toggle="modal"';
		                       notecal+='href="../note/noteDetail.htm?noteNum='+value.noteNum+'"';
		                       notecal+='data-target="#modal-testNew" role="button" data-backdrop="static">';
		                       notecal+='<div class="item">';
		                       notecal+='<img class="img-rounded"';
		                       notecal+='src="'+value.noteThumnail+'"';
		                       notecal+='alt="'+value.noteTitle+'" width="100%">';
		                       notecal+='<div class="caption">';
		                       notecal+='<i class="fa fa-plus" aria-hidden="true"></i>';
		                       notecal+='</div>';
		                       notecal+='</div>';
		                       notecal+='<div>';
		                       notecal+='<h4>'+value.noteTitle+'</h4>';
		                       notecal+='<strong>'+value.userNick+'</strong><span>'+value.noteDate+'</span>';
		                       notecal+='</div>';
		                       notecal+='</a>';
		                       notecal+='</div>';
		                       notecal+='</div>';
		                       
		                       $("#noteList").html(notecal);
		                    })
		                 }
		               
		                  
		                  },
		            error : function(){
		            	
		              swal({
		                    title: "해당 기간에 존재하는 게시물이 없습니다.",
		                    text: "",
		                    type: "info",
		                    confirmButtonClass: "btn-danger",
		                    confirmButtonText: "OK",
		                    showCancelButton: false
		                  }) 
		            }
		      });  
	}
	  
 	}) 
	

	$(document).ready(function() {
		folderlist();
		
		/* 노트 폴더 리스트 */
		function folderlist(){
			$.ajax({
		        url : "../folder/selectAllFolder.json",
		        type : "post",
		        dataType : "json",
		        success : function(data){
		        	var unclassified = "";
		        	var scrap="";
		        	var folder="";
		        	
					if(data != null) {
		        		$.each(data, function(key, value){
		        			/* 일반 폴더 출력 */
		        			if ((value.folderName).trim()!='미분류'&&(value.folderName).trim()!='스크랩'){
								folder += "<div class='col-xs-10 n-folder'>";
								folder += "<h5 class='ml-10 f-name'>";
								folder += "<span class='f-count'>";
								folder += value.count
								folder += "</span>";
								folder += "<span class='f-name'><a href='#' onclick=folderContents(this,'"+value.folderName+"')>";
								folder += value.folderName+"</a></span>";
								folder += "<span class='f-modify' id='modify'>";
								folder += "<i class='fas fa-edit icon-size' id='folderEdit' onclick=folderEdit(this,'"+value.folderName+"','"+value.count+"')>";
								folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
								folder += "<i class='fas fa-trash icon-size' id='folderdelete' onclick=folderDelete('"+value.folderName+"','"+value.defaultFolder+"');>";
								folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
								$('#folder').append(folder);
								if(value.defaultFolder==1){
									folder = "";
									folder += "<div class='col-xs-2 icon'><i class='fas fa-bookmark icon-size' id='bookmarkO' onclick=setDefaultFolder(this,'"+value.folderName+"');>";
									folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></div>";
									$('#folder').append(folder);
									
								}else{
									folder = "";
									folder += "<div class='col-xs-2 icon'><i class='far fa-bookmark icon-size' id='bookmarkX' onclick=setDefaultFolder(this,'"+value.folderName+"');>";
									folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></div>";
									$('#folder').append(folder);
									
								}
								folder="";
							} 
		        			/* 미분류 폴더 출력 */
		        			if(value.folderName == "미분류"){
								$('#unclassified').empty();
								unclassified += "<div class='col-xs-10 n-folder'>";
								unclassified += "<h5 class='ml-10 f-name'>";
								unclassified += "<span class='f-count'>";
								unclassified += value.count
								unclassified += "</span>";
								unclassified += "<span class='f-name'><a href='#' onclick=folderContents(this,'"+value.folderName+"')>";
								unclassified += value.folderName+"</a></span>";
								unclassified += "<span class='f-modify' id='modify'>";
								unclassified += "<i class='fas fa-edit icon-size' id='folderEdit' style='display: none;' onclick=folderEdit(this,'"+value.folderName+"')>";
								unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
								unclassified += "<i class='fas fa-trash icon-size' id='folderdelete' style='display: none;' onclick=folderDelete('"+value.folderName+"','"+value.defaultFolder+"');>";
								unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
								$('#unclassified').append(unclassified);
								
								if(value.defaultFolder==1){
									unclassified = "";
									unclassified += "<div class='col-xs-2 icon'><i class='fas fa-bookmark icon-size' id='bookmarkO' onclick=setDefaultFolder(this,'"+value.folderName+"');>";
									unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></div>";
									$('#unclassified').append(unclassified);
									unclassified = "";
								}else{
									unclassified = "";
									unclassified += "<div class='col-xs-2 icon'><i class='far fa-bookmark icon-size' id='bookmarkX' onclick=setDefaultFolder(this,'"+value.folderName+"');>";
									unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></div>";
									$('#unclassified').append(unclassified);
									unclassified = "";
								}
								unclassified="";
							} 
		        			
		        			if (value.folderName=="스크랩"){
								$('#scrap').empty();
								scrap += "<div class='col-xs-10 n-folder'>";
								scrap += "<h5 class='ml-10 f-name'>";
								scrap += "<span class='f-count'>";
								scrap += value.count
								scrap += "</span>";
								scrap += "<span class='f-name'><a href='#' onclick=folderContents(this,'"+value.folderName+"')>";
								scrap += value.folderName+"</a></span>";
								scrap += "<span class='f-modify' id='modify'>";
								scrap += "<i class='fas fa-edit icon-size' id='folderEdit' style='display: none;' onclick=folderEdit(this,'"+value.folderName+"')>";
								scrap += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
								scrap += "<i class='fas fa-trash icon-size' id='folderdelete' style='display: none;' onclick=folderDelete('"+value.folderName+"');>";
								scrap += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
								scrap += "<div class='col-xs-2 icon'><i class='far fa-bookmark icon-size' style='display: none;'></i></div>";						
								$('#scrap').append(scrap);
								scrap="";
							} 
						});
		       		}

		        	/* 폴더 수정 및 삭제 아이콘 토글 */
		        	$(this).find('.f-modify').hide();
		        	$('.n-folder').mouseenter(function() {
		        		$(this).find('.f-modify').show();
		        	});
		        	$('.n-folder').mouseleave(function() {
		        		$(this).find('.f-modify').hide();
		        	});
		        
		        },
		        error:function(request,status,error)
		        { alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			    }).done(function (result){
			  		  // noteDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
		    	    $('.noteDiv').draggable({
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
		    	        accept:".noteDiv",
		    	        drop: function(event,ui) {
		    	        	var noteNum = ui.draggable.prop("id")
		    	        	deleteNote(noteNum)
		    	         }     
		    	      });  
		        
		        
		        })
	
		
		/* 폴더 추가 버튼 클릭 → 텍스트 박스 열림 */
		$('#Addfolder').click(function(){
			var a = "";
			a += "<div class='row'>";
			a += "<div class='col-xs-10 n-folder'>";
			a += "<h5 class='ml-10 f-name'>";
			a += "&ensp;&ensp;<span class='f-count'style='margin-left:-1px;'>0</span>";
			a += "<input type='text' id='folname' required minlength='1' maxlength='12' style='width:200px;height:40px;margin-left:44px;margin-top:-25px;'placeholder='폴더명을 입력하세요' autofocus/>";
			a += "</h5></div>";
			a += "<div class='col-xs-2 icon'>";
			a += "<i class='far fa-bookmark icon-size' style='margin-left:11px;'></i>";
			a += "</div></div>";
			$('#scrap:last-child').append(a);
			/* 엔터 → 폴더 생성 */
			$("#folname").keypress(function(key){
				if(key.keyCode == 13){
					$(this).remove();
		            var a = "";
		                a += "<div class='row'>";
		                a += "<div class='col-xs-10 n-folder'>";
		                a += "<h5 class='ml-10 f-name' id='folname'>";
		                a += "&ensp;&ensp;<span class='f-count' id='juwon' style='margin-left:-1px;'>0</span>";
		                a += "<span class='f-name' id='fname'>";
		                a += $(this).val();
		                a += "</span>"
		                a += "<span class='f-modify'>";
		                a += "<i class='fas fa-edit icon-size'></i>" 
		                a += "<i class='fas fa-trash icon-size'></i></span>"
		                a += "</h5></div>";
		                a += "<div class='col-xs-2 icon'>";
		                a += "<i class='far fa-bookmark icon-size' style='margin-left:11px;'></i>";
		                a += "</div></div>"; 
		                $('#folder:last-child').append(a);

							$.ajax(
									{
							    url : "../folder/insertfolder.json",
							    DataType :{},
							    type : "post",
							    data : {"folderName": $(this).val()},
							    success : function(data){
							    		location.reload();
							    },
							    error : function(){
							    	swal({
										  title: "이미 존재하는 폴더명입니다.",
										  text: "",
										  type: "info",
										  confirmButtonClass: "btn-danger",
										  confirmButtonText: "OK",
										  showCancelButton: false
										})
							    }
									});	 
				}	
			 });
		});
	}
		
	});