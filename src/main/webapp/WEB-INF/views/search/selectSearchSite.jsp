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
			<input type="text" name="query" id="searchinsite-text" placeholder="검색어를 입력해 주세요." />
			<a href="#"><i id="searchinsite" class="fas fa-search icon-size"  style="padding-top:15px"></i></a>
		</form>		
	</section>
	</div>
	</div>
		
	<!-- Radio -->
	<div class="radio">
		<form method="post" action="#">
				<input type="radio" id="radio-sub" name="demo-priority" value="제목" checked>
				<label for="radio-sub">제목</label>
				<input type="radio" id="radio-content"  value="내용" name="demo-priority">
				<label for="radio-content">내용</label>
				<input type="radio" id="radio-sub-content" value="제목+내용"  name="demo-priority">
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
		<!-- 인기글 목록 뿌려주기 -->
		<div>
		<h3>회사</h3>
	</div>
	<br>
	<div class="row">
		<c:forEach var="noteList" items="${bizNoteList}">
			<div class="col-xs-6 col-md-3">
				<div class="text-center">
					<!-- a HTML (to Trigger Modal) -->
					<a data-toggle="modal"
						href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum=${noteList.noteNum}"
						data-target="#modal-testNew" role="button" data-backdrop="static">
						<div class="item">
							<img class="img-rounded thumnail" id="thumnail"
								src="${noteList.noteThumnail}"
								alt="${noteList.noteTitle}" width="100%">
							<div class="caption">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div>
						</div>
						<div>
							<h4>${noteList.noteTitle}</h4>
							<strong>${noteList.userNick}</strong> <span>${noteList.noteDate}</span>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
	<div>
		<h3>생활</h3>
	</div>
	<br>
	<div class="row">
		<c:forEach var="noteList" items="${lifeNoteList}">
			<div class="col-xs-6 col-md-3">
				<div class="text-center">
					<!-- a HTML (to Trigger Modal) -->
					<a data-toggle="modal"
						href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum=${noteList.noteNum}"
						data-target="#modal-testNew" role="button" data-backdrop="static">
						<div class="item">
						<input class="noteNum" type="hidden" value="${noteList.noteNum}">
							<img class="img-rounded"
								src="${noteList.noteThumnail}"
								alt="${noteList.noteTitle}" width="100%">
							<div class="caption">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div>
						</div>
						<div>
							<h4>${noteList.noteTitle}</h4>
							<strong>${noteList.userNick}</strong> <span>${noteList.noteDate}</span>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
	<div>
		<h3>교육</h3>
	</div>
	<br>
	<div class="row">
		<c:forEach var="noteList" items="${eduNoteList}">
			<div class="col-xs-6 col-md-3">
				<div class="text-center">
					<!-- a HTML (to Trigger Modal) -->
					<a data-toggle="modal"
						href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum=${noteList.noteNum}"
						data-target="#modal-testNew" role="button" data-backdrop="static">
						<div class="item">
							<img class="img-rounded"
								src="${noteList.noteThumnail}"
								alt="${noteList.noteTitle}" width="100%">
							<div class="caption">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div>
						</div>
						<div>
							<h4>${noteList.noteTitle}</h4>
							<strong>${noteList.userNick}</strong> <span>${noteList.noteDate}</span>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
	<div>
		<h3>기타</h3>
	</div>
	<br>
	<div class="row">
		<c:forEach var="noteList" items="${etcNoteList}">
			<div class="col-xs-6 col-md-3">
				<div class="text-center">
					<!-- a HTML (to Trigger Modal) -->
					<a data-toggle="modal"
						href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum=${noteList.noteNum}"
						data-target="#modal-testNew" role="button" data-backdrop="static">
						<div class="item">
							<img class="img-rounded"
								src="${noteList.noteThumnail}"
								alt="${noteList.noteTitle}" width="100%">
							<div class="caption">
								<i class="fa fa-plus" aria-hidden="true"></i>
							</div>
						</div>
						<div>
							<h4>${noteList.noteTitle}</h4>
							<strong>${noteList.userNick}</strong> <span>${noteList.noteDate}</span>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	</div>
	</section>

<br>
</div>
</div>

<!-- Modal HTML -->
<div id="modal-testNew" class="modal fade text-center overlay" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"note/noteDetail.htm" file</div>
	</div>
</div>

