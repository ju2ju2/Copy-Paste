
/*		// 드래그 드래그로 삭제
		function deleteDrag(dragNum) {
			var dragNum = dragNum;
			var dragList = localStorage.getItem("dragList");
			
			swal({
				  title: "* :-O",
				  text: "드래그를 삭제하시겠어요~?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonText: "네, 삭제해주세요 :)",
				  cancelButtonText: "아니요!",
				  closeOnConfirm: false
				},
				function(){
					$.ajax({
						url:"/deleteDrag.do",
						dataType:"json",
						data: {"dragNum":dragNum},
						type: "POST"
						}).done(function (result){
							swal("₍ᐢ•ﻌ•ᐢ₎*･ﾟ｡", result.msg);
							makeDragList();
					});
				}
			);
			
		}	*/
		
		/*// 드롭 허용
		function allowDrop(ev) {
			ev.preventDefault(); 
			}
		
		// 드래그 이벤트
		function drag(ev) { 
			ev.dataTransfer.setData("text", ev.target.id); 
			} 
		
		// 노트 및 드래그 삭제 드랍 이벤트
		function drop(ev) {
			ev.preventDefault();
			var deleteId = ev.dataTransfer.getData($(".mini-posts")); 
			var deleteNum = deleteId.substring(4);
			if (deleteId.startsWith("d")){
			 	deleteDrag(deleteNum);
			} else if (deleteId.startsWith("c")){
				deleteNum = deleteId.substring(8);
				deleteCategory(deleteNum);
			} else{
			 	deleteNote(deleteNum);
			} 
		}
		
*/
	






$(function() {
    $('#dragTrash').droppable( {
        // 펑션으로 ajax 이용해서 데이터 삭제되고 시각적으로 새로운 데이터 불러오는 식의 처리해야함        
    /*	$( ".blog" ).hide( "drop", { direction: "down" }, "slow" );*/
    	} 
    );

    // 드래그 div들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
    $('.blog').draggable({
    	 revert: true, 
    	 revertDuration: 200,
    	 helper: "clone",
    	 snapMode: "inner",
    	 scroll: true,
    	 scrollSensitivity: 100 ,
    	 scrollSpeed: 100
    });


    // 별 클릭하면 토글되는 이벤트
    $('.fa-star').click(function(){
    	if($(this).hasClass('far')){
    		$(this).removeClass('far').addClass('fas');
    	} else {
    		$(this).removeClass('fas').addClass('far');
    	}
    });
});
