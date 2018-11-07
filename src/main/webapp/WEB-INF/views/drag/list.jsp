<%-- drag>>
@JSP : list.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 드래그목록

@Date : 2018.10.12
@Author : 고은아
@Desc : 휴지통, 별 추가

@Date : 2018.10.19
@Author : 문지은
@Desc : 드래그 목록보기, 상세보기


--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-container">
	<div class="d-inner">
		<!-- Section -->
		<section>
			<header id="droppable" class="major">
				<div>
					<h3>
						드래그 목록<i class="fas fa-trash icon-size"></i>
					</h3>
				</div>
			</header>
		</section>
		<!--드래그 리스트 영역 -->
		<div class="row" id="dragList"></div>
	</div>
</div>
<br>
<!-- top버튼 -->
<div><i class="fas fa-caret-up"  onclick="topFunction()" id="myBtn" title="Go to top"></i></div>
<!-- Modal HTML -->
<div id="modal-drag" class="modal fade text-center overlay"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"drag/dragDetail.htm" file</div>
	</div>
</div>

<p class="row"></p>




