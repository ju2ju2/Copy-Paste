<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->

<div id="sidebar">

	<div class="inner">


		<!--정렬 -->
		<div class="form-group">
			<label for="sel1">Select list:</label> <select class="form-control"
				id="sel1">
				<option value="">정렬</option>
				<option value="ordernew">최신순</option>
				<option value="orderold">오래된순</option>
				<option value="ordersubject">주제별</option>
				<option value="orderpopular">참조순</option>
			</select>

			<div class="form-group">
				<div class="col-lg-10 col-sm-10">
					<span> <input type="text" class="form-control"
						placeholder="Search" />
					</span>
				</div>
				<button type="button" class="btn btn-success btn-sm">검색</button>
				<div>				
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