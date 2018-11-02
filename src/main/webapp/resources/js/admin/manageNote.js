$(document).ready(function() {
	 $('#table_id').DataTable({
		 "order": false
	 });
   
	//회원별 작성 노트개수
	var userEmail;
	$('.noteCountEmail').hide();
	$('.noteCountEmailBtn').click(function(){
		userEmail = $('#userEmail').val();
			$.ajax({
				dataType: "json",
				data : {userEmail:userEmail},
				url : "../etc/selectNoteCount.do",
				success : function(data) { 
							$('.noteCountEmail').show();
							$('#noteCountResult').text(data + " 개");
						}
				})
	})

	//이메일별 노트 일괄삭제
	$('.deleteMemNoteBtn').click(function(){
		
		swal(
				{type:"warning",
				title: "해당 사용자의 노트를 전부 삭제하시겠습니까?",
				text: "되돌릴 수 없으므로 신중히 선택하세요.",
				showCancelButton: true,
				confirmButtonClass: "btn-danger",
				confirmButtonText: "확인",
				cancelButtonText: "취소",
				closeOnConfirm: false},
				function(isConfirm) {
					if(!isConfirm) {
						return false;
					} else {
						$.ajax({
							dataType: "json",
							data : {userEmail:userEmail},
							url : "../etc/deleteMemNote.do",
							success : function() { 
									swal({
								 		 title: "୧༼ ヘ ᗜ ヘ ༽୨",
								 		 text: "노트가 삭제되었습니다.",
								 		 type: "success",
								 		 showCancelButton: false,
								 		 confirmButtonClass: "btn-danger",
								 		 confirmButtonText: "확인",
								 		 closeOnConfirm: false
											}, function () {
												location.reload();
												});
										}
								})
					}
			}
		)	
		
	})

	//일괄삭제 모달 창 닫으면 작성한 데이터 초기화
	$('.modal-deleteNoteEmail-close').click(function(){
		$('#noteCountResult').text('');
		$('#userEmail').val('');
		$('.noteCountEmail').hide();
	})


	//노트 개별삭제
	$('.deleteNoteBtn').click(function(){
		var noteNumv = $(this).parent().siblings('#noteNum').text();
		var noteTitlev = $(this).parent().siblings('#noteTitle').text();
		
		swal(  {type:"warning",
				title: noteTitlev + "해당 노트를 삭제하시겠습니까?",
				text: "되돌릴 수 없으므로 신중히 선택하세요.",
				showCancelButton: true,
				confirmButtonClass: "btn-danger",
				confirmButtonText: "확인",
				cancelButtonText: "취소",
				closeOnConfirm: false},
				
				function(isConfirm) {
					if(!isConfirm) {
						return false;
					} else {
						$.ajax({
							dataType: "json",
							data : {noteNum:noteNumv},
							url : "../etc/deleteNoteNumAdmin.do",
							success : function() { 
									swal({
								 		 title: "୧༼ ヘ ᗜ ヘ ༽୨",
								 		 text: "노트가 삭제되었습니다.",
								 		 type: "success",
								 		 showCancelButton: false,
								 		 confirmButtonClass: "btn-danger",
								 		 confirmButtonText: "확인",
								 		 closeOnConfirm: false
											}, function () {
												location.reload();
												});
										}
								})
					}
			}
		)
	})
	    
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
//끝	 
})   
 