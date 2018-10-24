<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 			<c:forEach items="${dragList}" var="dragList">

					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
						<div class="text-center dragDiv mt-10">

							<blockquote class="grapefruit">
								<!-- 별 아이콘 -->
								<div class="icon-right starDiv">
									<br> <i class="far fa-star icon-size"></i>
								</div>
								<div class="dragContent">

									<!-- 모달 창 -->
									<div class="drag-a">
										<a data-toggle="modal"
											href="${pageContext.request.contextPath}/drag/dragDetail.htm?dragNum=${dragList.dragNum}"
											data-target="#modal-drag" role="button"
											data-backdrop="static">
											<p>${dragList.dragText}</p> <code>&lt;출처 : <span class="Cgrapefruit">${dragList.dragOrigin}</span>&gt;
												<span>${dragList.dragDate}</span>
											</code> <input type="hidden" id="dragNum" class="dragNum"
											value="${dragList.dragNum}">
										</a>
									</div>
								</div>
							</blockquote>
						</div>
					</div>
				</c:forEach> 

