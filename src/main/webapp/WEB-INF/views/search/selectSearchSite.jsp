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
		<option value="SJ00">기타</option>
		<option value="SJ01">회사</option>
		<option value="SJ02">생활</option>
		<option value="SJ03">교육</option>
	</select>
	</div>

	<!-- Search -->
	<div class="col-sm-10  no-margin">
	<section id="subject-search" class="alt">
		<form method="post" action="#">
			<input type="text" name="query" id="searchinsite-text" placeholder="검색어를 입력해 주세요." />
			<a href="#"><i id="searchinsite" class="fas fa-search icon-size"  style="padding-top:15px"></i></a>
		</form>		
	</section>
	</div>
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
	<div class="searchList" id="searchList">
		<!-- 검색 결과가 뿌려질 공간 -->

	
	
	
	</div>
	</section>

<br>
</div>
</div>


