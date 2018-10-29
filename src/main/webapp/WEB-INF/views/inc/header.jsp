<%-- inc>>
@JSP : header.jsp
@Date : 2018.10.09
@Author : 임지현, 우나연
@Desc : header 파일
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!-- 카카오 로그인 -->
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle mt-5"
				data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- logo -->
			<a class="navbar-brand active"
				href="${pageContext.request.contextPath}/index.htm"
				style="display: inline-block;"> <img
				src="${pageContext.request.contextPath}/resources/image/logo.png"
				class="logo" alt="logo" style="display: inline-block;">
				COPY&PASTE
			</a>
		</div>
		<!-- nav menu -->
		<div class="collapse navbar-collapse" id="myNavbar">
			<!-- 스프링이 제공하는 spel jsp에서 사용할 수 있는 스크립트 언어 -->
			<!-- 회원 -->
			<se:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
				<br>
				<ul class="nav navbar-nav navbar-right longnav">
					<li class="notewrite"><a
						href="${pageContext.request.contextPath}/note/write.htm">NOTE</a></li>
					<li><a href="${pageContext.request.contextPath}/drag/drag.htm">MYDRAG</a></li>
					<li><a href="${pageContext.request.contextPath}/note/note.htm">MYNOTE</a></li>
					<li class="dropdown"><a href="#" class="dropdown=toggle"
						data-toggle="dropdown"> SEARCH<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a
								href="${pageContext.request.contextPath}/etc/selectSearchSite.htm">사이트
									검색</a></li>
							<li><a
								href="${pageContext.request.contextPath}/etc/selectSearchNaver.htm">네이버
									검색</a></li>
							<li><a
								href="${pageContext.request.contextPath}/etc/selectSearchGoogle.htm">
									구 &ensp;글 검색</a></li>
						</ul></li>
					
					<!--프로필사진-->
					<se:authentication property="name" var="loginuser" />
					<li class="dropdown inline"><a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<img class="img-circle" alt="user" id="headerUserPhoto"><span>${loginuser}</span><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/member/myinfo.htm"><i class="far fa-user"></i><span>PROFILE</span></a></li>
					
					<!-- 관리자권한일때 -->
							<se:authorize access="hasRole('ROLE_ADMIN')">
								<li><a
									href="${pageContext.request.contextPath}/etc/admin.htm"><i class="fas fa-unlock-alt"></i> <span>ADMIN</span></a></li>
							</se:authorize>		
									
									
							<li>
								<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="POST">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									&nbsp;&ensp;<a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i>
									<span>LOGOUT</span></a>
								</form>
							</li>
							
							
		
						</ul>
					</li>
					
					<!-- 알람 -->
					<li class="dropdown"><a href="#"
						class="dropdown-toggle icon-menu" data-toggle="dropdown"> <i
							class="far fa-bell"></i> <span class="badge bg-danger">5</span>
					</a>
						<ul class="dropdown-menu notifications">
							<li><a href="#" class="notification-item"><span
									class="dot bg-warning"></span> '가을에 쓴 편지'에 댓글이 달렸습니다.</a></li>
							<li><a href="#" class="notification-item"><span
									class="dot bg-danger"></span> '가을에 쓴 편지'에 댓글이 달렸습니다.</a></li>
							<li><a href="#" class="notification-item"><span
									class="dot bg-success"></span> '가을에 쓴 편지'에 댓글이 달렸습니다.</a></li>
							<li><a href="#" class="notification-item"><span
									class="dot bg-warning"></span> '가을에 쓴 편지'에 댓글이 달렸습니다.</a></li>
							<li><a href="#" class="notification-item"><span
									class="dot bg-success"></span> '가을에 쓴 편지'에 댓글이 달렸습니다.</a></li>
							<li><a href="#" class="more">See all notifications</a></li>
						</ul></li>	
			</se:authorize>

							
			<!-- 비회원일때 -->
			<se:authorize access="!hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
				<ul id="anyUserNav" class="nav navbar-nav navbar-right">
					<br>
					<li><a href="${pageContext.request.contextPath}/about.htm">ABOUT</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> SEARCH<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/etc/selectSearchSite.htm">사이트
									검색</a></li>
							<li><a
								href="${pageContext.request.contextPath}/etc/selectSearchNaver.htm">네이버
									검색</a></li>
							<li><a
								href="${pageContext.request.contextPath}/etc/selectSearchGoogle.htm">
									구 &ensp;글 검색</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath}/login.htm">LOGIN</a></li>
					<li><a href="${pageContext.request.contextPath}/signup.htm">SIGN
							UP</a></li>
				</ul>

			</se:authorize>

		</div>
	</div>
	<hr class="nav-hr" />
</nav>

<script type="text/javascript">
var session  = ('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}'); //세션 유무 확인
var userPhoto; //사용자 프로필 이미지 명

//사용자 프로필 이미지 출력. myinfo.jsp와 같은 함수 쓰고 있음
	if(session != ''){
		 $.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/member/myinfo.do',
				success : function(data) {
							userPhoto = data.userPhoto; 
							$('#headerUserPhoto').attr("src", "${pageContext.request.contextPath}/resources/image/userPhoto/" + userPhoto);
			     	   },
				error : function(error) {
							console.log(error);
							console.log(error.status);
			       	  }
			     })
	}
</script>