<%-- admin>>
@JSP : manageNote.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 관리자 노트관리

@Date : 2018.10.19
@Author : 고은아
@Desc : 관리자 신고 관리

--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
		<!-- Sweet Alert cdn -->
		<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/alert/sweetalert.css" />
		<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>

<!-- 메모 모달창 -->

	<div id="memoModal" class="modal fade form-horizontal">
		<div class="modal-dialog">
			<div class="modal-content">
			<form>
				<div class="modal-header">
				처리 메모
				</div>
				<div class="modal-body">
					<div class="form-group">
					<input type="hidden" id="reportNum" name="reportNum">
					<br/>
						<label class="control-label col-sm-2">메모 </label>
						<textarea rows="15" cols="60" name="reportmemo" id="reportmemo"></textarea>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">처리여부 </label>
						<select name="checkCode" class="form-control checkCode" id="checkCode">
						<option value="PS00">기각</option>
						<option value="PS01">블라인드</option>
						<option value="PS02">미확인</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button"class="btn btn-danger" id="submitBtn" value="추가">
				</div>
			</form>
			</div>
		</div>
	</div>
	
<section>
	<div class="container">
		<div>
			<h3>신고 관리</h3>
		</div>
		<div id="adminBtnDiv">
			<button id="report" class="btn btn-sm drop-btn">전체 신고 내역</button>
			<button id="noteReport" class="btn btn-sm drop-btn">노트 신고 내역</button>
			<button id="commReport" class="btn  btn-sm drop-btn">댓글 신고
				내역</button>
		</div>
		<br>
		<table id="table_id">
			<thead>
				<tr>
					<th>신고번호</th>
					<th>신고자 이메일</th>
					<th>대상</th>
					<th>대상번호</th>
					<th>신고사유</th>
					<th>상세내용</th>
					<th>신고일자</th>
					<th>처리여부</th>
					<th>처리</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
</section>
<script>
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
					 		
					tbodyAppendAll += '</td><td>'+obj.noteNum+'</td><td>';
					
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
					
					if ($(this).parent().parent().children().eq(7).html() == '기각') {
						$('#checkCode').val('PS00');
					} else if ($(this).parent().parent().children().eq(7).html() == '블라인드') {
						$('#checkCode').val('PS01');
					} else {
						$('#checkCode').val('PS02');
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
						
						if ($(this).parent().parent().children().eq(7).html() == '기각') {
							$('#checkCode').val('PS00');
						} else if ($(this).parent().parent().children().eq(7).html() == '블라인드') {
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
						
						if ($(this).parent().parent().children().eq(7).html() == '기각') {
							$('#checkCode').val('PS00');
						} else if ($(this).parent().parent().children().eq(7).html() == '블라인드') {
							$('#checkCode').val('PS01');
						} else {
							$('#checkCode').val('PS02');
						}
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
		    	 'checkCode':$("#checkCode").val()},
		   	 success:function(result){
   	    	  swal({type: "success",
				  title: '성공적으로 반영했습니다.',
	              confirmButtonClass : "btn-danger",
				  closeOnConfirm: false
				},
			 function(){
				location.href="../etc/adminReport.htm";
			});	 
	       },
  			 error:function(request,status,error){
	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  }
		})
	})
	
	})
</script>