<!-- drag>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : drag aside부분 jsp
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- Sidebar -->

<div id="sidebar">
	<div class="inner">
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
		<!-- 검색결과 -->
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

</div>



