<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진(aside)
@Desc : note aside부분 jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<div id="sidebar">
<div class="inner">
	<div class="row">
	<div class="form-group">
		<!-- Sort -->
			<div class="col-xs-12">
			<select name="sort-category" id="sort-category">  
				<option value="">- 정렬 분류 -</option>
				<option value="1">최신순</option>
				<option value="1">오래된 순</option>
				<option value="1">중요표시 있는 순</option>
				<option value="1">중요표시 없는 순</option>
			</select>
			</div>
		<!-- Search -->
		<section id="subject-search" class="alt">
			<div class="col-xs-12">
					<form method="post" action="#">
						<input type="text" id="search-text" placeholder="검색" />
						<a href="#"><i id="search" class="fas fa-search"  style="padding-top:15px"></i></a>
					</form>
			</div>
		</section>
	</div>
	</div>	
		
		<!-- Section -->
		
		
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
	if($(this).hasClass('far')){
		$('.fa-bookmark').removeClass('fas').addClass('far');
		$(this).removeClass('far').addClass('fas');			
		}
	});

/* 폴더 수정 및 삭제 아이콘 토글 */
$('.n-folder').mouseleave(function(){
	$(this).find('.f-modify').hide();
	$(this).find('.f-count').show();	   
	});
$('.n-folder').mouseenter(function(){
	$(this).find('.f-modify').show();
	$(this).find('.f-count').hide();	 
	});
	
	
</script>