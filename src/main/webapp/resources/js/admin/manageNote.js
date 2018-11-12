$(document).ready(function() {
	 $('#table_id').DataTable({
		 "order": false
	 });
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
				text: "삭제 후에는 복구할 수 없습니다.",
				showCancelButton: true,
				confirmButtonClass: "btn-danger btn-sm",
				cancelButtonClass: "btn btn-sm",
				confirmButtonText: "OK",
				cancelButtonText: "cancel",
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
								 		 text: "노트가 삭제되었습니다.",
								 		 type: "success",
								 		 showCancelButton: false,
								 		 confirmButtonClass: "btn-danger  btn-sm",
								 		 confirmButtonText: "OK",
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
	function deleteOneNote(thisBtn){
		var noteNumv = $(thisBtn).parent().siblings('#noteNum').text();
		var noteTitlev = $(thisBtn).parent().siblings('#noteTitle').text();
		
		swal(  {type:"warning",
				title: "해당 노트를 삭제하시겠습니까?",
				text: "삭제 후에는 복구할 수 없습니다.",
				showCancelButton: true,
				confirmButtonClass: "btn-danger btn-sm",
				cancelButtonClass: "btn btn-sm",
				confirmButtonText: "OK",
				cancelButtonText: "cancel",
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
								 		 title: "노트가 삭제되었습니다.",
								 		 text: "",
								 		 type: "success",
								 		 showCancelButton: false,
								 		 confirmButtonClass: "btn-danger  btn-sm",
								 		 confirmButtonText: "OK",
								 		 closeOnConfirm: false
											}, function () {
												location.reload();
												}
										);
										}
								})
					}
			}
		)
	}
 
//끝	 

 