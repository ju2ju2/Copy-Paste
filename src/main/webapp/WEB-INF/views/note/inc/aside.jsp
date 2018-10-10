<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->

<div id="sidebar">

	<div class="inner">

		<!-- 정렬 -->
		<div class="form-group">
			<label for="sel1">Select list:</label> <select class="form-control"
				id="sel1">
				<option value="">정렬</option>
				<option value="dateold">오래된순</option>
				<option value="datenew">최신순</option>
				<option value="subject">주제별</option>
				<option value="popular">인기순</option>
			</select> <br>

			<div class="col-sm-8">
				<form method="post" action="#">
					<label>키워드로 검색</label> <input type="text" name="query" id="query"
						placeholder="Search" class=" form-control "></input>
				</form>
			</div>
			<div class="col-sm-4">
				<a class="" href="#">검색</a>
			</div>
		

		</div>



		<!-- Section -->
		<section>
			<header class="major">
				<h2>폴더 목록</h2>
			</header>
			<div class="mini-posts">
				<article>
					<a href="#" class="">이력서</a><br> <a href="#" class="">이직준비</a><br>
					<a href="#" class="">temp</a><br>
				</article>


			</div>

		</section>

	</div>
</div>


