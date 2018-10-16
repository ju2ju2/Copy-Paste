<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진(노트 폴더목록만)
@Desc : note aside부분 jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
						<a href="#"><i id="search" class="fas fa-search"  style="padding-top:15px"></i></a>
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
				노트 폴더 목록<i class="fas fa-folder-plus"></i>
			</h3>
		</header>
		<div class="row">
			<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">
					<span class="f-count">4</span> 폴더 1 <span class="f-modify">
						<i class="fas fa-edit"></i> <i class="fas fa-trash"></i>
					</span>
				</h5>
			</div>
			<div class="col-xs-2 icon">
				<i class="far fa-bookmark"></i>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">
					<span class="f-count">4</span> 폴더 1 <span class="f-modify">
						<i class="fas fa-edit"></i> <i class="fas fa-trash"></i>
					</span>
				</h5>
			</div>
			<div class="col-xs-2 icon">
				<i class="far fa-bookmark"></i>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">
					<span class="f-count">4</span> 폴더 1 <span class="f-modify">
						<i class="fas fa-edit"></i> <i class="fas fa-trash"></i>
					</span>
				</h5>
			</div>
			<div class="col-xs-2 icon">
				<i class="far fa-bookmark"></i>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">
					<span class="f-count">4</span> 스크랩 
				</h5>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
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