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
		<div class="row" id="dragList">

	<%-- 		<c:forEach items="${dragList}" var="dragList">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
					<div class="text-center dragDiv mt-10" id="'+value.dragNum+'">
						<blockquote class="grapefruit">
							<!-- 별 아이콘 -->
							<div class="icon-right starDiv" id="starMark">

								<c:choose>
									<c:when test="${dragList.dragMark==1}">

										<br>
										<i class="fas fa-star icon-size" id="starDrag"
											onclick=removeDragMark(${dragList.dragNum})></i>
									</c:when>
									<c:otherwise>

										<br>
										<i class="far fa-star icon-size" id="starDrag"
											onclick=setDragMark(${dragList.dragNum})></i>
									</c:otherwise>
								</c:choose>
							</div>

							<div class="dragContent">
								<!-- 모달 창 -->
								<div class="drag-a">
									<a data-toggle="modal"
										href="../drag/dragDetail.htm?dragNum=${dragList.dragNum}'"
										data-target="#modal-drag" role="button" data-backdrop="static">
										<div id="dragContent">${dragList.dragText}</div> <code>
											<span id="dragOrigin" class="Cgrapefruit">출처 :
												${dragList.dragOrigin}</span> <span id="dragDate">${dragList.dragDate}</span>
										</code> <input type="hidden" id="dragNum" class="dragNum"
										value="${dragList.dragNum}"> <input type="hidden"
										id="dragMark" class="dragMark" value="${dragList.dragMark}">
									</a>
								</div>
							</div>
						</blockquote>
					</div>
				</div>
			</c:forEach> --%>
		</div>
	</div>
</div>
<br>
<!-- top버튼 -->
<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-angle-double-up" ></i></button>
<!-- Modal HTML -->
<div id="modal-drag" class="modal fade text-center overlay"
	role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"drag/dragDetail.htm" file</div>
	</div>
</div>

<p class="row"></p>




