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
				src="${pageContext.request.contextPath}/resources/image/logo.png" class="logo" alt="logo"
				style="display: inline-block;"> COPY&PASTE
			</a>
		</div>
		<!-- nav menu -->
		<div class="collapse navbar-collapse" id="myNavbar">
			

				<!-- 스프링이 제공하는 spel jsp에서 사용할 수 있는 스크립트 언어 -->	
				<!-- 회원 -->	
				<se:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
					<br>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/note/write.htm">NOTE</a></li>
					<li><a href="${pageContext.request.contextPath}/drag/drag.htm">MY DRAG</a></li>
					<li><a href="${pageContext.request.contextPath}/note/note.htm">MY NOTE</a></li>
					<li class="dropdown"><a href="#" class="dropdown=toggle"
						data-toggle="dropdown"> SEARCH<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a href="#">사이트 검색</a></li>
							<li><a href="#">네이버 검색</a></li>
							<li><a href="#"> 구 &ensp;글 검색</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath}/member/myinfo.htm">ME</a></li>
					
					<se:authentication property="name" var="loginuser" />
					<li><a href="${pageContext.request.contextPath}/logout">
							(${loginuser})로그아웃</a></li>
				</ul>
				</se:authorize>
						
				<!-- 관리자권한일때 -->
				<se:authorize access="hasRole('ROLE_ADMIN')">
				<ul id="anyUserNav" class="nav navbar-nav navbar-right">
					
					<li><a href="${pageContext.request.contextPath}/etc/admin.htm">ADMIN</a></li></li>
				</ul>	
				</se:authorize>
				<!-- 비회원일때 -->
				<se:authorize access="!hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
				<ul id="anyUserNav" class="nav navbar-nav navbar-right">
					<br>
					<li><a href="${pageContext.request.contextPath}/about.htm">ABOUT</a></li>
					<li><a href="${pageContext.request.contextPath}/login.htm">LOGIN</a></li>
					<li><a href="${pageContext.request.contextPath}/signup.htm">SIGN UP</a></li>
				</ul>
				
			</se:authorize>


			
		</div>
	</div>
	<hr style="margin: 30px; border-top-width: 2px; border-color: #f56a6a;" />
</nav>
