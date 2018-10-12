<!-- 
* @ jsp : aside.jsp (write)
* @ Date : 2018.10.11
* @ Author : 고은아, 임효진(노트 폴더목록 아코디언만)
* @ Desc : 노트 작성을 위해 들어오는 페이지 내 좌측 네브
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
			<!-- 검색 -->
			<div id="search row" class="alt">
				<div class="col-xs-10">
						<form method="post" action="#">
							<input type="text" id="search-text" placeholder="검색" />
						</form>
				</div>
				<div class="col-xs-2">
					<a href="#"><i id="search" class="fas fa-search"></i></a>
				</div>
			</div>
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
			<br>

			<table>
			<tr>
			<td class="t-content">
				<header class="major">
					<h3 class="h-table">노트 폴더 목록 </h3>
				</header>
			</td>
			<td class="t-icon">
				<i class="far fa-trash-alt"></i>
			</td>
			</tr>
			</table>
			
			<div class="row">
				<div class="col-xs-10">
				<button class="accordion">미분류</button>
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
				<div class="col-xs-2 icon">
					<i class="fas fa-bookmark"></i>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-10">
				<button class="accordion">폴더 1</button>
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
				<div class="col-xs-2 icon">
					<i class="far fa-bookmark"></i>
				</div>
			</div>	
				
			</div>
			
			<div class="row">
				<div class="col-xs-10">
				<button class="accordion">스크랩</button>
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
				<div class="col-xs-2 icon">
				</div>
			</div>	
				
			</div>
			<!-- myNote 끝 -->
			
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
</body>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("a-active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>

