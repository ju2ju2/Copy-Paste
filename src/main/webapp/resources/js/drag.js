/*$(function() {
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
      url: "selectAllDrag.json", // url_pettern 
      type:"POST",
      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
      success:function(data){
    	    console.log(data);
    	   	var a = "";
        	if(data != null) {
        		$.each(data, function(key, value){
        			console.log("foreach문 안으로 들어옵니다.");
        			$('#dragList').empty();
        			a+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
        			a+='<div class="text-center dragDiv mt-10" id="'+value.dragNum+'">';
        			a+='<blockquote class="grapefruit">';
        			a+='<!-- 별 아이콘 -->';
        			a+='<div class="icon-right starDiv">';
        			a+='<br> <i class="far fa-star icon-size"></i>';
        			a+='</div>';
       				a+='<div class="dragContent">';
     				a+='<!-- 모달 창 -->';
        			a+='<div class="drag-a">';
        			a+='<a data-toggle="modal"';
					a+='href="../drag/dragDetail.htm?dragNum='+value.dragNum+'"';
 					a+='data-target="#modal-drag" role="button"';
        			a+='data-backdrop="static">';
        			a+='<p>"'+value.dragText+'"</p> <code>';
        			a+='&lt;출처 : <span class="Cgrapefruit">"'+value.dragOrigin+'"</span>&gt;';
        			a+='<span>"'+value.dragDate+'"</span>';
        			a+='</code> <input type="hidden" id="dragNum" class="dragNum"';
        			a+='value="'+value.dragNum+'">';
        			a+='</a>';
        			a+='</div>';
        			a+='</div>';
        			a+='</blockquote>';
        			a+='</div>';
        			a+='</div>';
        			
        			$("#dargList").html(a);
        		})
        	}
        }
      }).done(function (result){
		  // noteDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
  	    $('.daragDiv').draggable({
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
  	        	var dragNum = ui.draggable.prop("id")
  	        	deleteDrag(dargNum)
  	         }     
  	      });  
      })
});








*/


/*
==========================================*/
// 드래그 드래그로 삭제
	function deleteDrag(dragNum) {
			var dragNum = dragNum;
			var dragList = localStorage.getItem("dragList");
			
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

//드래그 앤 드랍 		
$(function() {
    // 드래그 div들 제어.
    $('.dragDiv').draggable({
    	revert: true, 
    	 revertDuration: 200,
    	 snapMode: "inner",
    	 scroll: true,
    	 scrollSensitivity: 100 ,
    	 scrollSpeed: 100
    	});
     // 드래그를 드랍하여 삭제 메소드. 
    $("#droppable").droppable({
        activeClass:"ui-state-active",
        accept:".dragDiv",
        drop: function(event,ui) {
        	var dragNum = $('.dragNum').val()
        	deleteDrag(dragNum)
         }     
      });    
    });

/*
function setDragMark(){
data = var dragNum = $('.dragNum').val()
var dragMark =$('.dragMark').val()

$.ajax({
	url:"../drag/setDragMark.json",
	dataType:"json",
	data: {"dragNum":dragNum},
	type: "POST"
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
	.success(data){
			alret(data)
			if( data = 0) {
				 $('.fa-star').click(function(){
					 $(this).removeClass('fas').addClass('far');
				 }
				 else (data != 0 {
					 $('.fa-star').click(function(){
							$(this).removeClass('far').addClass('fas');
					 }
				 }	 
			}
		}	
		
		function(){
			location.reload()
		}

  });
}

*/

