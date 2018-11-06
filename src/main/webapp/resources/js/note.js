/*
@JS : note.js
@Date : 2018.10.24
@Author : 우나연
@Desc : note.js 스크립트
*/
		
	
			//params json 객체 파라미터 넘기는 값. VO역할
			var params = {     "fromDate": "",
							   "toDate" :  "",
							   "keyword": "",
							   "noteNum" : "",
							   "sortCategory" : "",
							   "page": 0
								}
		
			// 노트  드래그로 삭제
			function deleteNote(noteNum) {
				var noteNum = noteNum;
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
							url:"../note/deleteNote.json",
							dataType:"json",
							data: {"noteNum":noteNum},
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

			// 스크롤 내렸을때 top보이고 안내리면 안보임
			window.onscroll = function() {scrollFunction()};
			function scrollFunction() {
			    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			        document.getElementById("myBtn").style.display = "block";
			    } else {
			        document.getElementById("myBtn").style.display = "none";
			    }
			}
	
			// top버튼 눌렀을때 실행
			function topFunction() {
			    document.body.scrollTop = 0;
			    document.documentElement.scrollTop = 0;
			}
		
		    //노트목록
			function makeNoteList(url, params){
			$.ajax({
			  type:"get",
			  url: url, // url_pettern
			  data: params,
			  dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
			  success:function(data){
				  console.log(data)
				  var noteList = "";
			    	if(data != null) {
			    		$.each(data, function(key, value){
			    			noteList="";
			    			noteList+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ">';
			    			noteList+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
			    			noteList+='	<!-- a HTML (to Trigger Modal) -->';
			    			noteList+='	<a data-toggle="modal"';
			    			noteList+='		href="../note/noteDetail.htm?noteNum='+value.noteNum+'"';
			    			noteList+='		data-target="#modal-testNew" role="button" data-backdrop="static">';
			    			noteList+='		<div class="item">';
			    			noteList+='			<img class="img-rounded"';
			    			noteList+='				src="'+value.noteThumnail+'"';
			    			noteList+='					alt="${noteList.noteTitle}" width="100%">';
			    			noteList+='				 <div class="caption">';
			    			noteList+='					<i class="fa fa-plus" aria-hidden="true"></i>';
			    			noteList+='				</div> ';
			    			noteList+='			</div>';
			    			noteList+='			<div>';
			    			noteList+='			<input type="hidden" id="noteNum" class="noteNum" value="'+value.noteNum+'">';
			    			noteList+='				<h4 class="noteTitle">'+value.noteTitle+value.noteNum+'</h4>';
			    			noteList+='			<strong>'+value.userNick+'</strong> <span> '+value.noteDate+'</span>';
			    			noteList+='		</div>';
			    			noteList+='		</a>';
			    			noteList+='		</div>';
			    			noteList+='	</div>';
					
					
			    			$("#noteList").append(noteList);
			    		})
			    		
			    	}
			    }
			  }).done(function (result){
				  // noteDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
				    $('.noteDiv').draggable({
				    	revert: true, 
				    	 revertDuration: 200,
				    	 snapMode: "inner",
				    	 scroll: true,
				    	 scrollSensitivity: 100 ,
				    	 scrollSpeed: 100
				    	});
				     // 노트를 드랍하여 삭제 메소드 
				    $("#droppable").droppable({
				        activeClass:"ui-state-active",
				        accept:".noteDiv",
				        drop: function(event,ui) {
				        	var noteNum = ui.draggable.prop("id")
				        	deleteNote(noteNum)
				         }     
				      });  
			   
					
			  })
			}
			
			
			// 스크롤이벤트 위치지정
			var lastScrollTop = 0;
			//스크롤 발생시 추가적인 리스트 생성
			function moreNoteList(e,url,params){
				e.stopPropagation() 

				// ① 스크롤 이벤트 최초 발생
				var currentScrollTop = $(window).scrollTop();

				if( currentScrollTop - lastScrollTop > 0 ){
					if ($(window).scrollTop() >= ($(document).height() - $(window).height()) ){ 
						params.page += 12;
						console.log(params.page+" 번부터")
					
						makeNoteList(url,params)
						
					}
				}
			}
		

//페이지 로딩시 요청
$("document").ready(function(){

	   
		var url="";
		url ="../note/selectAllNote.json";
		makeNoteList(url,params);
		$(window).scroll(function(e) { moreNoteList(e,url, params)})
			
		/* 날짜 별 검색 */
		$("#toDate").change(function(){
			url ="../note/selectByCalNote.json"
			params.fromDate = $("#fromDate").val()
			params.toDate =$("#toDate").val()
			params.page=0
			$('#noteList').empty();
			makeNoteList(url, params);
			$(window).scroll(function(e) { moreNoteList(e,url, params)})
		});
		
	    //노트 키워드 검색
		 $('#search').click(function(e) {
			url ="../note/selectByKeyNote.json"
			params.keyword = $('#search-text').val()
			params.page=0
			$('#noteList').empty();
			makeNoteList(url, params);
			$(window).scroll(function(e) { moreNoteList(e,url, params)})
		 })

	    //노트 정렬 
		 $('#sort-category').change(function(e) {
			url ="../note/selectOrderbyNote.json"
			params.sortCategory = $('#sort-category option:selected').val()
			params.page=0
			$('#noteList').empty();
			makeNoteList(url, params);
		    $(window).scroll(function(e) {moreNoteList(e,url, params)})
		 })
		 



		 
//끝	
}) 



