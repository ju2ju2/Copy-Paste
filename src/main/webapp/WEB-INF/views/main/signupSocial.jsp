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
    			<input type="checkbox" value="remember-me" id="userCheck"><a>이용약관</a>에 동의합니다.</label>
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

<script type="text/javascript">
	var nickDupCheck; //닉네임 중복 진행했는지 확인하는 변수
	var writtenNick; //회원이 입력한 닉네임
	var userEmail = $('#mailto').val();
	var userPwd = $('#userPwd').val();


	//페이지 열리면 kakao id값이 db에 있는지 확인하고 있으면 세션 주고 메인 화면으로 보냄
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
	  				  confirmButtonText: '확인',
	  				  closeOnConfirm: true
	  				})
					console.log(error);
					console.log(error.status);
	        }
	         });
	
	
	//페이지 열리면 바로 닉네임 중복 체크
	checkNick();
	
	//닉네임 중복확인. myinfo.jsp와 다름
	$('#userNick').keyup(function(){
		if ($('#userNick').val() == ''){
			$('#userNickMessage').text("사용할 닉네임을 입력해 주세요");
		} else {	
			checkNick();
		}
	});

//닉네임 중복 함수
function checkNick(){
	$.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/member/checkUserNick.do',
        data : {userNick:$('#userNick').val()},
        success : function(data) {
        	if (data > 0) {
        		if($('#userNickMessage').hasClass("successMessage")){
        			$('#userNickMessage').removeClass("successMessage");}
        		$('#userNickMessage').addClass("failMessage");
        		$('#userNickMessage').text("이미 사용 중인 닉네임입니다.");
        		nickDupCheck = '';
        		console.log(data+", "+nickDupCheck+", "+$('#userNick').val())
        	} else {
        		if($('#userNickMessage').hasClass("failMessage")){
        			$('#userNickMessage').removeClass("failMessage");}
        		$('#userNickMessage').addClass("successMessage");
        		$('#userNickMessage').text("사용 가능한 닉네임입니다.");
    			nickDupCheck = 'ok';
    			writtenNick = $('#userNick').val();
    			console.log(data+", "+nickDupCheck+", "+$('#userNick').val())
        }},
        error : function(error) {
        	swal({
				  title: "잠시후 다시 시도해주세요.",
				  type: 'warning',
				  confirmButtonClass : "btn-danger btn-sm",
				  confirmButtonText: '확인',
				  closeOnConfirm: true
				})
			console.log(error);
			console.log(error.status);
        }
     });	
}
	
	
//회원 가입 + 유효성 체크
 $('#join').click(function(){ 
  	if (nickDupCheck != 'ok' || writtenNick != $('#userNick').val()) {
  		swal({
			  title: "사용할 수 없는 닉네임입니다.",
			  type: 'warning',
			  confirmButtonClass : "btn-danger btn-sm",
			  confirmButtonText: '확인',
			  closeOnConfirm: true
			})
  		return false;
  	} else {
  			if ($('#userCheck').is(":checked")) {
  			
  			} else {
  			/* swal("٩(இ ⌓ இ๑)۶", "이용약관에 동의해 주세요.", "error"); */
  			swal({    title: "이용약관에 동의해 주세요.",
				  	  type: 'warning',
				  	  confirmButtonClass : "btn-danger btn-sm",
				  	  confirmButtonText: '확인',
				  	  closeOnConfirm: true
				})
			return false;
  					}
  				}
  		})

</script>