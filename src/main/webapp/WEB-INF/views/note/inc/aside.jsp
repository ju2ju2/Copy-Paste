<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진(노트 폴더목록만)
@Desc : note aside부분 jsp
 -->
 
 <!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.23
@Author : 이주원
@Desc :  1. 폴더 목록 [미분류][사용자 추가 폴더][스크랩] 순으로 뿌림. 북마크 토글 기능 가능.
		 2. 폴더를 클릭하면 
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav>
<div id="sidebar">
<div class="inner">
	<div class="row mb">
	<div class="form-group">
		<!-- Sort -->
			<div class="col-xs-12 mb">
			<select name="sort-category" id="sort-category">
				<option value="">- 정렬 분류 -</option>
				<option value="n.noteDate desc">최신 순</option>
				<option value="n.noteDate asc">오래된 순</option>
				<option value="binary(n.noteTitle)">가나다 순</option>
				<option value="n.noteNum">전체보기</option>
			</select>
			</div>
		<!-- Search -->
		<section id="subject-search" class="alt">

				<div class="col-xs-12">
				<label> &ensp;&ensp;키워드 검색</label>
					<form method="get" action="#">
						<input type="text" id="search-text" placeholder="검색" />
						<a href="#"><i id="search" class="fas fa-search icon-size" style="padding-top:15px"></i></a>
					</form>
				</div>

				<div class="searchCal">
				<div class="col-xs-12">
				<label>&ensp;&ensp;일자별 검색</label>
				</div>
					<div class="col-xs-6">
						<input type="text" id="fromDate" placeholder="시작일">
					</div>
					<div class="col-xs-6">
						<input type="text" id="toDate" placeholder="종료일">
					</div>
				</div>
			</section>
		</div>
		</div>

		<!-- Section -->
		<header class="major mb">
			<h3 id="h-inline">
				노트 폴더 목록<i class="fas fa-folder-plus icon-size" id="Addfolder"></i>
			</h3>
		</header>
		<!-- 미분류가 들어갈 공간 -->
		<div class="row" id="unclassified">

		</div>

		<!-- 폴더 목록 뿌려질 공간 -->
		<div class="row" id="folder">

		</div>

		<!-- 스크랩이 들어갈 공간 -->
		<div class="row" id="scrap">

		</div>
	</div>
</div>
</nav>

