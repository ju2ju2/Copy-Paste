	//신고처리 모달
	function reportCheck(data) {
		var reportNum=data[0];
		var noteOrCommCode= data[2];
		var noteNum = data[3];
		var noteCommNum= data[4];
		var checkCode=data[9];
		var reportmemo=data[11];

		var updateReportForm = 
			'<form style="font-size:15px;">'+
	/*메모*/	'<p style="padding-top: 10px;"><strong>메모</strong>'+
			'</p><textarea rows="5" id="sreportmemo" class="form-control textarea noresize"';
		
			if(reportmemo!=""){
					updateReportForm +=	'>'+reportmemo+'</textarea><br>';
			}else{
					updateReportForm +='placeholder="신고 처리 결과에 대한 메모를 작성해주세요"></textarea><br>';
			}

			
	/*처리*/	updateReportForm +='<strong>처리여부</strong>&ensp; <select name="checkCode" id="scheckCode">';
			if(checkCode=="기각"){
			updateReportForm +='<option value="PS00" selected>기각</option>';
			}else{
			updateReportForm +='<option value="PS00">기각</option>';}
			if(checkCode=="블라인드"){
				updateReportForm +='<option value="PS01" selected>블라인드</option>';
			}else{
			updateReportForm +='<option value="PS01">블라인드</option>';}
			if(checkCode=="미확인"){
				updateReportForm +='<option value="PS02" selected>미확인</option>';
			}else{
			updateReportForm +='<option value="PS02">미확인</option>';}
			updateReportForm +='</select></p>';
  /*주의사항*/ updateReportForm += '<p style="padding-top: 10px;"><strong>처리 전 주의 사항</strong>'+
			'</p><p style="font-size:14px;margin-top:10px;">사안이 중대하여 사이트 내 처리 능력의 한계를 넘어설 경우<br> 아래 수사 기관에 협조를 요청하여 주십시오.</p>'+
			'<a href="http://www.kics.go.kr/" target="_blank" class="link_organsite">형사사법포털 </a>'+
			'<span style="font-size:12px;">시스템 불법침입,전자상거래사기 등 컴퓨터 범죄신고</span><br>'+
			'<a href="http://cyberbureau.police.go.kr/" target="_blank" class="link_organsite">사이버안전국 </a>'+
			'<span style="font-size:12px;">인터넷을 범죄 모든 사이버 테러 방지, 범죄신고 접수</span><br>'+	
			'<a href="http://www.police.go.kr/" target="_blank" class="link_organsite">사이버경찰청 </a>'+
			'<span style="font-size:12px;">명예 훼손·협박·사기·매매·음화판매 사이버 범죄 신고</span>'+
			'<p align="center"><br><strong>위와 같은 내용으로 <br/>해당 신고를 처리하시겠습니까?</strong>'+
			'</p></div></form>';
		
		swal({
			  title:'<span class="title">신고 처리</span>',
			  text: updateReportForm,
			  html: true,
			  inputAttributes: { autocapitalize: 'off' },
			  showCancelButton: true,
			  confirmButtonText : "OK",
			  confirmButtonClass : "btn-danger btn-sm",
			  cancelButtonClass : "btn btn-sm",
			  closeOnConfirm: false
		},
		function(){
			$.ajax ({
				url : '../etc/reportCheck.json',
				type: "POST",
				data : {
			    	 'reportNum':reportNum,
			    	 'reportmemo': $('#sreportmemo').val(),  
			    	 'checkCode': $("#scheckCode").val(),
			    	 'noteNum':noteNum,
			    	 'noteCommNum':noteCommNum,
			    	 'noteOrCommCode':noteOrCommCode
					},beforesend:function(){
						$('#scheckCode').selectmenu("refresh", true);
					}
			}).done(function(result) {
				swal({type: "success",
					  title: '성공적으로 반영했습니다.',
		              confirmButtonClass : "btn-danger btn-sm",
					  closeOnConfirm: true
				},
				function(){
				
				})
				
			
			})
			.fail(function(request,status,error){
	     		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     	  });
		});
	return false;
}



	$(document).ready(function() {
		var table = $('#table_id').DataTable({
			 order: false,
			 columnDefs: [
				    // hide id(first column)
				    {
				      targets: [0],
				      visible: false,
				      searchable: false
				    },
				    {targets: [1], width: "120px"},
				    {targets: [2], width: "100px"},
				    {targets: [3], width: "70px"},
				    {targets: [4], width: "70px"},
				    {targets: [5], width: "70px"},
				    {targets: [6], width: "200px"},
				    {targets: [7], width: "400px"},
				    {targets: [8], width: "400px"},
				    {targets: [9], width: "120px"},
				    {targets: [10], width: "70px"},
				    {targets: [11], width: "200px"},
				  ]
		 });
	    $('#table_id tbody').on( 'click', '.updateReportForm', function () {
	        var data = table.row( $(this).parents('tr') ).data();
	        reportCheck(data)
	    } );


})