<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : note aside부분 jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="sidebar">
	<div class="inner">
		<!-- Sort -->
		<div class="form-group">
			<select name="sort-category" id="sort-category">
				<!-- style=" padding-bottom: 0px;    margin-bottom: 5px;    border-bottom-width: 1px;"  -->
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
						<input type="text" id="fromDate" placeholder="시작일">
					</div>
					<div class="col-xs-6">
						<input type="text" id="toDate" placeholder="종료일">
					</div>
				</div>
			</div>

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


<script type="text/javascript">
	$(function() {
		var dateFormat = "yyyy-mm-dd", //이거 지금 안 먹음
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
		}
	});
</script>