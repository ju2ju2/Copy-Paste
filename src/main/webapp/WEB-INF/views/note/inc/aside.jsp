<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진(노트 폴더목록만)
@Desc : note aside부분 jsp
 -->
 
 <!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.23
@Author : 이주원
@Desc :  1. 폴더 목록 [미분류][사용자 추가 폴더][스크랩] 순으로 뿌림. 북마크 토글 기능 가능.
		 2. 폴더를 클릭하면 
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
				<option value="n.noteDate">최신 순</option>
				<option value="n.noteDate">오래된 순</option>
				<option value="n.noteTitle">가나다 순</option>
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
function folderDelete(folderName, defaultFolder){
	if(defaultFolder==1){
		swal({
			  title: "기본 폴더는 삭제할 수 없습니다.",
			  text: "",
			  type: "info",
			  confirmButtonClass: "btn-danger",
			  confirmButtonText: "OK",
			  showCancelButton: false
			})
	}else{
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
								  type: "error",
								  confirmButtonClass: "btn-danger",
								  confirmButtonText: "OK",
								  showCancelButton: true
								});
					    }
							});
			  }
			});
	}
	
}

/* 폴더 수정 */
function folderEdit(fedit, folderName, count){
	var a = "";
	a += "<h5 class='ml-10 f-name'>";
	a += "<span class='f-count'>";
	a += count;
	a += "</span>";
	a += "<input type='text' id='folname' required minlength='1' maxlength='8' style='width:200px;height:40px;margin-left:25px;margin-top:-25px;' placeholder=";
	a += folderName;
	a += " autofocus/ >";
	a += "</h5>";
	$(fedit).closest('h5').replaceWith(a);

	/* 엔터키 → 폴더명 수정 */
	$("#folname").keypress(function(key){
		if(key.keyCode == 13){
			 {
				$.ajax(
							{
					    url : "<%=request.getContextPath()%>/folder/updatefolder.json",
					    DataType :"text",
					    type : "post",
					    data : {"beforefolderName": folderName,
					    		"folderName" : $(this).val(),
					    		"count" : count},
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
					
		}
	 });
}

/* 디폴트폴더 설정 */
function setDefaultFolder(bookmark, folderName){

 /* 스크랩 아이콘 토글 
	fas → 디폴트 폴더 O
	far → 디폴트 폴더 X
 $('.fa-bookmark').click(function() {
		if ($(this).hasClass('far')) {
			    	$('.fa-bookmark').removeClass('fas').addClass('far');
        			$(this).removeClass('far').addClass('fas');	
			    }
	});   */
	 
	$.ajax(
			{
	    url : "<%=request.getContextPath()%>/folder/setDefaultFolder.json",
	    DataType :"text",
	    type : "post",
	    data : {"beforefolderName": $('#bookmarkO').text(),
	    		"folderName" : folderName},
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

/* 폴더에 들어있는 콘텐츠 뿌리기 */
function folderContents(folder,folderName){
	$.ajax(
			{
	    url : "<%=request.getContextPath()%>/note/selectNoteByFolder.json",
	    DataType :"json",
	    type : "post",
	    data : {"folderName" : folderName},
	    success : function(data){
	    	 if(data != null) {
		      		var b = "";
		      		var c = "";
		      		$.each(data, function(key, value){
			      		$('#fName').empty();
		      			c+=value.folderName
		      			c+='<i class="fas fa-trash icon-size"></i>';
		      			$('#fName').append(c);
		      			c="";
		      			$('#foldernoteList').empty();	
		      			b+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
		      			b+='<div class="text-center">';
		      			b+='<a data-toggle="modal"';
		      			b+='href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum='+value.noteNum+'&cmd=mynote"';
		      			b+='data-target="#modal-testNew" role="button" data-backdrop="static">';
		      			b+='<div class="item">';
		      			b+='<img class="img-rounded"';
		      			b+='src="'+value.noteThumnail+'"';
		      			b+='alt="'+value.noteTitle+'" width="100%">';
		      			b+='<div class="caption">';
		      			b+='<i class="fa fa-plus" aria-hidden="true"></i>';
		      			b+='</div>';
		      			b+='</div>';
		      			b+='<div>';
		      			b+='<h4>'+value.noteTitle+'</h4>';
		      			b+='<strong>'+value.userNick+'</strong><span>'+value.noteDate+'</span>';
		      			b+='</div>';
		      			b+='</a>';
		      			b+='</div>';
		      			b+='</div>';
		      			/* $("div[alt='"+value.folderName+"']").find("#foldernoteList").html(b); */
		      			$('#foldernoteList').append(b);
		      		});

		      	}
	    	

	    },
	    error : function(){
	    	swal({
				  title: "폴더 내용을 가져오는데 실패했습니다.",
				  text: "",
				  type: "warning",
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "OK",
				  showCancelButton: true
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
		        			console.log(value.folderName);
		        			/* 일반 폴더 출력 */
		        			if ((value.folderName).trim()!='미분류'&&(value.folderName).trim()!='스크랩'){
								folder += "<div class='col-xs-10 n-folder'>";
								folder += "<h5 class='ml-10 f-name'>";
								folder += "<span class='f-count'>";
								folder += value.count
								folder += "</span>";
								folder += "<span class='f-name'><a href='#' onclick=folderContents(this,'"+value.folderName+"')>";
								folder += value.folderName+"</a></span>";
								folder += "<span class='f-modify' id='modify'>";
								folder += "<i class='fas fa-edit icon-size' id='folderEdit' onclick=folderEdit(this,'"+value.folderName+"','"+value.count+"')>";
								folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
								folder += "<i class='fas fa-trash icon-size' id='folderdelete' onclick=folderDelete('"+value.folderName+"','"+value.defaultFolder+"');>";
								folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
								$('#folder').append(folder);
								if(value.defaultFolder==1){
									folder = "";
									folder += "<div class='col-xs-2 icon'><i class='fas fa-bookmark icon-size' id='bookmarkO' onclick=setDefaultFolder(this,'"+value.folderName+"');>";
									folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></div>";
									$('#folder').append(folder);
									
								}else{
									folder = "";
									folder += "<div class='col-xs-2 icon'><i class='far fa-bookmark icon-size' id='bookmarkX' onclick=setDefaultFolder(this,'"+value.folderName+"');>";
									folder += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></div>";
									$('#folder').append(folder);
									
								}
								folder="";
							} 
		        			/* 미분류 폴더 출력 */
		        			if(value.folderName == "미분류"){
								$('#unclassified').empty();
								unclassified += "<div class='col-xs-10 n-folder'>";
								unclassified += "<h5 class='ml-10 f-name'>";
								unclassified += "<span class='f-count'>";
								unclassified += value.count
								unclassified += "</span>";
								unclassified += "<span class='f-name'><a href='#' onclick=folderContents(this,'"+value.folderName+"')>";
								unclassified += value.folderName+"</a></span>";
								unclassified += "<span class='f-modify' id='modify'>";
								unclassified += "<i class='fas fa-edit icon-size' id='folderEdit' style='display: none;' onclick=folderEdit(this,'"+value.folderName+"')>";
								unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i>";
								unclassified += "<i class='fas fa-trash icon-size' id='folderdelete' style='display: none;' onclick=folderDelete('"+value.folderName+"','"+value.defaultFolder+"');>";
								unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></span></h5></div>";
								$('#unclassified').append(unclassified);
								
								if(value.defaultFolder==1){
									console.log(">>폴더명<<"+value.folderName+">>폴더 상태<<"+value.defaultFolder+">>삭제 가능 여부<<"+value.candelete);
									unclassified = "";
									unclassified += "<div class='col-xs-2 icon'><i class='fas fa-bookmark icon-size' id='bookmarkO' onclick=setDefaultFolder(this,'"+value.folderName+"');>";
									unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></div>";
									$('#unclassified').append(unclassified);
									unclassified = "";
								}else{
									unclassified = "";
									unclassified += "<div class='col-xs-2 icon'><i class='far fa-bookmark icon-size' id='bookmarkX' onclick=setDefaultFolder(this,'"+value.folderName+"');>";
									unclassified += "<span class='f-name' id='fname' style='display: none;'>"+value.folderName+"</span></i></div>";
									$('#unclassified').append(unclassified);
									unclassified = "";
								}
								unclassified="";
							} 
		        			
		        			if (value.folderName=="스크랩"){
								$('#scrap').empty();
								scrap += "<div class='col-xs-10 n-folder'>";
								scrap += "<h5 class='ml-10 f-name'>";
								scrap += "<span class='f-count'>";
								scrap += value.count
								scrap += "</span>";
								scrap += "<span class='f-name'><a href='#' onclick=folderContents(this,'"+value.folderName+"')>";
								scrap += value.folderName+"</a></span>";
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
							    		location.reload();
							    },
							    error : function(){
							    	swal({
										  title: "이미 존재하는 폴더명입니다.",
										  text: "",
										  type: "info",
										  confirmButtonClass: "btn-danger",
										  confirmButtonText: "OK",
										  showCancelButton: false
										})
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
