
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

