<%-- search>>
@JSP : selectSearchSite.jsp
@Date : 2018.10.10
@Author : 임효진
@Desc : 사이트 검색 화면입니다. 사이트 내 노트 검색이 가능하며, 검색한 내용을 스크랩 혹은 드래그 가능.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="s-container">
	<div class="s-inner">
		<!-- 정렬 -->
		<div class="row no-margin">
			<input type="hidden" id="subjectName" value="${subjectName}">
			<div class="col-xs-2">
				<select name="subject-category" id="subject-category">
					<option value="all">- 주제 선택 -</option>
					<option value="기타">기타</option>
					<option value="회사">회사</option>
					<option value="생활">생활</option>
					<option value="교육">교육</option>
				</select>
			</div>

			<!-- Search -->
			<div class="col-sm-10  no-margin">
				<section id="subject-search" class="alt">
					<form method="post" action="#">
						<input type="text" name="keyword" id="searchinsite-text"
							placeholder="검색어를 입력해 주세요." /> <a><i
							id="searchinsite" class="fas fa-search icon-size"
							style="padding-top: 15px"></i></a>
					</form>
				</section>
			</div>
		</div>

		<!-- Radio -->
		<div class="radio">
			<form method="post" action="#" id="radiotag">
				<input type="radio" id="radio-sub" name="boundary" value="제목"
					checked> <label for="radio-sub">제목</label> <input
					type="radio" id="radio-content" value="내용" name="boundary">
				<label for="radio-content">내용</label> <input type="radio"
					id="radio-sub-content" value="제목+내용" name="boundary">
				<label for="radio-sub-content">제목+내용</label>
			</form>
		</div>
		<br>
		<!-- Section -->
		<section id="droppable">
			<header class="major">
				<h3>검색결과</h3>
			</header>
		</section>
		
		<!-- 노트리스트 출력 -->
		<div class="row" id="noteList"></div>
	</div>
</div>
<br>

<!-- top버튼 -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<!-- Modal HTML -->
<div id="modal-testNew" class="modal fade text-center overlay" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"note/noteDetail.htm" file</div>
	</div>
</div>

