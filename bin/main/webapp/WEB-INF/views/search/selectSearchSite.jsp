<%-- search>>
@JSP : selectSearchSite.jsp
@Date : 2018.10.10
@Author : 임효진
@Desc : 사이트 검색 화면입니다. 사이트 내 노트 검색이 가능하며, 검색한 내용을 스크랩 혹은 드래그 가능.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="s-container">
<div class="s-inner">
	<!-- 정렬 -->
	<div class="row no-margin">
	<div class="col-xs-2">
	<select name="subject-category" id="subject-category">
		<option value="">- 주제 선택 -</option>
		<option value="1">뭔가</option>
		<option value="1">있을</option>
		<option value="1">것</option>
		<option value="1">이다</option>
	</select>
	</div>

	<!-- Search -->
	<div class="col-sm-10  no-margin">
	<section id="subject-search" class="alt">
		<form method="post" action="#">
			<input type="text" name="query" id="search-text" placeholder="검색어를 입력해 주세요." />
			<a href="#"><i id="search" class="fas fa-search"  style="padding-top:15px"></i></a>
		</form>		
	</section>
	</div>
		
	<!-- Radio -->
	<div class="radio">
		<form method="post" action="#">
				<input type="radio" id="radio-sub" name="demo-priority" checked>
				<label for="radio-sub">제목</label>
				<input type="radio" id="radio-content" name="demo-priority">
				<label for="radio-content">내용</label>
				<input type="radio" id="radio-sub-content" name="demo-priority">
				<label for="radio-sub-content">제목+내용</label>
		</form>	
	</div>		
	<br>
	
	<!-- Section -->	
	<section>	
		<header class="major">				
		<h3>검색 결과</h3>
		</header>
	<div class="row">
	<div class="blog">
		<div class="card text-center">
			<img class="card-img-top"
				src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
				alt="" width="100%">
			<div class="card-block">
				<h4>가을에 쓴 편지</h4>
				<span>음담패썰</span> <span>2018.08.30</span>
			</div>
		</div>
	</div>
	<div class="blog">
		<div class="card text-center">
			<img class="card-img-top"
				src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
				alt="" width="100%">
			<div class="card-block">
				<h4>가을에 쓴 편지</h4>
				<span>음담패썰</span> <span>2018.08.30</span>
			</div>
		</div>
	</div>
	<div class="blog">
		<div class="card text-center">
			<img class="card-img-top"
				src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
				alt="" width="100%">
			<div class="card-block">
				<h4>가을에 쓴 편지</h4>
				<span>음담패썰</span> <span>2018.08.30</span>
			</div>
		</div>
	</div>
	<div class="blog">
		<div class="card text-center">
			<img class="card-img-top"
				src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
				alt="" width="100%">
			<div class="card-block">
				<h4>가을에 쓴 편지</h4>
				<span>음담패썰</span> <span>2018.08.30</span>
			</div>
		</div>
	</div>
	<div class="blog">
		<div class="card text-center">
			<img class="card-img-top"
				src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
				alt="" width="100%">
			<div class="card-block">
				<h4>가을에 쓴 편지</h4>
				<span>음담패썰</span> <span>2018.08.30</span>
			</div>
		</div>
	</div>	
	</div>
	</section>

<br>
	</div>
</div>
