<!-- 
* @ jsp : aside.jsp (write)
* @ Date : 2018.10.11
* @ Author : 고은아, 임효진(aside(탭 제외))
* @ Desc : 노트 작성을 위해 들어오는 페이지 내 좌측 네브
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<div id="sidebar">
<div class="inner">

		<!-- 탭 -->
		<ul class="nav nav-tabs nav-justified" id="writeNoteNavUl">
			<li class="active">
				<a data-toggle="tab" href="#drag" class="writeNoteNavBtn">
				<i class="fas fa-mouse-pointer icon-li"></i></a></li>
			<li><a data-toggle="tab" href="#myNote" class="writeNoteNavBtn">
				<i class="fas fa-sticky-note icon-li"></i></a></li>
			<li><a data-toggle="tab" href="#inSiteSearch" class="writeNoteNavBtn">
				<i class="fas fa-search icon-li"></i></a></li>
			<li><a data-toggle="tab" href="#portalSearch" class="writeNoteNavBtn">
				<i class="fab fa-google icon-li"></i></a></li>
		</ul>
		<div class="mb"></div>
		<!-- 탭 내용 -->
		<div class="tab-content">
		<!-- 1. 드래그 목록 -->
		<div id="drag" class="tab-pane fade in active">
			<div class="row">
			<div class="form-group">
			<!-- Sort -->
			<div class="col-xs-12">
			<select name="sort-category" id="sort-category">  
				<option value="">- 정렬 분류 -</option>
				<option value="1">최신순</option>
				<option value="1">오래된 순</option>
				<option value="1">중요표시 있는 순</option>
				<option value="1">전체보기</option>
			</select>
			</div>
			<!-- Search -->
			<section id="subject-search" class="alt">
				<div class="col-xs-12">
					<form method="post" action="#">
						<input type="text" id="search-text" placeholder="검색" />
						<a href="#"><i id="search" class="fas fa-search icon-size"  style="padding-top:15px"></i></a>
					</form>
				</div>
			</section>
			</div>
			</div>		
			<!-- Section -->
			<section>
			<br>
			<header class="major">
				<h2>드래그 목록<i class="fas fa-trash icon-size"></i></h2>
			</header>
			<div class="mini-posts">
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a><i class="far fa-star icon-top icon-size"></i>
				</article>
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a><i class="far fa-star icon-top icon-size"></i>
				</article>
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a><i class="far fa-star icon-top icon-size"></i>
				</article>				
			</div>			
			</section>
		</div>
		
		<!-- 2. 마이노트 -->
		<div id="myNote" class="tab-pane fade">
			<div class="row">
			<div class="form-group">
				<!-- Sort -->
				<div class="col-xs-12">
				<select name="sort-category" id="sort-category" class="w-90">  
					<option value="">- 정렬 분류 -</option>
					<option value="1">최신순</option>
					<option value="1">오래된 순</option>
					<option value="1">중요표시 있는 순</option>
					<option value="1">전체보기</option>
				</select>
				</div>
				<!-- Search -->
				<section id="subject-search" class="alt">
					<div class="col-xs-12">
						<form method="post" action="#">
							<input type="text" id="search-text" placeholder="검색" />
							<a href="#"><i id="search" class="fas fa-search icon-size"  style="padding-top:15px"></i></a>
						</form>
					</div>
				</section>
			</div>
			</div>		
			<!-- Section -->
			<section>
			<br>
			<header class="major">
				<h2>노트 폴더 목록<i class="fas fa-trash icon-size"></i></h2>
			</header>
			<div class="row">
				<div class="col-xs-10 pt">
				<h5 class="accordion">미분류</h5>
					<div class="panel">
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
				<div class="col-xs-2 panel-margin">
					<i class="fas fa-bookmark icon-size"></i>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-10 pt">
				<h5 class="accordion">미분류</h5>
					<div class="panel">
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
				<div class="col-xs-2 panel-margin">
					<i class="far fa-bookmark icon-size"></i>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-10 pt">
				<h5 class="accordion">스크랩</h5>
					<div class="panel">
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
				<div class="col-xs-2 panel-margin">
				</div>
			</div>			

			
			</section>
		</div>	
		<!-- 3. 사이트 검색 -->
		<div id="inSiteSearch" class="tab-pane fade searchDiv">			
			<div class="row">
			<div class="form-group">
				<!-- Search -->
				<section id="subject-search" class="alt">
					<div class="col-xs-12">
						<form method="post" action="#">
							<input type="text" id="search-text" placeholder="검색" />
							<a href="#"><i id="search" class="fas fa-search icon-size"  style="padding-top:15px"></i></a>
						</form>
					</div>
				</section>
			</div>
			</div>
			<button type="button" class="btn btn-secondary searchBtn">
				<i class="fas fa-angle-double-right writeNoteNavSizeBtn"></i>
			</button>
		</div>

		<!-- 4. 포털 검색 -->
		<div id="portalSearch" class="tab-pane fade searchDiv">
			<div class="row">
			<div class="form-group">
				<!-- Search -->
				<section id="subject-search" class="alt">
					<div class="col-xs-12">
						<form method="post" action="#">
							<input type="text" id="search-text" placeholder="검색" />
							<a href="#"><i id="search" class="fas fa-search icon-size"  style="padding-top:15px"></i></a>
						</form>
					</div>
				</section>
			
			</div>
			</div>
			<button type="button" class="btn btn-secondary searchBtn">
				<i class="fas fa-angle-double-right writeNoteNavSizeBtn icon-size"></i>
			</button>
		</div>
	</div>
</div>
</div>


<script>
	/* 폴더 아코디언 */
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			this.classList.toggle("a-active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}

	/* 스크랩 아이콘 토글  */
	$('.fa-bookmark').click(function() {
		if ($(this).hasClass("far")) {
			$('.fa-bookmark').removeClass("fas").addClass("far");
			$(this).removeClass("far").addClass("fas");
		}
	})
	
	<!-- 별 아이콘 토글 -->
	$('.fa-star').click(function(){
		if($(this).hasClass('far')){
			$(this).removeClass('far').addClass('fas');
		} else {
			$(this).removeClass('fas').addClass('far');
		}
	})
</script>