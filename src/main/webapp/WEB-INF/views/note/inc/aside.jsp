<!-- note>>inc
@JSP : aside.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : note aside부분 jsp
 -->

 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">
		<!-- Sort -->
			
			<select name="sort-category" id="sort-category"   >  <!-- style=" padding-bottom: 0px;    margin-bottom: 5px;    border-bottom-width: 1px;"  -->
				<option value="">- 정렬 분류 -</option>
				<option value="1">최신순</option>
				<option value="1">오래된 순</option>
				<option value="1">주제별</option>
				<option value="1">참조순</option>
			</select>
	
		<!-- Search -->
		<div>
		  <div class="form-group">
				<div class="col-lg-10" >
					<span><input type="text" id="search-text"
						placeholder="검색" />
					</span>
				</div>
				<div class="col-xs-2"><a href="#"><i id="search" class="fas fa-search"  style="padding-top:15px"></i></a></div>
				<div>				
			</div>
		</div>
<br><br>
				<!-- Section -->
				<section>
					<header class="major">
						<h2>폴더 목록</h2>
					</header>
					<div>
						<article></article>
					</div>
				</section>
			</div>
		</div>
		</div>
	