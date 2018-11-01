




		// 스크롤 내렸을때 top보이고 안내리면 안보임
			window.onscroll = function() {scrollFunction()};
			function scrollFunction() {
			    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			        document.getElementById("myBtn").style.display = "block";
			    } else {
			        document.getElementById("myBtn").style.display = "none";
			    }
			}

			// top버튼 눌렀을때 실행
			function topFunction() {
			    document.body.scrollTop = 0;
			    document.documentElement.scrollTop = 0;
			}











$(function() {
	// 노트  드래그로 삭제
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



    //노트목록
	var page=0;
	var i=1;	
$.ajax({
  url: "selectAllNote.json", // url_pettern 
  type:"POST",
  dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
  success:function(data){
	  var a = "";
    	if(data != null) {
    		$.each(data, function(key, value){
    			$('#noteList').empty();
    			a+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ">';
    			a+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
    			a+='	<!-- a HTML (to Trigger Modal) -->';
    			a+='	<a data-toggle="modal"';
    			a+='		href="../note/noteDetail.htm?noteNum='+value.noteNum+'&cmd=mynote"';
    			a+='		data-target="#modal-testNew" role="button" data-backdrop="static">';
    			a+='		<div class="item">';
    			a+='			<img class="img-rounded"';
    			a+='				src="'+value.noteThumnail+'"';
    			a+='					alt="${noteList.noteTitle}" width="100%">';
    			a+='			 <div class="caption">';
    			a+='				<i class="fa fa-plus" aria-hidden="true"></i>';
    			a+='			</div> ';
    			a+='		</div>';
    			a+='		<div>';
    			a+='		<input type="hidden" id="noteNum" class="noteNum" value="'+value.noteNum+'">';
    			a+='			<h4>'+value.noteTitle+'</h4>';
    			a+='			<strong>'+value.userNick+'</strong> <span> '+value.noteDate+'</span>';
    			a+='	</div>';
    			a+='	</a>';
    			a+='	</div>';
    			a+='</div>';
		
		
    			$("#noteList").html(a);
    		})
    		console.log(i + "노트회차: " + page);
    	}
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
	        	var noteNum = ui.draggable.prop("id")
	        	deleteNote(noteNum)
	         }     
	      });  
   
	    // 스크롤이벤트 발생시 추가 12개 
	    var lastScrollTop = 0;
    	page += 12; //2회차
		$(window).scroll(function(event){ 
			event.stopPropagation(); 
			
			// ① 스크롤 이벤트 최초 발생
	        var currentScrollTop = $(window).scrollTop();
	      
	        
	        if( currentScrollTop - lastScrollTop > 0 ){
	            if ($(window).scrollTop() >= ($(document).height() - $(window).height()) ){ 
	      
		            	$.ajax({
		                    type : 'post',  
		                    url :'../note/infiniteScrollNote.json',
		       		        async: false,
		                    data : { page: page },
		                    beforeSend: function(){
		                    	i++
		                    	console.log(i + "회차: " + page); 
		                    },
		                    success : function(data){
		                   
		                   console.log(data)
	                        var a = "";
	                        var a1 = "";
	                        if(data != null) {
	                    		$.each(data, function(key, value){
	                    			a1="";
	                    			a1+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ">';
	                    			a1+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
	                    			a1+='	<!-- a HTML (to Trigger Modal) -->';
	                    			a1+='	<a data-toggle="modal"';
	                    			a1+='		href="../note/noteDetail.htm?noteNum='+value.noteNum+'&cmd=mynote"';
	                    			a1+='		data-target="#modal-testNew" role="button" data-backdrop="static">';
	                    			a1+='		<div class="item">';
	                    			a1+='			<img class="img-rounded"';
	                    			a1+='				src="'+value.noteThumnail+'"';
	                    			a1+='					alt="${noteList.noteTitle}" width="100%">';
	                    			a1+='			 <div class="caption">';
	                    			a1+='				<i class="fa fa-plus" aria-hidden="true"></i>';
	                    			a1+='			</div> ';
	                    			a1+='		</div>';
	                    			a1+='		<div>';
	                    			a1+='		<input type="hidden" id="noteNum" class="noteNum" value="'+value.noteNum+'">';
	                    			a1+='			<h4>'+value.noteTitle+'</h4>';
	                    			a1+='			<strong>'+value.userNick+'</strong> <span> '+value.noteDate+'</span>';
	                    			a1+='	</div>';
	                    			a1+='	</a>';
	                    			a1+='	</div>';
	                    			a1+='</div>';
	            			
	                    			$("#noteList").append(a1);
	                        })
						    page += 12;
	                    	i += 1;
	                    	console.log(i + "노트회차: " + page);
	 
	                    }
	                   }
		            });
	            } 
	         }
		})
  })

	
	
    //노트 키워드 검색
	 $('#search').click(function(e) {
	
	  	$.ajax({
	        url: "../note/selectByKeyNote.json", // url_pettern 
	        type:"get",
	        data:{"keyword":$('#search-text').val()},
	        dataType:"json",
	        success:function(data){
	        	
	      	  var a = "";
	          	if(data !=null) {
	          		$.each(data, function(key, value){
	          			$('#noteList').empty();
	          			a+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ">';
	          			a+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
	          			a+='	<!-- a HTML (to Trigger Modal) -->';
	          			a+='	<a data-toggle="modal"';
	          			a+='		href="../note/noteDetail.htm?noteNum='+value.noteNum+'&cmd=mynote"';
	          			a+='		data-target="#modal-testNew" role="button" data-backdrop="static">';
	          			a+='		<div class="item">';
	          			a+='			<img class="img-rounded"';
	          			a+='				src="'+value.noteThumnail+'"';
	          			a+='					alt="${noteList.noteTitle}" width="100%">';
	          			a+='			 <div class="caption">';
	          			a+='				<i class="fa fa-plus" aria-hidden="true"></i>';
	          			a+='			</div> ';
	          			a+='		</div>';
	          			a+='		<div>';
	          			a+='		<input type="hidden" id="noteNum" class="noteNum" value="'+value.noteNum+'">';
	          			a+='			<h4>'+value.noteTitle+'</h4>';
	          			a+='			<strong>'+value.userNick+'</strong> <span> '+value.noteDate+'</span>';
	          			a+='	</div>';
	          			a+='	</a>';
	          			a+='	</div>';
	          			a+='</div>';
	          			$("#noteList").html(a);
	          		})
	          	}else{
	          		/*swal({type: "success",
					  title: '해당 검색어가 없습니다.',
		              confirmButtonClass : "btn-danger",
					  closeOnConfirm: false
				})*/
	          		
	          	}
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
	    	        	var noteNum = ui.draggable.prop("id")
	    	        	deleteNote(noteNum)
	    	         }     
	    	      });  
	        })
	 })

	    //노트 정렬 
	 $('#sort-category').on("change",function(e) {
	  	$.ajax({
	        url: "../note/selectOrderbyNote.json", // url_pettern 
	        type:"post",
	        data:{"sortCategory":$('#sort-category option:selected').val()},
	        dataType:"json",
	        success:function(data){
	      	  var a = "";
	          	if(data !=null) {
	          		$.each(data, function(key, value){
	          			$('#noteList').empty();
	          			a+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ">';
	          			a+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
	          			a+='	<!-- a HTML (to Trigger Modal) -->';
	          			a+='	<a data-toggle="modal"';
	          			a+='		href="../note/noteDetail.htm?noteNum='+value.noteNum+'&cmd=mynote"';
	          			a+='		data-target="#modal-testNew" role="button" data-backdrop="static">';
	          			a+='		<div class="item">';
	          			a+='			<img class="img-rounded"';
	          			a+='				src="'+value.noteThumnail+'"';
	          			a+='					alt="${noteList.noteTitle}" width="100%">';
	          			a+='			 <div class="caption">';
	          			a+='				<i class="fa fa-plus" aria-hidden="true"></i>';
	          			a+='			</div> ';
	          			a+='		</div>';
	          			a+='		<div>';
	          			a+='		<input type="hidden" id="noteNum" class="noteNum" value="'+value.noteNum+'">';
	          			a+='			<h4>'+value.noteTitle+'</h4>';
	          			a+='			<strong>'+value.userNick+'</strong> <span> '+value.noteDate+'</span>';
	          			a+='	</div>';
	          			a+='	</a>';
	          			a+='	</div>';
	          			a+='</div>';
	          			$("#noteList").html(a);
	          		})
	          	}else{
	          		/*swal({type: "success",
					  title: '해당 검색어가 없습니다.',
		              confirmButtonClass : "btn-danger",
					  closeOnConfirm: false
				})*/
	          		
	          	}
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
	    	        	var noteNum = ui.draggable.prop("id")
	    	        	deleteNote(noteNum)
	    	         }     
	    	      });  
	        
	        
	        })
	
	 })
	 
	 
	 
	 
});



