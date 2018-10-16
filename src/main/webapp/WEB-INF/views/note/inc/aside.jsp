<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진(노트 폴더목록만)
@Desc : note aside부분 jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav>
<div id="sidebar">
<div class="inner">
	<div class="row mb">
	<div class="form-group">
		<!-- Sort -->
		<div class="form-group">
			<select name="sort-category" id="sort-category">
				<option value="">&ensp;&ensp;정 렬</option>
				<option value="1">최신순</option>
				<option value="1">오래된 순</option>
				<option value="1">주제별</option>
				<option value="1">참조순</option>
			</select>
		</div>
		<!-- Search -->
		<div>
			<div class="form-group">
				<label> &ensp;&ensp;키워드 검색</label>
				<div class="row">
					<div class="col-xs-10">
						<input type="text" id="search-text" placeholder="검색" />
					</div>
					<div class="col-xs-2">
						<a href="#"><i id="search" class="fas fa-search"
							style="padding-top: 15px"></i></a>
					</div>
				</div>
				<label>&ensp;&ensp;일자별 검색</label>
				<div class="row searchCal">
					<div class="col-xs-6">
						<input type="text" id="fromDate" placeholder="  시작일">
					</div>
					<div class="col-xs-6">
						<input type="text" id="toDate" placeholder="  종료일">
					</div>
				</div>
			</div>
		</div>
		
		<!-- Section -->
			<table>
			<tr>
			<td class="t-content">
				<header class="major">
					<h3 id="h-inline">노트 폴더 목록 </h3>
				</header>
			</td>
			<td class="t-icon">
					<i class="fas fa-folder-plus"></i>
			</td>
			</tr>
			</table>
			
			<div class="row">
				<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">미분류
					&nbsp;
					<span class="f-count">20</span>
					<span class="f-modify">
						<i class="fas fa-edit"></i>
						<i class="fas fa-trash"></i>
					</span>				
				</h5>

			</div>
			<div class="col-xs-2 icon">
				<i class="fas fa-bookmark icon-size"></i>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">
					<span class="f-count">4</span> 폴더 1 <span class="f-modify">
						<i class="fas fa-edit icon-size"></i> <i class="fas fa-trash icon-size"></i>
					</span>

				</h5>
				</div>
				<div class="col-xs-2 icon">
					<i class="far fa-bookmark"></i>					
				</div>
			</div>	
			
			<div class="row">
				<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">폴더 2ddd
					&nbsp;
					<span class="f-count">8</span>
					<span class="f-modify">
						<i class="fas fa-edit"></i>
						<i class="fas fa-trash"></i>
					</span>				
				</h5>
				</div>
				<div class="col-xs-2 icon">
					<i class="far fa-bookmark"></i>					
				</div>
			</div>	
			
			<div class="row">
				<div class="col-xs-10 n-folder">
				<h5 class="ml-10 f-name">스크랩
					&nbsp;
					<span class="f-count">0</span>
					<span class="f-modify">
						<i class="fas fa-edit"></i>
						<i class="fas fa-trash"></i>
					</span>				
				</h5>
				</div>
				<div class="col-xs-2 icon">
				</div>
			</div>	
		
	</div>
</div>
</nav>

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