<%--
@JSP : error.jsp
@Date : 2018.11.02
@Author : 우나연, 임지현
@Desc : error발생시 이동 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<%	response.setStatus(200); %>

	<div class="row">
		<div class="error">
			<div class="error-code m-b-10 m-t-20">
				<br><br>${requestScope['javax.servlet.error.status_code']}<br /><i class="fa fa-warning"></i>
			</div>
			<h3 class="font-bold">죄송합니다. 현재 에러가 발생했습니다.</h3>

			<div class="error-desc">
				존재하지 않는 주소를 입력하셨거나,<br>
				 요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.<br>
				 궁금한 점이 있으시면 언제든 고객센터를 통해 문의해 주시기 바랍니다.<br><br>
				 감사합니다.<br><br>
				
				<div>
					<button class=" login-detail-panel-button btn btn-danger"
						onclick="history.back()"> <i class="fa fa-arrow-left"></i>
						이전으로
					</button>
					<a href="${pageContext.request.contextPath}/index.htm">
					<button class=" login-detail-panel-button btn btn-danger">
						메인으로
					</button></a>
				</div>
			</div>
		</div>
	</div>
