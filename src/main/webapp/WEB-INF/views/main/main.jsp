<%-- main>>
@JSP : main.jsp
@Date : 2018.10.09
@Author : 우나연, 임지현, 이주원
@Desc : 메인 인덱스 페이지 
		+ 날씨 API (임지현, 이주원 - 10월 12일)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

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
						<a href=""
							onclick="document.getElementById('subscribe').style.display='block'"
							data-toggle="modal" data-target="#myModal" class="typewrite"
							data-period="2000"
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
		<center>
		<div class="weatherApi">
			<div class="circle"></div>
			<!-- 날씨 API 영역 -->
			<div class="temper"></div>
		</div>
		</center>
	</div>
</div>

<div class="container bg-3">
	<div>
		<h3>주제1</h3>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<!-- a HTML (to Trigger Modal) -->
				<a data-toggle="modal"
					href="${pageContext.request.contextPath}/note/noteDetail.htm"
					data-target="#modal-testNew" role="button" data-backdrop="static">
					<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
				</a>
			</div>
			<!-- Modal HTML -->
			<div id="modal-testNew" class="modal fade text-center" tabindex="-1"
				role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Content will be loaded here from "note/noteDetail.htm" file -->
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<!-- a HTML (to Trigger Modal) -->
				<a data-toggle="modal"
					href="${pageContext.request.contextPath}/note/noteDetail.htm"
					data-target="#modal-testNew" role="button" data-backdrop="static" data-keyboard="false"> <!--  모달 외에 클릭시 닫기안함-->
					<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
				</a>
			</div>
			<!-- Modal HTML -->
			<div id="modal-testNew" class="modal fade text-center modal-backdrop" tabindex="-1"
				role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Content will be loaded here from "note/noteDetail.htm" file -->
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<!-- a HTML (to Trigger Modal) -->
				<a data-toggle="modal"
					href="${pageContext.request.contextPath}/note/noteDetail.htm"
					data-target="#modal-testNew" role="button" data-backdrop="static">
					<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
				</a>
			</div>
			<!-- Modal HTML -->
			<div id="modal-testNew" class="modal fade text-center" tabindex="-1"
				role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Content will be loaded here from "note/noteDetail.htm" file -->
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<!-- a HTML (to Trigger Modal) -->
				<a data-toggle="modal"
					href="${pageContext.request.contextPath}/note/noteDetail.htm"
					data-target="#modal-testNew" role="button" data-backdrop="static">
					<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
				</a>
			</div>
			<!-- Modal HTML -->
			<div id="modal-testNew" class="modal fade text-center" tabindex="-1"
				role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Content will be loaded here from "note/noteDetail.htm" file -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>









