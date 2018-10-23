$(function() {
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
				function(){
					$.ajax({
						url:"../drag/deleteDrag.json",
						dataType:"json",
						data: {"dragNum":dragNum},
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

		  // noteDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
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
	        	var noteNum = $(this).find('#dragNum').val()
	        	alert($(this).find('#dragNum').val())
	        
	         }     
	      });  
    

   //드래그목록
	 $.ajax({
      url: "../drag/selectAllDrag.json", // url_pettern 
      type:"POST",
      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
      success:function(data){
    	    console.log(data);
    	   
    	    var dragList ="";
        	if(data != null) {
        		$.each(data, function(key, value){
        			$('#dragList').empty();
        			dragList+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
        			dragList+='<div class="text-center dragDiv mt-10" id="'+value.dragNum+'">';
        			dragList+='<blockquote class="grapefruit">';
        			dragList+='<!-- 별 아이콘 -->';
        			dragList+='<div class="icon-right starDiv">';
        			dragList+='<br> <i class="far fa-star icon-size"></i>';
        			dragList+='</div>';
        			dragList+='<div class="dragContent">';
        			dragList+='<!-- 모달 창 -->';
        			dragList+='<div class="drag-a">';
        			dragList+='<a data-toggle="modal"';
        			dragList+='href="../drag/dragDetail.htm?dragNum='+value.dragNum+'"';
        			dragList+='data-target="#modal-drag" role="button"';
        			dragList+='data-backdrop="static">';
        			dragList+='<p>"'+value.dragText+'"</p> <code>';
        			dragList+='&lt;출처 : <span class="Cgrapefruit">"'+value.dragOrigin+'"</span>&gt;';
        			dragList+='<span>"'+value.dragDate+'"</span>';
        			dragList+='</code> <input type="hidden" id="dragNum" class="dragNum"';
        			dragList+='value="'+value.dragNum+'">';
        			dragList+='</a>';
        			dragList+='</div>';
        			dragList+='</div>';
        			dragList+='</blockquote>';
        			dragList+='</div>';
        			dragList+='</div>';
        			
        			$("#dragList").html(dragList);
        		})
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
  	        	var dragNum = ui.draggable.prop("id")
  	        	deleteNote(noteNum)
  	         }     
  	      });  
      
      })
});


/*
//중요 체크

$('.fa-star').click(function(){
var dragNum = $('.dragNum').val()
var dragMark =$('.dragMark').val()

$.ajax({
	url:"../drag/setDragMark.json",
	dataType:"json",
	data: {"dragNum":dragNum},
	type: "POST",
	success: function(data) {
	alret(data)
		if( data == 0) {
			 $('.fa-star').removeClass('fas').addClass('far');
		 }
		 else {
			 $('.fa-star').removeClass('far').addClass('fas');
				 }
			 }

	}).done(function (result){
		swal({type: "success",
				  title: '중요체크',
	              confirmButtonClass : "btn-danger",
				  closeOnConfirm: false
		},
		function(){
			location.reload()
				}
			)
		}
  	});
 }*/
  


