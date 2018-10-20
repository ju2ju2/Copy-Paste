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

			<div class="row" >
				<c:forEach items="${dragList}" var="dragList">
 			          
					<div class="col-xs-4 col-md-3 ">
						<div class="text-center dragDiv mt-10">
					
						<blockquote class="grapefruit">
							      <div class="dragContent">
   				    			  <!-- 별 아이콘 -->
							        <div class=" icon-right starDiv">
										<i class="far fa-star icon-size"></i>
									</div>
								<!-- 모달 창 -->
 								 <a data-toggle="modal"
								href="${pageContext.request.contextPath}/drag/dragDetail.htm?dragNum=${dragList.dragNum}"
								data-target="#modal-testNew" role="button"
								data-backdrop="static"> 
 								 <h1 id="mydrag"><span class="Cgrapefruit">MYDARG</span></h1>  
  								 <p>${dragList.dragText}</p>
								<code>
 									&lt;출처 : <span class="Cgrapefruit">${dragList.dragOrigin}</span>&gt;
      							 <span>${dragList.dragDate}</span></code></a>
					         		</div>
					        </blockquote>
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

