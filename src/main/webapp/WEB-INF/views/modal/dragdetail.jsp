<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Sweet Alert cdn -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/api/alert/sweetalert.css" />
<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/api/sweetalert.min.js"></script>
<!-- 신고 모달창에서 ok버튼 눌렀을 때 스윗알럳 띄우기 -->

<!-- modal-header -->

<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal">&times;</button>
   <br>
<%--    <h2 class="modal-title">${dragList.dragNum}</h2> --%>
   <div class="row">
      <div class="col-xs-2">
      <a id="deleteDragBtn"><i class="fas fa-trash" alt="드래그 삭제" title="드래그 삭제"></i> &nbsp;</a> 
      </div>
   
      <div class="col-xs-8" >
          <a href="${dragList.dragOriginLink}"><strong id="dragModal">출처 : ${dragList.dragOrigin}&nbsp;&nbsp;</strong></a>
          <strong>저장일자 : ${dragList.dragDate}</strong>
          </div>
      </div>
   </div>
   <div class="row">
      <div class="col-xs-6" ></div>
      <div class="col-xs-6"></div>
   </div>
</div>
<!-- modal-body-->
<div class="modal-body">
   <div class="panel panel-default">
      <div class="panel-body">
         <div class="row">
            <div class="text-right col-sm-1" ></div>
            <!-- 본문 -->
            <div class="text-left col-sm-10">${dragList.dragText}</div>
         </div>
      	<input type="button" class="btn btn-default"
         data-dismiss="modal" value="Close" id="empbutton" />
      <div class="col-xs-10" id="lblstatus"></div>
   </div>
</div>
<script>
//드래그 버튼으로 삭제
$('#deleteDragBtn').click(function(e) {
	swal({
		  title: "정말 삭제하시겠습니까?",
		  text: "삭제 후에는 다시 복구 할 수 없습니다.",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonClass : "btn-danger btn-sm",
		  cancelButtonClass: "btn btn-sm",
		  confirmButtonText: '확인',
		  closeOnConfirm: false
		},
		function(){
			$.ajax ({
				url: "${pageContext.request.contextPath}/drag/deleteDrag.json",
				type: "POST",
				dataType: "json",
				data: {	'dragNum': ${dragList.dragNum} } //
			}).done(function(result) {
				swal({type: "success",
					  title: '성공적으로 삭제되었습니다.',
		              confirmButtonClass : "btn-danger",
					  closeOnConfirm: false
				},
				function(){
					location.reload();
				})
				
			})
			.fail(function(request,status,error){
		     		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		     	  }
		
			);
		});
	return false;
});



</script>


