<%-- main>>
@JSP : login.jsp
@Date : 2018.10.10
@Author : 문지은
@Desc : 로그인 페이지.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="center-block ">
			<h2 class="text-center login-title">LOGIN</h2>
			<hr>
			<div>
				<c:url value="/login" var="loginUrl" />
				<form id="signin" class="form-signin" name="f1" action="${loginUrl}"
							method="POST">
					<c:if test="${param.error != null}">
						<p>아이디와 비밀번호가 잘못되었습니다.</p>
					</c:if>
					<c:if test="${param.logout != null}">
						<p>로그아웃 하였습니다.</p>
					</c:if>
					<input type="text" id="userEmail" name="userEmail"
						class="form-control" placeholder="Email" required autofocus />
					<input type="password" id="userPwd" name="userPwd"
						class="form-control" placeholder="Password" required />
					<button class="btn btn-lg btn-danger btn-block" type="submit">로그인</button>
				</form>
					<hr>
					<h3 class="mg-top-6 text-center login-title">SNS LOGIN</h3>
					<div class="text-center">
						<hr>
						<!-- 네이버 -->
						&nbsp;<a href="${naverAuthUrl}"><img src="${pageContext.request.contextPath}/resources/image/naver.png" class="inline">&ensp;</a> 
						<!-- 카카오 -->
						<a id="custom-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=495904a0b4023192de3119bfde795283&redirect_uri=http://192.168.0.134:8090/copyNpaste/member/kakaoOauth.do&response_type=code">
							<img src="${pageContext.request.contextPath}/resources/image/kakao.png" class="inline"> &ensp;</a>
						<!-- 구글 -->
						<a href="${googleAuthUrl}"><img src="${pageContext.request.contextPath}/resources/image/google.png" class="inline"></a>
					</div>

				<form class="form-signin" name="f2" method="POST"
					action="#modal-tempPassword" >
					<a data-toggle="modal" href="#" class="pull-right need-help"
						data-target="#modal-tempPassword" role="button"
						data-backdrop="static"> Forgot password? </a>
					<span class="clearfix"></span>
					<a href="signup.htm" class="pull-right new-account">SING UP</a>
					<span class="clearfix"></span>
				</form>
			</div>
			<br> <br> <br> <br>
		</div>
	</div>
</div>


<!-- Modal HTML -->
 <div id="modal-tempPassword" class="modal fade text-center"
	tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">임시 비밀번호</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<div class="row">
						<div>
							<form id="findUserPwd" class="form-signin" name="f3" method="POST">
							<input type="text" id="userEmailForfindUserPwd" name="userEmail"
								class="form-control" placeholder="Email" required autofocus />
							<button class="mt-10 btn btn-sm btn-danger btn-block" 
									id ="findUserPwdBtn" type="button">임시비밀번호
								발송</button>
							</form>
						</div>
					</div>
					<div class="row">
						<b>비밀번호 찾기 안내</b>
						<p>
							사용자 이메일로 임시비밀번호가 발송됩니다.</br> 비밀번호 찾기 후 반드시 포털시스템에서 비밀번호를 수정하시기 바랍니다.
						</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
var tempPwd; //임시 비밀번호

//임시 비밀번호 메일 발송 전 유효성 체크
$('#findUserPwdBtn').click(function(){	
	$.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/member/checkUserEmail.do',
        data : {mailto: $('#userEmailForfindUserPwd').val()},
        success : function(data) {
        	if (data > 0) {
        		updatePwd();
        	} else {
        		/* swal("٩(இ ⌓ இ๑)۶", "가입된 이메일 주소가 아닙니다.", "error"); */
        		swal({  title: "가입된 이메일 주소가 아닙니다.",
						text: "",
						type: "warning",
						confirmButtonClass: "btn-danger btn-sm",
						confirmButtonText: "OK",
						showCancelButton: false
					})
        		$('#userEmailForfindUserPwd').val("");				
        	}
        },
        error : function(error) {
			/* swal("٩(இ ⌓ இ๑)۶", "이메일 주소를 확인해 주세요.", "error"); */
			swal({  title: "이메일 주소를 확인해 주세요",
						text: "",
						type: "warning",
						confirmButtonClass: "btn-danger btn-sm",
						confirmButtonText: "OK",
						showCancelButton: false
					})
			$('#userEmailForfindUserPwd').val("");
			console.log(error);
			console.log(error.status);
        }
     });
})

//임시 비밀번호 메일 발송
function updatePwd(){
		$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/member/findUserPwd.do',
 		data : {mailto:$('#userEmailForfindUserPwd').val()},
		success : function(data) {
					console.log(data);
					/* swal("୧༼ ヘ ᗜ ヘ ༽୨", "임시 비밀번호가 메일로 전송되었습니다.", "success"); */
					swal({  title: "임시 비밀번호가 메일로 전송되었습니다.",
						text: "",
						type: "warning",
						confirmButtonClass: "btn-danger btn-sm",
						confirmButtonText: "OK",
						showCancelButton: false
					})
					$('#modal-tempPassword').hide();
         	   },
          	  error : function(error) {
					/* swal("٩(இ ⌓ இ๑)۶", "이메일 주소를 확인해 주세요.", "error"); */
					swal({  title: "이메일 주소를 확인해 주세요.",
						text: "",
						type: "warning",
						confirmButtonClass: "btn-danger btn-sm",
						confirmButtonText: "OK",
						showCancelButton: false
					})
					console.log(error);
					console.log(error.status);
            }
         });
	}
</script>