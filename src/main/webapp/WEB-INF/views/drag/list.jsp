<%-- drag>>
@JSP : list.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 드래그목록

@Date : 2018.10.12
@Author : 고은아
@Desc : 휴지통, 별 추가


--%>

<!-- 	private int dragNum;
	private int dragMark;
	private String userEmail;
	private String dragText;
	private String dragOrigin;
	private Date dragDate;
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/drag.js"></script>

<div class="d-container">
	<div class="d-inner">
		<!-- Section -->
		<section>
			<header class="major">
				<div id="target" ondrop="drop_handler(event);"
					ondragover="dragover_handler(event);">
					<h3>
						드래그 목록<i class="fas fa-trash icon-size"></i>
					</h3>
				</div>
			</header>

			<div class="row">
				<c:forEach items="${dragList}" var="dragList">
 			          
					<div class="col-xs-6 col-md-3">
						<div class="text-center">

							<!-- a HTML (Modal) -->
									
							<a data-toggle="modal"
								href="${pageContext.request.contextPath}/drag/dragDetail.htm?dragNum=${dragList.dragNum}"
								data-target="#modal-testNew" role="button"
								data-backdrop="static">
								<div class="dragitem">
									<div class="icon-right">
										<i class="far fa-star icon-size"></i>
									</div>
									<img class="img-rounded"
										src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
										alt="${dragList.dragText}" width="100%">
									<div class="caption">
										<i class="fa fa-plus" aria-hidden="true"></i>
									</div>
									<div>
										<h4>${dragList.dragOrigin}</h4>
										 <span>${dragList.dragDate}</span>
									</div>
								</div>
							</a>
							        
						</div>
					</div>
					
                        </c:forEach>
				
			</div>
		</section>
	</div>
</div>
<br>

<!-- Modal HTML -->
<div id="modal-testNew" class="modal fade text-center overlay"
	tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"drag/dragDetail.htm" file</div>
	</div>
</div>

