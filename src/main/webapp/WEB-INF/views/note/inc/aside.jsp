<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진(노트 폴더목록만)
@Desc : note aside부분 jsp
 -->
 
 <!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.19
@Author : 이주원 (폴더 목록, 추가, 수정, 삭제 가능)
@Desc : 정말 기능 큰 부분만 구현했습니다. 
		미분류, 스크랩 휴지통, 수정안되게 막아놓지 않았습니다. 이 부분은 주요기능 구현 끝나는 대로 틈틈이 고치겠습니다.
 -->
 
  <!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.20
@Author : 이주원 (폴더 목록, 추가, 수정, 삭제 가능) 제이쿼리 forEach를 사용하여 폴더 목록 뿌릴 수있도록 수정함.
@Desc : 정말 기능 큰 부분만 구현했습니다. 
		미분류, 스크랩 휴지통, 수정안되게 막아놓지 않았습니다. 이 부분은 주요기능 구현 끝나는 대로 틈틈이 고치겠습니다.
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Sweet Alert cdn -->
		<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/alert/sweetalert.css" />
		<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
<nav>
<div id="sidebar">
<div class="inner">
	<div class="row mb">
	<div class="form-group">
		<!-- Sort -->
			<div class="col-xs-12 mb">
			<select name="sort-category" id="sort-category">  
				<option value="">- 정렬 분류 -</option>
				<option value="1">최신순</option>
				<option value="1">오래된 순</option>
				<option value="1">중요표시 있는 순</option>
				<option value="1">전체보기</option>
			</select>
			</div>
		<!-- Search -->
		<section id="subject-search" class="alt">
				
				<div class="col-xs-12">
				<label> &ensp;&ensp;키워드 검색</label>
					<form method="get" action="#">
						<input type="text" id="search-text" placeholder="검색" />
						<a href="#"><i id="search" class="fas fa-search icon-size" style="padding-top:15px"></i></a>
					</form>
				</div>

				<div class="searchCal">
				<div class="col-xs-12">
				<label>&ensp;&ensp;일자별 검색</label>
				</div>
					<div class="col-xs-6">
						<input type="text" id="fromDate" placeholder="시작일">
					</div>
					<div class="col-xs-6">
						<input type="text" id="toDate" placeholder="종료일">
					</div>
				</div>
			</section>
		</div>
		</div>

		<!-- Section -->
		<header class="major mb">
			<h3 id="h-inline">
				노트 폴더 목록<i class="fas fa-folder-plus icon-size" id="Addfolder"></i>
			</h3>
		</header>
		<div class="row" id="scrap">
			<!-- 폴더 목록이 뿌려질 공간 -->
		</div>	
	</div>
</div>
</nav>

<script type="text/javascript">
/* 폴더 삭제 */
function folderDelete(folderName){
	swal({
		  title: "폴더를 삭제하시겠습니까?",
		  text: "",
		  type: "warning",
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "OK",
		  showCancelButton: true
		},
		function(isConfirm) {
		  if (isConfirm) {
			  $.ajax(
						{
				    url : "<%=request.getContextPath()%>/folder/deletefolder.json",
				    type : "post",
				    data : {"folderName": folderName},
				    success : function(data){
				    	location.reload();
				    },
				    error : function(){
				    	swal({
							  title: "폴더 삭제에 실패하였습니다",
							  text: "",
							  type: "warning",
							  confirmButtonClass: "btn-danger",
							  confirmButtonText: "OK",
							  showCancelButton: true
							});
				    }
						});
		  } 
		}); 
}

/* 폴더 수정 */
function folderEdit(fedit, folderName){
	var a = "";
	a += "<h5 class='ml-10 f-name'>";
	a += "<span class='f-count'>4</span>";
	a += "<input type='text' id='folname' required minlength='1' maxlength='12' style='width:200px;height:40px;margin-left:25px;margin-top:-25px;' placeholder=";
	a += folderName;
	a += " autofocus/ >";
	a += "</h5>";
	$(fedit).closest('h5').replaceWith(a); 
	
	/* 엔터키 → 폴더명 수정 */
	$("#folname").keypress(function(key){
		if(key.keyCode == 13){
					$.ajax(
							{
					    url : "<%=request.getContextPath()%>/folder/updatefolder.json",
					    DataType :"text",
					    type : "post",
					    data : {"beforefolderName": folderName,
					    		"folderName" : $(this).val()},
					    success : function(data){
					    	location.reload();
					    	console.log("폴더 수정 성공");
					    },
					    error : function(){
					    	swal({
								  title: "폴더 수정에 실패하였습니다",
								  text: "",
								  type: "warning",
								  confirmButtonClass: "btn-danger",
								  confirmButtonText: "OK",
								  showCancelButton: true
								});
					    }
							});	 
		}	
	 });
}








	/* var dateFormat = "yyyy-mm-dd", //이거 지금 안 먹음
	fromDate = $("#fromDate").datepicker({
	defaultDate : "+1w",
	changeMonth : true,
	numberOfMonths : 1
	}).on("change", function() {
	toDate.datepicker("option", "minDate", getDate(this));
	}), toDate = $("#toDate").datepicker({
	defaultDate : "+1w",
	changeMonth : true,
	numberOfMonths : 1
	}).on("change", function() {
	from.datepicker("option", "maxDate", getDate(this));
	});

	function getDate(element) {
	var date;
	try {
		date = $.datepicker.parseDate(dateFormat, element.value);
	} catch (error) {
		date = null;
	}

	return date;
	}  */
		

	$(document).ready(function() {
		folderlist();
		function folderlist(){
			$.ajax({
		        url : "<%=request.getContextPath()%>/folder/selectAllFolder.json",
		        type : "post",
		        dataType : "json",
		        success : function(data){
		        	var a = "";
		        	if(data != null) {
		        		$.each(data, function(key, value){
		        			$('#scrap').empty();
		                	a += "<div class='col-xs-10 n-folder'>";
							a += "<h5 class='ml-10 f-name'>";
							a += "<span class='f-count'>";
							a += 0
							a += "</span>";
							a += "<span class='f-name'>";
							a += value.folderName+"</span>";
							a += "<span class='f-modify'>";
							a += "<i class='fas fa-edit icon-size' id='folderEdit' onclick=folderEdit(this,'"+value.folderName+"')>";
							a += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
							a += "<i class='fas fa-trash icon-size' id='folderdelete' onclick=folderDelete('"+value.folderName+"');>";
							a += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
							a += "<div class='col-xs-2 icon'><i class='far fa-bookmark icon-size'></i></div>";	
							$('#scrap').append(a);
		        							});
		       							 }
		        	
		        	/* 스크랩 아이콘 토글  */
		        	$('.fa-bookmark').click(function() {
		        		if ($(this).hasClass('far')) {
		        			$('.fa-bookmark').removeClass('fas').addClass('far');
		        			$(this).removeClass('far').addClass('fas');
		        		}
		        	});


		        	/* 폴더 수정 및 삭제 아이콘 토글 */
		        	$(this).find('.f-modify').hide();
		        	$('.n-folder').mouseenter(function() {
		        		$(this).find('.f-modify').show();
		        	});
		        	$('.n-folder').mouseleave(function() {
		        		$(this).find('.f-modify').hide();
		        	});
		        },
		        error:function(request,status,error){   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			    });
		}
		
		/* 폴더 추가 버튼 클릭 → 텍스트 박스 열림 */
		$('#Addfolder').click(function(){
			var a = "";
			a += "<div class='row'>";
			a += "<div class='col-xs-10 n-folder'>";
			a += "<h5 class='ml-10 f-name'>";
			a += "&ensp;&ensp;<span class='f-count'style='margin-left:-1px;'>0</span>";
			a += "<input type='text' id='folname' required minlength='1' maxlength='12' style='width:200px;height:40px;margin-left:44px;margin-top:-25px;'placeholder='폴더명을 입력하세요' autofocus/>";
			a += "</h5></div>";
			a += "<div class='col-xs-2 icon'>";
			a += "<i class='far fa-bookmark icon-size' style='margin-left:11px;'></i>";
			a += "</div></div>";
			$('#scrap:last-child').append(a);
			/* 엔터 → 폴더 생성 */
			$("#folname").keypress(function(key){
				if(key.keyCode == 13){
					$(this).remove();
		            var a = "";
		                a += "<div class='row'>";
		                a += "<div class='col-xs-10 n-folder'>";
		                a += "<h5 class='ml-10 f-name' id='folname'>";
		                a += "&ensp;&ensp;<span class='f-count' id='juwon' style='margin-left:-1px;'>0</span>";
		                a += "<span class='f-name' id='fname'>";
		                a += $(this).val();
		                a += "</span>"
		                a += "<span class='f-modify'>";
		                a += "<i class='fas fa-edit icon-size'></i>" 
		                a += "<i class='fas fa-trash icon-size'></i></span>"
		                a += "</h5></div>";
		                a += "<div class='col-xs-2 icon'>";
		                a += "<i class='far fa-bookmark icon-size' style='margin-left:11px;'></i>";
		                a += "</div></div>"; 
		                $('#scrap:last-child').append(a);
							$.ajax(
									{
							    url : "<%=request.getContextPath()%>/folder/insertfolder.json",
							    DataType :{},
							    type : "post",
							    data : {"folderName": $(this).val()},
							    success : function(data){
							    		folderlist();
							    },
							    error : function(){
							    		alert("제대로 들어가지 않는다.");
							    }
									});	 
				}	
			 });
		});
	});
	
/* 	$('.n-folder').mouseleave(function() {
		$(this).find('.f-modify').hide();
		$(this).find('.f-count').show();
	});
	$('.n-folder').mouseenter(function() {
		$(this).find('.f-modify').show();
		$(this).find('.f-count').hide();
	}); */
</script>