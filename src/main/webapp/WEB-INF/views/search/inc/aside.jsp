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
			<!-- Sort -->
				<div class="col-sm-12">
					<select name="sort-category" id="sort-category">
						<!-- style=" padding-bottom: 0px;    margin-bottom: 5px;    border-bottom-width: 1px;"  -->
						<option value="">&ensp; - 정렬 -</option>
						<option value="1">최신순</option>
						<option value="1">오래된 순</option>
						<option value="1">중요표시 있는 순</option>
						<option value="1">중요표시 없는 순</option>
					</select>
				</div>
			<!-- /Sort -->
			<!-- Search -->
				<div id="subject-search" class="col-xs-12 alt">
					<form method="post" action="#" id="inline">
						<input type="text" id="search-text" placeholder="검색어를 입력해 주세요." />
						&nbsp;<a href="#"><i class="fas fa-search mt-10 icon-right"></i></a>
					</form>
				</div>
			<!-- /Search -->
		</div> <!-- /div class row -->
		
			<!-- Section -->
				<section>
					<header class="major">
						<br/><h3>드래그 목록 </h3>
					</header>
					
					<div class="mini-posts">
						<article>
							<a href="#" class="image img-rounded"><img
								src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
								alt="" 
								class="card-img-top img-rounded"/></a>
						</article>
						<article>
							<a href="#" class="image img-rounded"><img
								src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
								alt="" 
								class="card-img-top img-rounded"/></a>
						</article>
						<article>
							<a href="#" class="image img-rounded"><img
								src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
								alt="" 
								class="card-img-top img-rounded"/></a>
						</article>										
					</div>
					
					<ul class="actions">
						<li><a href="#" class="button">More</a></li>
					</ul>
				</section>
		<!-- Section 끝 -->
	</div>
</div>

