<%-- main>>
@JSP : signupSocial.jsp
@Date : 2018.11.02
@Author : 임효진
@Desc : 소셜 로그인 회원가입 페이지.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<div class="container">
	<div class="row">
		<div class="center-block ">	<h2 class="text-center signup-title">소셜 회원가입</h2>
			<hr>
				<form class="form-horizontal" method="post" name="signup" id="signup" action="${pageContext.request.contextPath}/member/socialSingUp.do"><!-- 소셜 회원가입 -->
				<div class="form-group">
					<label class="control-label col-sm-4">프로필 이미지</label>
					<div class="col-sm-4">				
						<div>
							<div class="col-sm-3 pr-0 pl-0" >
								<div class="imgfile" style="width:92.5px;height:92.5px;"><img style="height: 100%;width: 100%;" class="img-responsive user-photo img-rounded" 
              						src="${memberVo.userPhoto}"></div>				
           					</div>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<input type="hidden" class="form-control" name="userEmail"
								id="mailto" value="${memberVo.userEmail}">	
					<input type="hidden" class="form-control" name="userPwd"
								id="userPwd" value="${memberVo.userEmail}">	
					<input type="hidden" class="form-control" name="userPhoto"
								id="userPhoto" value="${memberVo.userPhoto}">	
					<input type="hidden" class="form-control" name="session"
								id="session" value="${session}">		
					<input type="hidden" class="form-control" name="userSocialStatus"
								id="userSocialStatus" value="${memberVo.userSocialStatus}">				
				</div>
						
				<div class="form-group" id="userEmailDiv">
					<label class="control-label col-sm-4">이메일 </label>
					<div class="col-sm-4 pr-0">
						<div>
							<input type="text" class="form-control" 
								id="userEmail" value="${memberVo.userEmail}">
						</div>
					</div>
					<div class="col-sm-12 text-center">
					<div id="userEmailMessage" class="mt-10"></div></div>
				</div>		
						
								
				<div class="form-group">
					<label class="control-label col-sm-4">닉네임 </label>
					<div class="col-sm-4 pr-0">
						<div>
							<input type="text" class="form-control" name="userNick"
								id="userNick" value="${memberVo.userNick}">
						</div>
					</div>
					<div class="col-sm-12 text-center">
					<div id="userNickMessage" class="mt-10"></div></div>
				</div>
				
				<div class="form-group">
                  <label class="checkbox text-center">
    				<input type="checkbox" value="remember-me" id="userCheck">
    				<a href="#" id="agreeNprivacy" data-toggle="modal"
						data-target="#modal-agreeNprivacy">이용약관과 개인정보 수집 및 이용동의</a>에 모두 동의합니다.
    			 </label>
    			</div>
			
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<input name="join" id="join" type="submit" value="&nbsp;&nbsp;회원가입&nbsp;&nbsp;" class="btn btn-danger btn-md">
					</div>
				</div>
				</form>

			<br>
		</div>
	</div>
	<br>	<br>	<br>
</div>

<!-- 이용규약 및 개인정보 모달 -->
<div id="modal-agreeNprivacy" class="modal fade text-center overlay " role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">
					<button type="button" class="close modal-deleteNoteEmail-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">이용약관과 개인정보 수집 및 이용동의</h4>
				</div>
				<div class="modal-body text-left">
					<div class="form-group">
						<br/>
							<label class="control-label col-sm-2">이용약관</label>
							<div class="privacy">
								<jsp:include page="/WEB-INF/views/main/agreement.jsp" flush="false" />
							</div>
					</div>
					<div class="form-group">
						<br/>
							<label class="control-label col-sm-2">개인정보 수집 및 이용동의</label>
							<div class="privacy">
								<jsp:include page="/WEB-INF/views/main/privacy.jsp" flush="false" />
							</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger modal-deleteNoteEmail-close" data-dismiss="modal">close</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	var nickDupCheck; //닉네임 중복 진행했는지 확인하는 변수
	var writtenNick; //회원이 입력한 닉네임
	var userEmail = $('#mailto').val();
	var userPwd = $('#userPwd').val();


	//페이지 열리면 소셜 id값이 db에 있는지 확인하고, 있으면 로그인한 뒤 메인 화면으로 보냄
	$.ajax({
	        type : 'post',
	        url : '${pageContext.request.contextPath}/member/checkUserEmail.do',
	        data : {mailto:$('#mailto').val()},
	        success : function(data) {
	         	 if (data > 0) {
	           		  $.ajax({
	           			type : 'post',
	        	        url : '${pageContext.request.contextPath}/login',
	        	        data: {userEmail:userEmail, userPwd:userPwd},
	        	        success: function(){ 
	        	        		location.href="${pageContext.request.contextPath}/" },
	        	        error: function (){	        	        	
	        	        }
	           		})  	           		
	         	 } else {
	            	}
	        },
	          error : function(error) {
	        	  swal({
	  				  title: "다시 로그인 해주세요",
	  				  type: 'warning',
	  				  confirmButtonClass : "btn-danger btn-sm",
	  				  confirmButtonText: 'OK',
	  				  closeOnConfirm: true
	  				})
					console.log(error);
					console.log(error.status);
	        }
	         });
	
	
	//페이지 열리면 바로 닉네임 중복 체크
	checkNick('singup');
	
	//닉네임 중복확인. myinfo.jsp와 다름
	$('#userNick').keyup(function(){
		if ($('#userNick').val() == ''){
			$('#userNickMessage').text("사용할 닉네임을 입력해주세요");
		} else {	
			checkNick('singup');
		}
	});


//회원 가입 + 유효성 체크. signup.jsp와 다름
 $('#join').click(function(){ 
  	if (nickDupCheck != 'ok' || writtenNick != $('#userNick').val()) {
  		swal({
			  title: "사용할 수 없는 닉네임입니다.",
			  type: 'warning',
			  confirmButtonClass : "btn-danger btn-sm",
			  confirmButtonText: 'OK',
			  closeOnConfirm: true
			})
  		return false;
  	} else {
  			if ($('#userCheck').is(":checked")) {
  			
  			} else {
  			swal({    title: "이용약관에 동의해 주세요.",
				  	  type: 'warning',
				  	  confirmButtonClass : "btn-danger btn-sm",
				  	  confirmButtonText: 'OK',
				  	  closeOnConfirm: true
				})
			return false;
  					}
  				}
  		})

</script>