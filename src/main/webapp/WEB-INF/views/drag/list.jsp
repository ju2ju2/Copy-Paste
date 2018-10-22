<%-- drag>>
@JSP : list.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 드래그목록

@Date : 2018.10.12
@Author : 고은아
@Desc : 휴지통, 별 추가

@Date : 2018.10.19
@Author : 문지은
@Desc : 드래그 목록보기, 상세보기


--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/drag.js"></script>






<div class="d-container">
	<div class="d-inner">
		<!-- Section -->
		<section>
			<header id="droppable" class="major">
				<div > 
					<h3>
						드래그 목록<i class="fas fa-trash icon-size"></i>
					</h3>
				</div>
			</header>

			<div class="row">
				<c:forEach items="${dragList}" var="dragList">

					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
						<div class="text-center dragDiv mt-10">

							<blockquote class="grapefruit">
							<!-- 별 아이콘 -->
									<div class="icon-right starDiv">
										<br>
										<a><i class="far fa-star icon-size"></i></a>
									</div>
								<div class="dragContent">
									
									<!-- 모달 창 -->
									<div class="drag-a">
										<a data-toggle="modal"
											href="${pageContext.request.contextPath}/drag/dragDetail.htm?dragNum=${dragList.dragNum}"
											data-target="#modal-drag" role="button"
											data-backdrop="static"> 
											<p>${dragList.dragText}</p> <code>
												&lt;출처 : <span class="Cgrapefruit">${dragList.dragOrigin}</span>&gt;
												<span>${dragList.dragDate}</span>
											</code>
											<input type="hidden" id="dragNum"  class="dragNum" value="${dragList.dragNum}">
											</a>
									</div>
									</div>
							</blockquote>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</div>
</div>

<br>

<!-- Modal HTML -->
<div id="modal-drag" class="modal fade text-center overlay"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"drag/dragDetail.htm" file</div>
	</div>
</div>

<p class="row">

<div id="toolbar-options" class="hidden">
   <a href="#" id="insertDrag"><i class="fa fa-copyright"></i></a>
   <a href="#"><i class="fa fa-star"></i></a>
   <a href="#"><i class="fa fa-sticky-note"></i></a>
</div>
<script>
$(document).on("ready",function() {
	
	
})

 // 별 클릭하면 토글되는 이벤트
    $('.fa-star').click(function(){ 	
    	var dragNum = $('.dragNum').val()
    		$.ajax({
    		url:"../drag/setDragMark.json",
    		dataType:"json",
    		data: {"dragNum":dragNum},
    		type: "POST",
    		successs: function(data){
    			alret(data);
    			
    			if(data.dragMark == 0){
    				$('.fa-star').removeClass('far').addClass('fas');
    			}
    			else {
    				$('.fa-star').removeClass('fas').addClass('far');
    			}
    		
    			}
    		})
     		.done(function (result){
    			swal({type: "success",
    					  title: '중요체크',
    		              confirmButtonClass : "btn-danger",
    					  closeOnConfirm: false
    			},
    			function(){
    				location.reload()
    			}
    		  )}
    		)
    
    });
    
    	
    

    	/*   $('.fa-star').click(function(){
    		if($(this).hasClass('far')){
    		$(this).removeClass('far').addClass('fas');
    	} 
    	else {
    		$(this).removeClass('fas').addClass('far');
    	} */
  
/* 	function get_selection() {
		var txt = '';
		if (window.getSelection) {
			txt = window.getSelection();
		} else if (document.getSelection) {
			txt = document.getSelection();
		} else if (document.selection) {
			txt = document.selection.createRange().text;
		}
		return txt;
	} */
	$(document).on("mouseup",function() {
		  var span = document.createElement('span');
		  var sel = document.getSelection();
		  
		  // 드래그 텍스트 공백인지 앞의 드래그와 중복되는지 체크
		 /* 참고	 if (text !='' && text.length > 1 && $.trim(text).length != 0 && prevText != text)  */
		  if (sel!="" && sel.rangeCount) {
		    var range = sel.getRangeAt(0).cloneRange();
		    // wrap text in span element
		    range.surroundContents(span);
		    sel.removeAllRanges();
		    sel.addRange(range);
		    // show tooltip
		    $(span).toolbar({
		        content: '#toolbar-options',
				position: 'bottom',
				style: 'dark',
				//hideOnClick: true
		    // remove span when tooltip is hidden
		    }).on('toolbarShown',  function( event ) {
		    	$('#insertDrag').on("click",function() {
		    		console.log(sel.toString())
		    		$.ajax({
		    		      url: "${pageContext.request.contextPath}/drag/insertDrag.json", // url_pettern 
		    		      type:"POST",
		    		      data:{ 'dragText' : sel.toString(),
		    		    	     'dragOrigin': "copyNpaste"},
		    		      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
		    		      success:function(data){
		    		    	  console.log(data)
		    		    	  swal({type: "success",
		    					  title: '성공적으로 등록되었습니다.',
		    		              confirmButtonClass : "btn-danger",
		    					  closeOnConfirm: false
		    				} ,
		    				function(){
		    					location.href="${pageContext.request.contextPath}/drag/drag.htm";
		    				}
		    				);  
		    		      }
		    		    }); 
		    	});
		     }).on('toolbarHidden', function (e) {
		      $(span).contents().unwrap('span');
		    });
		  }
		});
	
	 
	
	 
	 

</script>


