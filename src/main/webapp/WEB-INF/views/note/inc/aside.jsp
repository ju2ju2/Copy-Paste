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
					<form method="post" action="#">
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
	<c:forEach items="${folderList}" var="folderList">
		<c:forEach items="${folderList.folderName}" var="folderName">
		<div class="row" id="scrap">
			<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">
					<span class="f-count">4</span>
					<span class="f-name">${folderName}</span>
					<span class="f-modify">
						<i class="fas fa-edit icon-size">
							<span class="f-name" id="fname" style="display: none;">${folderName}</span>
						</i> 
						<i class="fas fa-trash icon-size">
							<span class="f-name" id="fname" style="display: none;">${folderName}</span>
						</i>
					</span>
				</h5>
			</div>
			<div class="col-xs-2 icon">
				<i class="far fa-bookmark icon-size"></i>
			</div>
		</div>
		</c:forEach>
	</c:forEach>
	</div>
</div>
</nav>

<script type="text/javascript">
/* 폴더 추가 버튼을 눌렀을 때 텍스트 박스가 열리면서 폴더 명을 입력할 수 있는 칸이 열린다. */
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
	
	/* 엔터키를 치면 폴더가 생성된다. insert folder에 들어간다. */
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
				location.reload(); 
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
					    	location.reload(); 
					    }
							});	 
		}	
	 });
});

/* 폴더 삭제 */
$('.fa-trash').click(function(){
	var foldername = $(this).children('span').text();
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
				    DataType :{},
				    type : "get",
				    data : {"folderName": foldername},
				    success : function(data){
				    	location.reload();
				    },
				    error : function(){
				    	console.log("폴더 삭제 실패");
				    }
						})
		  } 
		}); 
});	 

/* 폴더 수정 */
$('.fa-edit').click(function(){
	var foldername = $(this).children('span').text();
	var a = "";
	a += "<h5 class='ml-10 f-name'>";
	a += "<span class='f-count'>4</span>";
	a += "<input type='text' id='folname' required minlength='1' maxlength='12' style='width:200px;height:40px;margin-left:25px;margin-top:-25px;' placeholder=";
	a += foldername;
	a += " autofocus/ >";
	a += "</h5>";
	$(this).closest('h5').replaceWith(a);
	
	/* 엔터키를 치면 업데이트가 된다. */
	$("#folname").keypress(function(key){
		if(key.keyCode == 13){
					$.ajax(
							{
					    url : "<%=request.getContextPath()%>/folder/updatefolder.json",
					    DataType :{},
					    type : "post",
					    data : {"beforefolderName": foldername,
					    		"folderName" : $(this).val()},
					    success : function(data){
					    	location.reload();
					    	console.log("폴더 수정 성공");
					    },
					    error : function(){
					    	console.log("폴더 수정 삭제");
					    	location.reload();
					    	
					    }
							});	 
		}	
	 });
});	 

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
		
	/* 스크랩 아이콘 토글  */
	$('.fa-bookmark').click(function() {
		if ($(this).hasClass('far')) {
			$('.fa-bookmark').removeClass('fas').addClass('far');
			$(this).removeClass('far').addClass('fas');
		}
	});


	/* 폴더 수정 및 삭제 아이콘 토글 */
	$(document).ready(function() {
		$(this).find('.f-modify').hide();
	});
	$('.n-folder').mouseenter(function() {
		$(this).find('.f-modify').show();
	});
	$('.n-folder').mouseleave(function() {
		$(this).find('.f-modify').hide();
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