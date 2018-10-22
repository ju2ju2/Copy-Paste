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
		<!-- 미분류가 들어갈 공간 -->
		<div class="row" id="unclassified">
			
		</div>	
		
		<!-- 폴더 목록 뿌려질 공간 -->
		<div class="row" id="folder">
			
		</div>
		
		<!-- 스크랩이 들어갈 공간 -->
		<div class="row" id="scrap">
		
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
		        	
		        	var unclassified = "";
		        	var scrap="";
		        	var folder="";
		        	
					if(data != null) {
		        		$.each(data, function(key, value){
		        			console.log(">"+value.folderName+"<");
		        			if ((value.folderName).trim()!='미분류'&&(value.folderName).trim()!='스크랩'){
								folder += "<div class='col-xs-10 n-folder'>";
								folder += "<h5 class='ml-10 f-name'>";
								folder += "<span class='f-count'>";
								folder += 0
								folder += "</span>";
								folder += "<span class='f-name'>";
								folder += value.folderName+"</span>";
								folder += "<span class='f-modify' id='modify'>";
								folder += "<i class='fas fa-edit icon-size' id='folderEdit' onclick=folderEdit(this,'"+value.folderName+"')>";
								folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
								folder += "<i class='fas fa-trash icon-size' id='folderdelete' onclick=folderDelete('"+value.folderName+"');>";
								folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
								folder += "<div class='col-xs-2 icon'><i class='far fa-bookmark icon-size'></i></div>";
								$('#folder').append(folder);
								folder="";
							} 
     			
		        			if(value.folderName = "미분류"){
								$('#unclassified').empty();
								unclassified += "<div class='col-xs-10 n-folder'>";
								unclassified += "<h5 class='ml-10 f-name'>";
								unclassified += "<span class='f-count'>";
								unclassified += 0
								unclassified += "</span>";
								unclassified += "<span class='f-name'>";
								unclassified += value.folderName+"</span>";
								unclassified += "<span class='f-modify' id='modify'>";
								unclassified += "<i class='fas fa-edit icon-size' id='folderEdit' style='display: none;' onclick=folderEdit(this,'"+value.folderName+"')>";
								unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
								unclassified += "<i class='fas fa-trash icon-size' id='folderdelete' style='display: none;' onclick=folderDelete('"+value.folderName+"');>";
								unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
								unclassified += "<div class='col-xs-2 icon'><i class='fas fa-bookmark icon-size'></i></div>";
								$('#unclassified').append(unclassified);
								unclassified="";
							} 
		        			
		        			if (value.folderName = "스크랩"){
								$('#scrap').empty();
								scrap += "<div class='col-xs-10 n-folder'>";
								scrap += "<h5 class='ml-10 f-name'>";
								scrap += "<span class='f-count'>";
								scrap += 0
								scrap += "</span>";
								scrap += "<span class='f-name'>";
								scrap += value.folderName+"</span>";
								scrap += "<span class='f-modify' id='modify'>";
								scrap += "<i class='fas fa-edit icon-size' id='folderEdit' style='display: none;' onclick=folderEdit(this,'"+value.folderName+"')>";
								scrap += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
								scrap += "<i class='fas fa-trash icon-size' id='folderdelete' style='display: none;' onclick=folderDelete('"+value.folderName+"');>";
								scrap += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
								scrap += "<div class='col-xs-2 icon'><i class='far fa-bookmark icon-size' style='display: none;'></i></div>";
								$('#scrap').append(scrap);
								scrap="";
							} 
		        			 
		        			
									
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
		        error:function(request,status,error)
		        { alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
			    });
	
		
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
		                $('#folder:last-child').append(a);

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
	}
		
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