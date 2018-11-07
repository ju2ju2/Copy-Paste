$(function() {
	$('#table_id').DataTable({"order": false});
	
	$('.reportViewBtn').click(function() {
		if ($(this).parent().parent().children().eq(2).html().trim() == '댓글') {
			$.ajax({
				url : '../etc/hasReportComm.json',
				data : {'reportNum':$(this).parent().parent().children().eq(3).html().trim()},
				success : function(data) {
					console.log(data);
					$(this).attr("href", "../note/noteDetail.htm?noteNum="+data);
				}
			})
		}
	});
	
	$('.reportBtn').click(function() {
		$('#reportNum').val( $(this).parent().parent().children().first().html().trim() );
		$('#reportmemo').val( $(this).parent().parent().children().last().html().trim() );
		$('#noteOrCommCode').val( $(this).parent().parent().children().eq(2).html().trim() );
		$('#noteNum').val( $(this).parent().parent().children().eq(3).html().trim() );
		
		if ($(this).parent().parent().children().eq(8).html().trim() == '기각') {
			$('#checkCode').val('PS00');
		} else if ($(this).parent().parent().children().eq(8).html().trim() == '블라인드') {
			$('#checkCode').val('PS01');
		} else {
			$('#checkCode').val('PS02');
		}
	});
	
	$('#submitBtn').click(function() {
		$.ajax({
			url: "../etc/reportCheck.json",
			type:"POST",
		    dataType:"json",
		    data: {'reportNum':$("#reportNum").val(),
		    	 'reportmemo':$("#reportmemo").val(), 
		    	 'checkCode':$("#checkCode").val(),
		    	 'noteOrCommCode':$("#noteOrCommCode").val(),
		    	 'noteNum':$("#noteNum").val()
		    	 },
		   	success:function(result){
		   		console.log(result);
		   				if (result >= 2) { 
				   	    	  swal({type: "success",
								 	title: '성공적으로 반영했습니다.',
					             	confirmButtonClass : "btn-danger btn-sm",
								  	closeOnConfirm: false
									},
						 			function(){
										location.href="../etc/adminReport.htm";
									}
								);	
		   			} else {
			   			swal({type: "error",
							  title: '처리에 실패했습니다.',
				              confirmButtonClass : "btn-danger btn-sm",
							  closeOnConfirm: false
							});
		   		 	}
	       },
  			error:function(request,status,error){
	    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  		}
		})
	});
	
})