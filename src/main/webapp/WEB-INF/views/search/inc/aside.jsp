<!-- search>>inc
@JSP : aside.jsp
@Date : 2018.10.10
@Author : 임효진
@Desc : search aside부분 jsp
 -->
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<se:authentication property="name" var="loginuser" />
<se:authentication property="authorities" var="role" />

<!-- Sidebar -->
<nav id="navscroll">
<div id="sidebar">
	<div class="inner">
			<div class="tab-content">
				<!-- 1. 드래그 목록 -->
				<input type="hidden" id="loginUser" value="${loginuser}">
				<div id="drag" class="tab-pane fade in active">
					<div class="row">
						<div class="form-group">
							<!-- 드래그정렬 -->
							<div class="col-xs-12">
								<select name="sort-category" id="sort-category" class="text" >
									<option value="">- 정렬 분류 -</option>
									<option value="dragNumDesc">최신순</option>
            						<option value="dragNumAsc">오래된 순</option>
            						<option value="dragMark">중요표시 있는 순</option>
           						  	<option value="binary(dragText)">가나다순</option>
           							<option value="">전체보기</option>
									</select>
							</div>
							<!-- 드래그검색 -->
							<section id="subject-search" class="alt">
								<div class="col-xs-12">
									<form method="get" action="#">
										<input type="text" id="search-text" placeholder="검색" class="text" /> <a
											href="#"><i id="searchdrag" class="fas fa-search icon-size" title="검색"
											style="padding-top: 15px"></i></a>
									</form>
								</div>
							</section>
						</div>
					</div>
					<section>
						<br>
						<header class="major" id="droppable">
							<h2>
								드래그 목록<i class="fas fa-trash icon-size" title="드래그 삭제"></i>
							</h2>
						</header>
						<!-- 드래그목록 -->
						<div class="mini-posts" id="dragList"></div>
					</section>
				</div>
			</div>
		</div>
	</div>
</nav>

