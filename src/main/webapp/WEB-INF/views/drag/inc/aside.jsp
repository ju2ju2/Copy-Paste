<!-- drag>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : drag aside부분 jsp

@Date : 2018.10.12
@Author : 고은아
@Desc : 세부 css 수정
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/drag-jquery-ui.theme.css" />

<!-- Sidebar -->

<div id="sidebar">
	<div class="inner">
		<!-- Sort -->
		<div class="form-group">
			<select name="sort-category" id="sort-category">
				<option value="">정렬 분류</option>
				<option value="1">전체보기</option>
				<option value="1">최신순</option>
				<option value="1">오래된 순</option>
				<option value="1">중요표시 있는 순</option>
				<option value="1">중요표시 없는 순</option>
			</select>
		</div>
		<!-- Search -->
		<div>
			<div class="form-group">
				<label> &ensp;&ensp;키워드 검색</label>
				<div class="row">
					<div class="col-xs-10">
						<input type="text" name="dragText" id="dragText"
							placeholder="검색" />
					</div>
					<div class="col-xs-2">
						<a href="#"><i id="search" class="fas fa-search"
							style="padding-top: 15px"></i></a>
					</div>
				</div>
				<br/>
				<label>&ensp;&ensp;일자별 검색</label>
				<div class="row searchCal">
					<div class="col-xs-12">
						<input type="text" id="fromDate" placeholder="검색 시작일">
					</div>
					<div id="fromToPTag"><p id="wave">~</p></div>
					<div class="col-xs-12">
						<input type="text" id="toDate" placeholder="검색 종료일">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		fromDate = $("#fromDate").datepicker({
			dateFormat : "yy-mm-dd",
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1
		}).on("change", function() {
			toDate.datepicker("option", "minDate", getDate(this));
		}), toDate = $("#toDate").datepicker({
			dateFormat : "yy-mm-dd",
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1
		}).on("change", function() {
			fromDate.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate("yy-mm-dd", element.value);
			} catch (error) {
				date = null;
			}

			return date;
		}
	});
</script>



