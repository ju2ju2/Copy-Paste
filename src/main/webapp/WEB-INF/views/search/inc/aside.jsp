<!-- search>>inc
@JSP : aside.jsp
@Date : 2018.10.10
@Author : 임효진
@Desc : search aside부분 jsp
 -->
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<div id="sidebar">
<div class="inner">
	<div class="row">
	<div class="form-group">
		<!-- Sort -->
			<div class="col-xs-12">
			<select name="sort-category" id="sort-category">  
				<option value="">- 정렬 분류 -</option>
				<option value="1">최신순</option>
				<option value="1">오래된 순</option>
				<option value="1">중요표시 있는 순</option>
				<option value="1">중요표시 없는 순</option>
			</select>
			</div>
		<!-- Search -->
		<section id="subject-search" class="alt">
			<div class="col-xs-12">
					<form method="post" action="#">
						<input type="text" id="search-text" placeholder="검색" />
						<a href="#"><i id="search" class="fas fa-search"  style="padding-top:15px"></i></a>
					</form>
			</div>
		</section>
	</div>
	</div>		
		<!-- Section -->
		<section>
		<br>
			<header class="major">
				<h2>드래그 목록<i class="fas fa-trash"></i></span></h2>
			</header>
			<div class="mini-posts">
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a><i class="far fa-star icon-top"></i>
				</article>
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a><i class="far fa-star icon-top"></i>
				</article>
				<article>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a><i class="far fa-star icon-top"></i>
				</article>
			</div>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</section>
</div>
</div>


<script>
<!-- 별 아이콘 토글 -->
$('.fa-star').click(function(){
	if($(this).hasClass('far')){
		$(this).removeClass('far').addClass('fas');
	} else {
		$(this).removeClass('fas').addClass('far');
	}
})
</script>
