function deleteMember(thisBtn) {

	swal(
			{type:"warning",
			title:"탈퇴 시키겠습니까?",
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
					url : '../etc/memberdelete.json',
					data : {'userEmail': $(thisBtn).parent().parent().children().first().html()},
					success : function(data) {
							  swal({
								  type: "success",
								  title: "삭제했습니다.", 
								  closeOnConfirm: false
									},
									function() {location.href="../etc/admin.htm";});
					}
				});
			}
		}
	);
}

$(document).ready(function() {
    $('#table_id').DataTable({
    	"order": false
    });
    
} );