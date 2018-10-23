<%-- main>>
@JSP : main.jsp
@Date : 2018.10.09
@Author : 우나연, 임지현, 이주원
@Desc : 메인 인덱스 페이지 
		+ 날씨 API (임지현, 이주원 - 10월 12일)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>


</script>
<!-- banner start -->
<!-- ================ -->
<div id="banner" class="banner">
	<div class="banner-image"></div>
	<div class="banner-caption">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 object-non-visible"
					data-animation-effect="fadeIn">
					<h1 class="text-center"
						onclick="document.getElementById('subscribe').style.display='block;'"
						data-toggle="modal" data-target="#myModal">
						COPY & <span>PASTE</span>
					</h1>
					<p class="lead text-center ">
						<!-- data-toggle="modal" data-target="#myModal"  -->
						<a href="${pageContext.request.contextPath}/login.htm"
							onclick="document.getElementById('subscribe').style.display='block'"
							class="typewrite" data-period="2000"
							data-type='[ "드래그가 글이 되는 공간, COPY&PASTE. ", "로그인을 해주세요 :)   ", "Click Click !   " ]'>
							<span class="wrap"></span>
						</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- banner end -->

<div class="jumbotron">
	<div class="container text-center">
		<div>
			<div class="weatherApi">
				<div class="circle"></div>
				<!-- 날씨 API 영역 -->
				<div class="temper"></div>
			</div>
		</div>
	</div>
</div>

<div class="container">
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
</div>
<div class="container">
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
</div>
<br>
<div class="container">
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
</div>
<div class="container">
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
<br><br><br>

<!-- Modal HTML -->
<div id="modal-testNew" class="modal fade text-center overlay"
	 role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"note/noteDetail.htm" file</div>
	</div>
</div>
