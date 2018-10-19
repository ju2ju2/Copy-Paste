<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Sweet Alert cdn -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/alert/sweetalert.css" />
<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
<!-- 신고 모달창에서 ok버튼 눌렀을 때 스윗알럳 띄우기 -->

<!-- modal-header -->

<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal">&times;</button>
   <br>
   <h2 class="modal-title">${dragList.dragNum}</h2>
   <div class="row">
      <div class="col-xs-6" ></div>
      <div class="col-xs-6">
         <strong>${dragList.userEmail}</strong>&nbsp;&nbsp;${dragList.dragDate}
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
            <div class="row">
               <br> <br> <br> <br>
               <div class="col-sm-9"></div>
               <div class="col-sm-3">
                  <strong> <a href=""><i class="far fa-edit 3x notewrite"></i> &nbsp;</a> 
                  <a href=""><i class="fas fa-arrow-down"></i> &nbsp;</a>
                   <a href=""><i class="fas fa-trash"></i> &nbsp;</a> 
                   <a href=""><i class="fas fa-archive"></i></a></strong>
               </div>
            </div>

         </div>
         <!-- modal-footer-->
         <div class="modal-footer">
            <div class="panel-footer">
               <div class="comment-box">
               
                  <ul data-brackets-id="12674" id="sortable"
                     class="list-unstyled ui-sortable">
                  </ul>

                
               </div>
            </div>
         </div>
      </div>
      <input type="button" class="btn btn-default"
         data-dismiss="modal" value="Close" id="empbutton" />
      <div class="col-xs-10" id="lblstatus"></div>
   </div>
</div>



