<!-- note>>
@JSP : list.jsp
@Date : 2018.10.09
@Author : 우나연, 임효진
@Desc : note 목록 페이지.
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="n-container">
	<div class="n-inner">
		<!-- Section -->
		<section id="droppable">
			<header class="major">
				<h3 id="fName">
					My Note <i class="fas fa-trash icon-size"></i> 
				</h3>
			</header>
		</section>
		
		<!-- 노트리스트 출력 -->
		<div class="row" id="noteList"></div>
	</div>
</div>
<br>
<!-- top버튼 -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<!-- Modal HTML -->
<div id="modal-testNew" class="modal fade text-center overlay" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"note/noteDetail.htm" file</div>
	</div>
</div>
