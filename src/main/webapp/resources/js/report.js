
function selectAll() {
		var tbodyAppendAll = "";
		$('tbody').empty();
		$.ajax({
			url : '../etc/allReport.json',
			success : function(data) {
				$('tbody').empty();
				$.each(data, function(index, obj) {
					
					tbodyAppendAll += '<tr><td>'+obj.reportNum
									+'</td><td>'+obj.userEmail+'</td><td>';
									
					 if ((obj.noteOrCommCode).trim() == 'NC00') {
						tbodyAppendAll += '노트';
					} else {
						tbodyAppendAll += '댓글';
					}
					 		
					tbodyAppendAll += '</td><td>'+obj.noteNum+'</td><td><a href="../note/noteDetail.htm?noteNum='+obj.noteNum+'" class="btn btn-sm drop-btn reportViewBtn" data-toggle="modal" data-target="#reportModal" role="button" data-backdrop="static">확인</a></td><td>';
					
					if ((obj.reportCauseCode).trim() == 'NR01') {
						tbodyAppendAll += '광고성/음란성';
					}
					else if ((obj.reportCauseCode).trim() == 'NR02') {
						tbodyAppendAll += '비속어 사용';
					}
					else if ((obj.reportCauseCode).trim() == 'NR03') {
						tbodyAppendAll += '회원 내 다툼';
					}
					else if ((obj.reportCauseCode).trim() == 'NR04') {
						tbodyAppendAll += '저작권 침해';
					}
					else {
						tbodyAppendAll += '기타';
					}  
					
					tbodyAppendAll+='</td><td>'+obj.reportContent+'</td><td>'
										+obj.reportInDate+'</td><td>';
										
					if((obj.checkCode).trim()=='PS01'){tbodyAppendAll+='블라인드';}
					 else if((obj.checkCode).trim()=='PS02'){tbodyAppendAll+='미확인';}
					 else{tbodyAppendAll+='기각';}

					tbodyAppendAll +='</td><td><button class="btn btn-sm drop-btn reportBtn" data-toggle="modal" data-target="#memoModal">설정</button></td><td>';
					
					if(obj.reportmemo != 'null') tbodyAppendAll += obj.reportmemo+'</td><td></tr>';
					else tbodyAppendAll += '</td><td></tr>';
					
				});
				
				$('tbody').append(tbodyAppendAll);
				
				$('.reportBtn').click(function() {
					$('#reportNum').val( $(this).parent().parent().children().first().html() );
					$('#reportmemo').val( $(this).parent().parent().children().last().html() );
					$('#noteOrCommCode').val( $(this).parent().parent().children().eq(2).html() );
					$('#noteNum').val( $(this).parent().parent().children().eq(3).html() );
					
					
					if ($(this).parent().parent().children().eq(8).html() == '기각') {
						$('#checkCode').val('PS00');
					} else if ($(this).parent().parent().children().eq(8).html() == '블라인드') {
						$('#checkCode').val('PS01');
					} else {
						$('#checkCode').val('PS02');
					}
				});
				
				$('.reportViewBtn').click(function() {
					if ($(this).parent().parent().children().eq(2).html() == '댓글') {
						console.log("넘기는 값 / "+$(this).parent().parent().children().eq(3).html());
						$.ajax({
							url : '../etc/hasReportComm.json',
							data : {'reportNum':$(this).parent().parent().children().eq(3).html()},
							success : function(data) {
								console.log("넘어온 값 / "+data);
								console.log("요청 url ${pageContext.request.contextPath}/note/noteDetail.htm?noteNum="+data);
								$(this).attr("href", "../note/noteDetail.htm?noteNum="+data);
							}
						})
					}

				});
			}
		});
		
		
	}
	
	$(document).ready(function() {
		$('#table_id').DataTable();
		
		selectAll();

		$('#report').click(function() {selectAll();});
		
		$('#noteReport').click(function() {
			$('tbody').empty();
			var tbodyAppendNote = "";
			$.ajax({
				url : '../etc/noteReport.json',
				success : function(data) {
					$('tbody').empty();
					$.each(data, function(index, obj) {
						tbodyAppendNote += '<tr><td>'+obj.reportNum
										+'</td><td>'+obj.userEmail+'</td><td>노트';
						
						tbodyAppendNote += '</td><td>'+obj.noteNum+'</td><td>';
						
						if ((obj.reportCauseCode).trim() == 'NR01') {
							tbodyAppendNote += '광고성/음란성';
						}
						else if ((obj.reportCauseCode).trim() == 'NR02') {
							tbodyAppendNote += '비속어 사용';
						}
						else if ((obj.reportCauseCode).trim() == 'NR03') {
							tbodyAppendNote += '회원 내 다툼';
						}
						else if ((obj.reportCauseCode).trim() == 'NR04') {
							tbodyAppendNote += '저작권 침해';
						}
						else {
							tbodyAppendNote += '기타';
						}  
						
						tbodyAppendNote += '</td><td>'+obj.reportContent
										+'</td><td>'+obj.reportInDate+'</td><td>';
						
						if ((obj.checkCode).trim() == 'PS01') {
							tbodyAppendNote += '블라인드';
						} else if ((obj.checkCode).trim() == 'PS02') {
							tbodyAppendNote += '미확인';
						} else {
							tbodyAppendNote += '기각';
						}				
						
						tbodyAppendNote +='</td><td><button class="btn btn-sm drop-btn reportBtn" data-toggle="modal" data-target="#memoModal">설정</button></td><td>';
											
						if(!obj.reportmemo) tbodyAppendNote += obj.reportmemo;
						
						tbodyAppendNote += '</td><td></tr>';
						
				})
				$('tbody').append(tbodyAppendNote);
					$('.reportBtn').click(function() {
						$('#reportNum').val( $(this).parent().parent().children().first().html() );
						$('#reportmemo').val( $(this).parent().parent().children().last().html() );
						$('#noteOrCommCode').val('노트');
						$('#noteNum').val( $(this).parent().parent().children().eq(3).html() );
						
						if ($(this).parent().parent().children().eq(8).html() == '기각') {
							$('#checkCode').val('PS00');
						} else if ($(this).parent().parent().children().eq(8).html() == '블라인드') {
							$('#checkCode').val('PS01');
						} else {
							$('#checkCode').val('PS02');
						}
					});
			}
			
		})
		})

		$('#commReport').click(function() {
			var tbodyAppendComm = "";
			$('tbody').empty();
			$.ajax({
				url : '../etc/commReport.json',
				success : function(data) {
					$('tbody').empty();
					$.each(data, function(index, obj) {
						tbodyAppendComm += '<tr><td>'+obj.reportNum
						+'</td><td>'+obj.userEmail+'</td><td>노트';
		
						tbodyAppendComm += '</td><td>'+obj.noteNum+'</td><td>';
		
		if ((obj.reportCauseCode).trim() == 'NR01') {
			tbodyAppendComm += '광고성/음란성';
		}
		else if ((obj.reportCauseCode).trim() == 'NR02') {
			tbodyAppendComm += '비속어 사용';
		}
		else if ((obj.reportCauseCode).trim() == 'NR03') {
			tbodyAppendComm += '회원 내 다툼';
		}
		else if ((obj.reportCauseCode).trim() == 'NR04') {
			tbodyAppendComm += '저작권 침해';
		}
		else {
			tbodyAppendComm += '기타';
		}  
		
		tbodyAppendComm += '</td><td>'+obj.reportContent
		+'</td><td>'+obj.reportInDate+'</td><td>';

		if ((obj.checkCode).trim() == 'PS01') {
					tbodyAppendComm += '블라인드';
				} else if ((obj.checkCode).trim() == 'PS02') {
					tbodyAppendComm += '미확인';
				} else {
					tbodyAppendComm += '기각';
				}				
				
				tbodyAppendComm +='</td><td><button class="btn btn-sm drop-btn reportBtn" data-toggle="modal" data-target="#memoModal">설정</button></td><td>';
							
				if(!obj.reportmemo) tbodyAppendComm += obj.reportmemo;
				
				tbodyAppendComm += '</td><td></tr>';
				})
				$('tbody').append(tbodyAppendComm);
					$('.reportBtn').click(function() {
						$('#reportNum').val( $(this).parent().parent().children().first().html() );
						$('#reportmemo').val( $(this).parent().parent().children().last().html() );
						$('#noteOrCommCode').val('댓글');
						$('#noteNum').val( $(this).parent().parent().children().eq(3).html() );
						
						if ($(this).parent().parent().children().eq(8).html() == '기각') {
							$('#checkCode').val('PS00');
						} else if ($(this).parent().parent().children().eq(8).html() == '블라인드') {
							$('#checkCode').val('PS01');
						} else {
							$('#checkCode').val('PS02');
						}
					});
					$('.reportViewBtn').click(function() {
						$.ajax({
								url : '../etc/hasReportComm.json',
								data : {'reportNum':$(this).parent().parent().children().eq(3).html()},
								success : function(data) {
									$(this).attr("href", "../note/noteDetail.htm?noteNum="+data);
								}
							})

					});
			}
		})

	})
	
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
		   		  if (result >= 2) { 
   	    	  swal({type: "success",
				  title: '성공적으로 반영했습니다.',
	              confirmButtonClass : "btn-danger",
				  closeOnConfirm: false
				},
			 function(){
				location.href="../etc/adminReport.htm";
			});	
		   		 } else {
		   			swal({type: "error",
						  title: '처리에 실패했습니다.',
			              confirmButtonClass : "btn-danger",
						  closeOnConfirm: false
						});
		   		 }
	       },
  			 error:function(request,status,error){
	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  }
		})
	})

	})