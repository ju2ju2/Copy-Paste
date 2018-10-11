<%--
@JSP : selectSearchSite.jsp
@Date : 2018.10.10
@Author : 임효진
@Desc : 사이트 검색 화면입니다. 사이트 내 노트 검색이 가능하며, 검색한 내용을 스크랩 혹은 드래그 가능.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="form-inline">
		<!-- 정렬 -->
		<select name="subject-category" id="subject-category">
			<option value="">- 주제 선택 -</option>
			<option value="1">뭔가</option>
			<option value="1">있을</option>
			<option value="1">것</option>
			<option value="1">이다</option>
		</select>

		<!-- Search -->
		<section id="subject-search" class="alt">
			<form method="post" action="#">
				<input type="text" name="query" id="query" placeholder="검색어를 입력해 주세요." />
			</form>
		</section>
		
		<!-- Radio -->
		<form method="post" action="#">
			<div class="col-4 col-12-small">
				<input type="radio" id="radio-sub" name="demo-priority" checked>
				<label for="radio-sub">제목</label>
			</div>
			<div class="col-4 col-12-small">
				<input type="radio" id="radio-content" name="demo-priority">
				<label for="radio-content">내용</label>
			</div>
			<div class="col-4 col-12-small">
				<input type="radio" id="radio-sub-content" name="demo-priority">
				<label for="radio-sub-content">제목+내용</label>
			</div>
		</form>													
	</div>


	<div>
		<h3>드래그 목록 </h3>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
	</div></div></div>
</div>

	<br>
	<div class="row">
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
</div>
<br>
</div>
