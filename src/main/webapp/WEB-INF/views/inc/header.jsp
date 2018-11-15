<%-- inc>>
@JSP : header.jsp
@Date : 2018.10.09
@Author : 임지현, 우나연
@Desc : header 파일
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>

<!-- 웹소켓 -->
<se:authorize access="isAuthenticated()">
<se:authentication property="principal.username" var="userEmail"/>
<script type="text/javascript">
/* 192.168.0.134 */
var ws = new WebSocket("ws://localhost:8090${pageContext.request.contextPath}/notify.do");

ws.onopen = 	function() 		{	console.log("웹소켓 오픈");	}
ws.onmessage = 	function(evt) 	{	onMessage(evt.data);			}
ws.onclose = 	function(evt) 	{}
ws.onerror = 	function(evt) 	{	console.log("웹소켓 에러");	}
	
function onMessage(evt) {
	$('#notifyBadge').text(evt);
}
	

	$(document).ready(function() {
		
		if (ws.readyState !== 1) return;
		else {
			ws.open;
			ws.send("${userEmail}");
		}
		
		$('#notifyALink').click(function notfifyView() {
			var notifyList = "";
			$.ajax({
				url: "${pageContext.request.contextPath}/etc/notifyList.json",
				dataType: "json",
				data: {'userEmail' : "${userEmail}"},
				success:function(data) {
					if(data.length != 0) {
						
						$.each(data, function(key, value) {

							$('#notifyUl').empty();
						
							if(value.notifyCode === "NC" || value.notifyCode === "NCC") {
								notifyList+='<li><a href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum='+value.notifyTarget
											+'" class="notification-item" data-target="#noteModal" data-toggle="modal" role="button" data-backdrop="static">';
								notifyList+='<input type="hidden" class="notifyCode" value="'+value.notifyCode
											+'"><input type="hidden" class="notifyTarget" value="'
											+value.notifyTarget+'">';
											
								if (value.readCheck == 1) {
									notifyList+='<span class="dot bg-danger"></span>';
								} else {
									notifyList+='<span class="dot bg-success"></span>';
								}
								
								if (value.notifyCode == 'NC') {
									notifyList+=' <'+'<div class="notifyTitleWidth">'+value.notifyTitle+'</div>'+'> ';
									notifyList+='노트에 댓글이 달렸습니다.</a></li>';
								} else {
									notifyList+=' <'+'<div class="notifyTitleWidth">'+value.notifyTitle+'</div>'+'> ';
									notifyList+='노트에 단 댓글에 대댓글이 달렸습니다.</a></li>';
								}
								
							} else if (value.notifyCode === "QA" || value.notifyCode === "QC" || value.notifyCode === "QCC" || value.notifyCode === "QNA" ){
								notifyList+='<li><a href="${pageContext.request.contextPath}/qna/selectDetailQna.htm?qnaNum='
											+value.notifyTarget+'" class="notification-item">';
								notifyList+='<input type="hidden" class="notifyCode" value="'+value.notifyCode
											+'"><input type="hidden" class="notifyTarget" value="'
											+value.notifyTarget+'">';
	
								if (value.readCheck == 1) {
									notifyList+='<span class="dot bg-danger"></span>';
								} else {
									notifyList+='<span class="dot bg-success"></span>';
								}
								
								if (value.notifyCode == 'QA') {
									notifyList+=' <'+'<div class="notifyTitleWidth">'+value.notifyTitle+'</div>'+'> ';
									notifyList+='질문에 답변이 달렸습니다.</a></li>';
								} else if (value.notifyCode == 'QC') {
									notifyList+=' <'+'<div class="notifyTitleWidth">'+value.notifyTitle+'</div>'+'> ';
									notifyList+='질문에 댓글이 달렸습니다.</a></li>';
								} else if (value.notifyCode == 'QCC'){
									notifyList+=' <'+'<div class="notifyTitleWidth">'+value.notifyTitle+'</div>'+'> ';
									notifyList+='질문에 단 댓글에 대댓글이 달렸습니다.</a></li>';
								} else {
									notifyList+=' <'+'<div class="notifyTitleWidth">'+value.notifyTitle+'</div>'+'> ';
									notifyList+='QNA 게시판에 새질문이 달렸습니다.</a></li>';
								}
								
							} else {
								notifyList+='<li><a href="${pageContext.request.contextPath}/adminReport.htm" class="notification-item">';
								notifyList+='<input type="hidden" class="notifyCode" value="'+value.notifyCode
												+'"><input type="hidden" class="notifyTarget" value="'
												+value.notifyTarget+'">';
								/* notifyList+='<li><a href="${pageContext.request.contextPath}/adminReport.htm';
								notifyList+='<input type="hidden" class="notifyCode" value="'+value.notifyCode
											+'"><input type="hidden" class="notifyTarget" value="'
											+value.notifyTarget+'">'; */
								
								if (value.readCheck == 1) {
									notifyList+='<span class="dot bg-danger"></span>';
								} else {
									notifyList+='<span class="dot bg-success"></span>';
								}

								notifyList+=' 새로운 신고가 접수되었습니다.</a></li>';
								
							}
						
						
						})
					
					} else {
						notifyList+='<li><a href="#" class="more">알림이 없습니다.</a></li>';
					}
					
					$('#notifyUl').append(notifyList);
					
					$('.notification-item').click(function() {
						$.ajax({
							url: "${pageContext.request.contextPath}/etc/notifyReadCheck.json",
							data: {'userEmail' : "${userEmail}",
									'notifyCode' : $(this).children('.notifyCode').val(),
									'notifyTarget' : $(this).children('.notifyTarget').val()},
							success:function(data) {notfifyView();}
						})
					})
				}
				
			})
		})
		
	});
	
</script>
</se:authorize>

<!-- 노트 모달창 -->
<div id="noteModal" class="modal fade text-center overlay"
	 role="dialog">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

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
								href="${pageContext.request.contextPath}/etc/selectSearchSite.htm?subjectName=회사">사이트
									검색</a></li>
							<li><a
								href="${pageContext.request.contextPath}/etc/selectSearchGoogle.htm">
									구 &ensp;글 검색</a></li>
						</ul></li>
					
					<!--프로필사진-->
					<se:authentication property="name" var="loginuser" />
					<li class="dropdown inline"><a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<img class="img-circle" id="headerUserPhoto">&nbsp;<span class="userNick"></span>님<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/member/myinfo.htm"><i class="far fa-user"></i><span>PROFILE</span></a></li>
					
					<!-- 관리자권한일때 -->
							<se:authorize access="hasRole('ROLE_ADMIN')">
								<li><a
									href="${pageContext.request.contextPath}/etc/adminStatistic.htm"><i class="fas fa-unlock-alt"></i> <span>ADMIN</span></a></li>
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
					<li class="dropdown">
						<a href="#" id="notifyALink"
							class="dropdown-toggle icon-menu" data-toggle="dropdown"> <i
							class="far fa-bell al"></i> <span class="badge bg-danger" id="notifyBadge"></span>
						</a>
						<ul class="dropdown-menu notifications" id="notifyUl">
						</ul>
					</li>	
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
								href="${pageContext.request.contextPath}/etc/selectSearchSite.htm?subjectName=회사"">사이트
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
var userPhoto; //헤더에 들어갈 사용자 프로필 이미지
var userNick; //회원 닉네임
var userSocialStatus; //소셜 가입여부


//사용자 프로필 이미지 출력. myinfo.jsp와 같은 함수 쓰고 있음
	if(session != ''){
		 $.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/member/myinfo.do',
				success : function(data) {
							userNick = data.userNick;
							$('.userNick').text(userNick);
							userPhoto = data.userPhoto; 	
							if (data.userSocialStatus != 0){
								$('#headerUserPhoto').attr("src", userPhoto);
							} else {$('#headerUserPhoto').attr("src", "${pageContext.request.contextPath}/resources/image/userPhoto/" + userPhoto);	
								}
			     	   },
			     	  error:function(request,status,error){
			     		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			     	  }
			     })
	}
	
if (window.sessionStorage) {
		var username = sessionStorage.setItem('login', session);
	}	
</script>