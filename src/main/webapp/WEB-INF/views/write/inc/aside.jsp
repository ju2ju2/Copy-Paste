<!-- 
* @ jsp : aside.jsp (write)
* @ Date : 2018.10.11
* @ Author : 고은아
* @ Desc : 노트 작성을 위해 들어오는 페이지 내 좌측 네브
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!-- Sidebar -->

<div id="sidebar">

	<div class="inner">
		
		<!-- 탭 -->
		<ul class="nav nav-tabs nav-justified" id="writeNoteNavUl">
		<li class="active"><a data-toggle="tab" href="#drag" class="writeNoteNavBtn"><i class="fas fa-mouse-pointer"></i></a></li>
		<li><a data-toggle="tab" href="#myNote" class="writeNoteNavBtn"><i class="fas fa-sticky-note"></i></a></li>
		<li><a data-toggle="tab" href="#inSiteSearch" class="writeNoteNavBtn"><i class="fas fa-search"></i></a></li>
		<li><a data-toggle="tab" href="#portalSearch" class="writeNoteNavBtn"><i class="fab fa-google"></i></a></li>
		</ul>
		
		<!-- 탭 내용 -->
		
		<!-- 드래그 목록 -->
		<div class="tab-content">
			<div id="drag" class="tab-pane fade in active">
			<br/>
			<section id="search" class="alt">
			<form method="post" action="#">
				<input type="text" name="query" id="query" placeholder="Search" />
			</form>
		</section>
			<header>
				<h2>드래그 목록</h2>
			</header>
			<div class="mini-posts">
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a>

				</article>
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a>

				</article>
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a>

				</article>
			</div>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
			</div>
			
			<!-- 아직 미구현한 탭 -->
			<div id="myNote" class="tab-pane fade">
			</div>
			
			<div id="inSiteSearch" class="tab-pane fade searchDiv">

			<button type="button" class="btn btn-secondary searchBtn">
			<i class="fas fa-angle-double-right writeNoteNavSizeBtn"></i>
			</button>

			</div>
			
			<div id="portalSearch" class="tab-pane fade searchDiv">

			<button type="button" class="btn btn-secondary searchBtn">
			<i class="fas fa-angle-double-right writeNoteNavSizeBtn"></i>
			</button>
			
			</div>
			
		</div>
	</div>
</div>


