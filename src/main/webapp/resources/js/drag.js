/*
@JS : drag.js
@Date : 2018.10.24
@Author : 문지은
@Desc : list 경로 makeDragList.jsp 로 스크립트 수정 
*/
			
			//params json 객체 파라미터 넘기는 값. VO역할
			var params = {"fromDate": "",
							   "toDate" :  "",
							   "keyword": "",
							   "dragNum" : "",
							   "sortCategory" : ""
								}
	
			//드래그 마크 중요표시 
		    function setDragMark(dragNum){
				url ="../drag/setDragMark.json"
				params.dragNum =dragNum
				makeDragList(url, params); 
			};	
			//드래그 마크 중요표시 삭제
			function removeDragMark(dragNum) {
				url ="../drag/removeDragMark.json",
				params.dragNum =dragNum
				makeDragList(url, params); 
		   };
		   	// 드래그  드래그로 삭제
			function deleteDrag(dragNum) {
				var dragNum = dragNum;
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
					function(isConfirm){
					if(isConfirm){
						$.ajax({
							url:"../drag/deleteDrag.json",
							dataType:"json",
							data: {"dragNum":dragNum},
							type: "POST"
							}).done(function (result){
									swal({type: "success",
										  title: '성공적으로 삭제되었습니다.',
							              confirmButtonClass : "btn-danger",
										  closeOnConfirm: true
									},function(){
										    url ="../drag/selectAllDrag.json";
											makeDragList(url); 
									})
							});
					}
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
	

			
			    //드래그목록
				function makeDragList(url, params){
				var page=0;
				
				$.ajax({
			      url: url, // url_pettern 
			      type:"get",
			      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
			      data : params,
			      success:function(data){
			    	  console.log(data)
			    	    var dragList ="";   	    
			        	if(data != null) {
			        		$.each(data, function(key, value){
			        			$('#dragList').empty();
			        			dragList+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
			        			dragList+='<div class="text-center dragDiv mt-10" id="'+value.dragNum+'">';
			        			dragList+='<blockquote class="grapefruit">';
			        			dragList+='<!-- 별 아이콘 -->';
			        			dragList+='<div class="icon-right starDiv" id="starMark">'+value.dragNum+'';
			          			if(value.dragMark==1){   
			          				dragList += '<br> <i class="fas fa-star icon-size" id="starDrag" onclick=removeDragMark('+value.dragNum+');></i>';
			          			}else{	
			          				dragList += '<br> <i class="far fa-star icon-size" id="starDrag" onclick=setDragMark('+value.dragNum+');></i>';
			          			}
			        			dragList+='</div>';
			        			dragList+='<div class="dragContent">';
			        			dragList+='<!-- 모달 창 -->';
			        			dragList+='<div class="drag-a">';
			        			dragList+='<a data-toggle="modal"';
			        			dragList+='href="../drag/dragDetail.htm?dragNum='+value.dragNum+'"';
			        			dragList+='data-target="#modal-drag" role="button"';
			        			dragList+='data-backdrop="static">';
			        			dragList+='<div id="dragContent">'+value.dragText+'</div><code>';
			        			dragList+='<span id="dragOrigin" class="Cgrapefruit">출처 : '+value.dragOrigin+'</span>';
			        			dragList+='<span id="dragDate">'+value.dragDate+'</span>';
			        			dragList+='</code> <input type="hidden" id="dragNum" class="dragNum"';
			        			dragList+='value="'+value.dragNum+'">';
			        			dragList+='<input type="hidden" id="dragMark" class="dragMark" value="'+value.dragMark+'">';
			        			dragList+='</a>';
			        			dragList+='</div>';
			        			dragList+='</div>';
			        			dragList+='</blockquote>';
			        			dragList+='</div>';
			        			dragList+='</div>';
			        			
			        			
			        			$("#dragList").html(dragList);
			        		})
			        	}
			    	
			        }
				  
			      }).done(function (result){
					  // dragDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
			     	    $('.dragDiv').draggable({
			     	    	revert: true, 
			     	    	 revertDuration: 200,
			     	    	 snapMode: "inner",
			     	    	 scroll: true,
			     	    	 scrollSensitivity: 100 ,
			     	    	 scrollSpeed: 100,
			     	    	});
			     	     // 드래그를 드랍하여 삭제 메소드 
			     	    $("#droppable").droppable({
			     	        activeClass:"ui-state-active",
			     	        accept:".dragDiv",
			     	        drop: function(event,ui) {
			     	        	var dragNum = ui.draggable.prop("id")
			     	        	deleteDrag(dragNum)
			     	         }     
			     	      });  
		
			     		    // 스크롤이벤트 발생시 추가 12개 
			     		    var lastScrollTop = 0;
			     	    	page += 12; //2회차
			     			$(window).scroll(function(event){
			     				event.stopPropagation(); 
			     				// ① 스크롤 이벤트 최초 발생
			     		        var currentScrollTop = $(window).scrollTop();
			     
			     		        if( currentScrollTop - lastScrollTop > 0 ){
			     		            if ($(window).scrollTop() >= ($(document).height() - $(window).height()) ){ 
			     		      
			     			            	$.ajax({
			     			                    type : 'get',  
			     			                    url :url,
			     			       		        async: false,
			     			                    data : { page: page },
			     			                    beforeSend: function(){
			     			            
			     			                    },
				     		                    success : function(data){
				     		                   
				     		                   console.log(data)
			     		                        var dragList = "";
			     		                        var dragList2 = "";
			     		                        if(data != null) {
			     		                    		$.each(data, function(key, value){
			     		                    		dragList2="";
			     		                    		dragList2+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
			     		                    		dragList2+='<div class="text-center dragDiv mt-10" id="'+value.dragNum+'">';
			     		                    		dragList2+='<blockquote class="grapefruit">';
			     		                    		dragList2+='<!-- 별 아이콘 -->';
			     		                    		dragList2+='<div class="icon-right starDiv" id="starMark">'+value.dragNum+'';
			     		                  			if(value.dragMark==1){   
			     		                  				dragList2 += '<br> <i class="fas fa-star icon-size" id="starDrag" onclick=removeDragMark("'+value.dragNum+'");></i>';
			     		                  			}else{	setDragMark
			     		                  				dragList2 += '<br> <i class="far fa-star icon-size" id="starDrag" onclick=setDragMark("'+value.dragNum+'");></i>';
			     		                  			}
			     		                  			dragList2+='</div>';
			     		                  			dragList2+='<div class="dragContent">';
			     		                  			dragList2+='<!-- 모달 창 -->';
			     		                  			dragList2+='<div class="drag-a">';
			     		                  			dragList2+='<a data-toggle="modal"';
			     		                  			dragList2+='href="../drag/dragDetail.htm?dragNum='+value.dragNum+'"';
			     		                			dragList2+='data-target="#modal-drag" role="button"';
			     		                			dragList2+='data-backdrop="static">';
			     		                			dragList2+='<div id="dragContent">'+value.dragText+'</div><code>';
			     		                			dragList2+='<span id="dragOrigin" class="Cgrapefruit">출처 : '+value.dragOrigin+'</span>';
			     		                			dragList2+='<span id="dragDate">'+value.dragDate+'</span>';
			     		                			dragList2+='</code> <input type="hidden" id="dragNum" class="dragNum"';
			     		                			dragList2+='value="'+value.dragNum+'">';
			     		                			dragList2+='<input type="hidden" id="dragMark" class="dragMark" value="'+value.dragMark+'">';
			     		                			dragList2+='<input type="hidden" id="page" class="page" value="'+value.page+'">';
			     		                			dragList2+='</a>';
			     		                			dragList2+='</div>';
			     		                			dragList2+='</div>';
			     		                			dragList2+='</blockquote>';
			     		                			dragList2+='</div>';
			     		                			dragList2+='</div>';
			     					                 
			     		                			   $('#dragList').append(dragList2);
			     		                        })
			     							    page += 12;
			     		             
			     		                    	console.log(page);
			     		 
			     		                    }
			     		                   }
			     			            }).done(function (result){
			     			 			  // dragDiv들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
			     				     	    $('.dragDiv').draggable({
			     				     	    	revert: true, 
			     				     	    	 revertDuration: 200,
			     				     	    	 snapMode: "inner",
			     				     	    	 scroll: true,
			     				     	    	 scrollSensitivity: 100 ,
			     				     	    	 scrollSpeed: 100
			     				     	    	});
			     				     	     // 드래그를 드랍하여 삭제 메소드 
			     				     	    $("#droppable").droppable({
			     				     	        activeClass:"ui-state-active",
			     				     	        accept:".dragDiv",
			     				     	        drop: function(event,ui) {
			     				     	        	var dragNum = ui.draggable.prop("id")
			     				     	        	deleteDrag(dragNum)
			     				     	         }     
			     				     	      });  
			     		            }) 
			     		            
			     		          }
			     		      }
			     			})
			    
			     	  
			      })
				}
					
			
//페이지 로딩시 요청
$("document").ready(function(){

			
			var url="";
			url ="../drag/selectAllDrag.json";
			makeDragList(url);
					
			
			/* 날짜 별 검색 */
			$("#toDate").change(function(){
				url ="../drag/selectByCalDrag.json"
				params.fromDate = $("#fromDate").val()
				params.toDate =$("#toDate").val()
				makeDragList(url, params);
			});
	  
			//드래그 키워드 검색
			$('#search').click(function(e) {
				url ="../drag/selectByKeyDrag.json"
				params.keyword = $('#search-Text').val()
				makeDragList(url, params);
			})

			//드래그 정렬 
			$('#sort-category').change(function(e) {
				url ="../drag/selectOrderbyDrag.json"
				params.sortCategory = $('#sort-category option:selected').val()
				makeDragList(url, params);
			})





			
			
			
//끝
});
	
	













