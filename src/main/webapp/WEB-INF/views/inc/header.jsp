<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<!-- logo -->
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/index.htm"
				style="display: inline-block;"> <img
				src="resources/image/logo.png" class="logo" alt="logo"
				style="display: inline-block;"> COPY&PASTE
			</a>
		</div>
		<!-- nav menu -->
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<br>
				<li><a href="${pageContext.request.contextPath}/about.htm">ABOUT</a></li>
				
				<li><a href="<c:url value="/login.htm" />">LOGIN</a></li>
				<li><a href="${pageContext.request.contextPath}/signup.htm">SIGN UP</a></li>
			

				<!-- 스프링이 제공하는 spel jsp에서 사용할 수 있는 스크립트 언어 -->
				<!-- 유저권한일때 -->
				<se:authorize access="hasRole('ROLE_USER')">
					<li><a href="${pageContext.request.contextPath}/login.htm">LOGIN</a>
				</se:authorize>
				<se:authentication property="name" var="loginuser" />
				<se:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
					<li><a href="#">NOTE</a></li>
					<li><a href="#">MY DRAG</a></li>
					<li><a href="#">MY NOTE</a></li>
					<li class="dropdown"><a href="#" class="dropdown=toggle"
						data-toggle="dropdown"> SEARCH<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a href="/codelabs/darrrt/">사이트 검색</a></li>
							<li><a href="https://dartpad.dartlang.org">네이버 검색</a></li>
							<li><a href="/downloads/">구 글 검색</a></li>
						</ul></li>
					<li><a href="#">ME</a></li>
					<li><a href="${pageContext.request.contextPath}/login.htm"
						data-toggle="modal" data-target="#login-modal">LOGIN</a></li>


					<div class="modal fade" id="login-modal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
						style="display: none;">
						<div class="modal-dialog">
							<div class="loginmodal-container">
								<jsp:include page="${pageContext.request.contextPath}/login.htm" />
							</div>
						</div>
					</div>

					<li><a href="${pageContext.request.contextPath}/logout">
							(${loginuser})로그아웃</a></li>
				</se:authorize>
				<!-- ROLR_USER라면 -->
				<se:authorize access="!hasRole('ROLE_USER')"></se:authorize>
				<!-- ROLR_USER아니라면 -->



			</ul>
		</div>
	</div>
	<hr style="margin: 30px; border-top-width: 2px; border-color: #f56a6a;" />
</nav>

