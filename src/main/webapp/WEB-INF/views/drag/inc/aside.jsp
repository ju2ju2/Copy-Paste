<!-- drag>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : drag aside부분 jsp

@Date : 2018.10.12
@Author : 고은아
@Desc : 세부 css 수정

@Date : 2018.10.15
@Author : 임효진
@Desc : aside 수정
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/drag-jquery-ui.theme.css" />
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
				<option value="1">중요표시 없는 순</option>
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
</div>
</div>