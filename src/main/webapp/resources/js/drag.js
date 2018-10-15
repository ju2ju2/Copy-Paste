$(function() {
	
	
	$('#dragTrash').droppable( {
		// 펑션으로 ajax 이용해서 데이터 삭제되고 시각적으로 새로운 데이터 불러오는 식의 처리해야함		
	      } 
	);

	// 드래그 div들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
	$('.blog').draggable({
		revert: true
	});
	
	// 별 클릭하면 토글되는 이벤트
	$('.starSpan').click(function() {
		if($(this).find('i').hasClass("far")){
			$(this).find('i').removeClass("far").addClass("fas");
		} else {
			$(this).find('i').removeClass("fas").addClass("far");
		}
	});
})