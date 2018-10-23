
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

$(function() {
   
    // 드래그 div들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
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
        	var dragNum = $('.dragNum').val()
        	deleteDrag(dragNum)
         }     
      });    
    });
