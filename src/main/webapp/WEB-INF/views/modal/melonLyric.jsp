<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 신고 모달창에서 ok버튼 눌렀을 때 스윗알럳 띄우기 -->

<!-- modal-header -->

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<br>
	<%--    <h2 class="modal-title">${dragList.dragNum}</h2> --%>
	<div class="row">
		<div class="col-xs-2">
			가사
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-6"></div>
	<div class="col-xs-6"></div>
</div>
<!-- modal-body-->
<div class="modal-body">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<!-- 본문 -->
				<div class="text-left col-sm-10 lyric">${lyric}</div>
			</div>
		</div>
	</div>
</div>
