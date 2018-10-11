<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : note aside부분 jsp
 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(function() {
		var dateFormat = "yyyy-mm-dd", //이거 지금 안 먹음
		fromDate = $("#fromDate")
				.datepicker(
						{
							defaultDate: "+1w",
					        changeMonth: true,
					        numberOfMonths: 1
						})
				.on("change", function() {
					toDate.datepicker( "option", "minDate", getDate( this ) );
				}),
				toDate = $("#toDate").datepicker({
					defaultDate: "+1w",
			        changeMonth: true,
			        numberOfMonths: 1
				})
				.on( "change", function() {
			        from.datepicker( "option", "maxDate", getDate( this ) );
			      });
		
		function getDate(element ) {
			var date;
		      try {
		        date = $.datepicker.parseDate( dateFormat, element.value );
		      } catch( error ) {
		        date = null;
		      }
		 
		      return date;
		}
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
	<!-- integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous" -->
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
		<!-- Sort -->

		<select name="sort-category" id="sort-category">
			<!-- style=" padding-bottom: 0px;    margin-bottom: 5px;    border-bottom-width: 1px;"  -->
			<option value="">- 정렬 분류 -</option>
			<option value="1">최신순</option>
			<option value="1">오래된 순</option>
			<option value="1">주제별</option>
			<option value="1">참조순</option>
		</select>

		<!-- Search -->
		<div>
			<div class="form-group">
				<div class="col-lg-12">
				<header class="major">
				<h2>키워드 검색</h2>
			</header>
			</div>
					<span><input type="text" id="search-text" placeholder="검색" />
					</span>
				<div class="col-xs-2"><a href="#"><i id="search" class="fas fa-search"  style="padding-top:15px"></i></a></div>
				<div>
			</div>
			<div class="form-group">
				<div class="col-lg-12">
				<header class="major">
				<h2>일자별 검색</h2>
			</header>
				<input type="text" id="fromDate" placeholder="검색 시작일을 입력해 주세요."><br/>
				<p>~</p>
				<input type="text" id="toDate" placeholder="검색 종료일을 입력해 주세요.">
				</div>
		</div>
		<div class="col-lg-12"><br/></div>
		<!-- Section -->
		<section>
			<header class="major">
				<h2>폴더 목록</h2>
			</header>
			<div>
				<article></article>
			</div>
		</section>
	</div>
</div>
</div>
</div>


