<%-- main>>
@JSP : signup.jsp
@Date : 2018.10.10
@Author : 문지은
@Desc : 회원가입 페이지.
--%>

<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="center-block ">
			<h2 class="text-center signup-title">회원가입</h2>
			<hr>
				<form class="form-horizontal" method="post" name="signup" id="signup" enctype="multipart/form-data"
                	action="member/signup.do">
				<div class="form-group">
					<label class="control-label col-sm-4">프로필 이미지</label>
					<div class="col-sm-4">				
						<div>
							<div class="col-sm-3 pr-0 pl-0" >
								<div class="imgfile" style="width:92.5px;height:92.5px;"><img style="height: 100%;width: 100%;" class="img-responsive user-photo img-rounded" 
              						src="${pageContext.request.contextPath}/resources/image/userPhoto/userProfile.png" ></div>				
           					</div>
           				<input type="file" class="userPhoto" name="userPhotoFile" id="userPhoto" 
								aria-describedby="file_upload" accept="image/*">
								<small> * .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-4">Email ID </label>
					<div class="col-sm-4 pr-0">
						<div>
							<input type="email" class="form-control" name="userEmail"
								id="mailto" placeholder="example@example.com" required
								autofocus>		
						</div>				
					</div>
					<div class="col-sm-4 ">
						<button type="button" id="mailtoBtn" class="btn btn-secondary">이메일 인증</button>
					</div>
				<div class="col-sm-12 text-center">
				<div id="userEmailMessage" class="mt-10"></div></div>
				</div>
				
			
				
				<div class="form-group">
					<label class="control-label col-sm-4">Email 인증번호 </label>
					<div class="col-sm-4 pr-0">
						<div>
							<input type="text" class="form-control" name="authnum"
									id="authnum" placeholder="인증번호를 입력해주세요.">
						</div>
					</div>
					<div class="col-sm-12 text-center">
					<div id="userMailToMessage" class="mt-10"></div></div>
				</div>

				
				<div class="form-group">
					<label class="control-label col-sm-4">닉네임 </label>
					<div class="col-sm-4 pr-0">
						<div>
							<input type="text" class="form-control" name="userNick"
								id="userNick" placeholder="사용할 닉네임을 입력해주세요.">
						</div>
					</div>
					<div class="col-sm-12 text-center">
					<div id="userNickMessage" class="mt-10"></div></div>
				</div>
	
				
				<div class="form-group">
					<label class="control-label col-sm-4">비밀번호</label>
					<div class="col-sm-4 pr-0">
						<div>
							<input type="password" class="form-control" name="userPwd"
								id="userPwd" placeholder="알파벳 대소문자, 숫자를 이용해 6자리 이상 입력해주세요.">
						</div>
					</div>
					<div class="col-sm-12 text-center">
					<div id="userPwdMessage" class="mt-10"></div></div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-4">비밀번호 확인</label>
					<div class="col-sm-4 pr-0">
						<div>
							<input type="password" class="form-control" name="cuserPwd"
								id="cuserPwd" placeholder="비밀번호를 확인 해주세요.">
						</div>
					</div>
				<div class="col-sm-12 text-center">
				<div id="userPwdConfirmMessage" class="mt-10"></div></div>
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
						<input name="join" id="join" type="button" value="&nbsp;&nbsp;회원가입&nbsp;&nbsp;" class="btn btn-danger btn-md">
					</div>
				</div>
				</form>
				
				<div class="col-sm-12 text-center social-btn">
				
				<a class="btn btn-md social-btn" id="kakaoSignup" 
					href="https://kauth.kakao.com/oauth/authorize?client_id=495904a0b4023192de3119bfde795283&redirect_uri=http://13.124.12.183/copyNpaste/member/kakaoOauth.do&response_type=code"> 
					Sign up with <b>&nbsp;Kakao&nbsp;</b><img src="./resources/image/kakao.png" class="inline"></a><br>
				<a href="${naverAuthUrl}" class="btn btn-md social-btn" > Sign up with <b>&nbsp;Naver &nbsp;</b><img src="./resources/image/naver.png" class="inline"></a><br>
				<a href="${googleAuthUrl}" class="btn btn-md social-btn "> Sign up with <b>Google&nbsp;</b><img src="./resources/image/google.png" class="inline"></a>
		  		</div>
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
	var mailtoNum; //인증번호 담는 변수
	var mailCheck; //메일 인증 진행했는지 확인하는 변수
	var mailDupCheck; //메일 중복 진행했는지 확인하는 변수
	var nickDupCheck; //닉네임 중복 진행했는지 확인하는 변수
	var writtenMail; //회원이 입력한 메일주소
	var rightPwd;  //비밀번호 유효성 체크 변수
	var pwdDupCheck; //비밀번호 중복 진행했는지 확인하는 변수

	
	//인증메일 발송
	$('#mailtoBtn').click(function(){
		if (mailDupCheck == 'ok'){
			$('#userMailToMessage').removeClass("successMessage")
			$('#userMailToMessage').addClass("failMessage");
			$('#userMailToMessage').text("인증메일 전송에 1분 정도 소요될 수 있습니다.");
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/member/singupEmail.do',
					data : {mailto:$('#mailto').val()},
					success : function(data) {
							mailtoNum=data; 
							writtenMail = $('#mailto').val();
							console.log("인증번호:"+mailtoNum);
							$('#userMailToMessage').removeClass("failMessage");
							$('#userMailToMessage').addClass("successMessage");
							$('#userMailToMessage').text("이메일 인증을 위한 메일이 발송 되었습니다.");
					},
					error : function(error) {
						swal({
			  				  title: "이메일 주소를 확인해주세요",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: 'OK',
			  				  closeOnConfirm: true
			  				})
						console.log(error);
						console.log(error.status);
	           		 }
	         });
		} else {
			swal({
				  title: "이메일 주소를 확인해 주세요",
				  type: 'warning',
				  confirmButtonClass : "btn-danger btn-sm",
				  confirmButtonText: 'OK',
				  closeOnConfirm: true
				})
		}
		})
	
	//이메일 인증 번호 확인
	$('#authnum').keyup(function(){
			if(mailtoNum==$('#authnum').val() && writtenMail == $('#mailto').val()){
				$('#userMailToMessage').removeClass("failMessage");
				$('#userMailToMessage').addClass("successMessage");
        		$('#userMailToMessage').text("인증번호가 확인되었습니다");
        		mailCheck = 'ok';
			}else{
				$('#userMailToMessage').removeClass("successMessage");
				$('#userMailToMessage').addClass("failMessage");
        		$('#userMailToMessage').text("인증번호가 일치하지 않습니다.");
				mailCheck = '';
			}
	});


	//이메일 형식 검사 + 중복확인
	$('#mailto').keyup(function(){
		regexp =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var v = $(this).val();
		if (regexp.test(v)) {
			$.ajax({
	            type : 'post',
	            url : '${pageContext.request.contextPath}/member/checkUserEmail.do',
	            data : {mailto:$('#mailto').val()},
	            success : function(data) {
	            	if (data > 0) {
	            		$('#userEmailMessage').removeClass("successMessage");
	            		$('#userEmailMessage').addClass("failMessage");
	            		$('#userEmailMessage').text("이미 사용 중인 이메일입니다.");
	            		mailDupCheck = '';
	            	} else {
	            		$('#userEmailMessage').removeClass("failMessage");
	            		$('#userEmailMessage').addClass("successMessage");
	            		$('#userEmailMessage').text("사용 가능한 이메일입니다.");
	        			mailDupCheck = 'ok'; 
	        			}
	            },
	            error : function(error) {
	            	swal({
	    				  title: "잠시 후 다시 시도해주세요",
	    				  type: 'warning',
	    				  confirmButtonClass : "btn-danger btn-sm",
	    				  confirmButtonText: 'OK',
	    				  closeOnConfirm: true
	    				})
					console.log(error);
					console.log(error.status);
	            }
	         });
			}else{
				$('#userEmailMessage').removeClass("successMessage");
				$('#userEmailMessage').addClass("failMessage");
				$('#userEmailMessage').text("이메일 형식으로 입력해주세요");
			}

	});	
	
	
//비밀번호에는 영문, 숫자만 입력 가능
$("#userPwd").keyup(pwdValid);

//비밀번호 일치 확인
$('#cuserPwd').keyup(pwdDupCheck);
	

//닉네임 중복확인. myinfo.jsp와 다름
$('#userNick').keyup(function(){
		checkNick('singup');
	});

//회원 가입 1/2 (유효성 체크)
 $('#join').click(function(e){
  	if ($('#mailto').val() == ''){
  			swal({
			  title: "이메일 주소를 입력해 주세요",
			  type: "warning",
			  confirmButtonClass : "btn-danger btn-sm",
			  confirmButtonText: 'OK',
			  closeOnConfirm: true
			})
  	    	$('#mailto').focus();
  	    	return false;
  		} else {
  			if (mailCheck != 'ok' || writtenMail != $('#mailto').val() ) {
  				swal({
  				  title: "이메일 인증을 진행해주세요",
  				  type: "warning",
  				  confirmButtonClass : "btn-danger btn-sm",
  				  confirmButtonText: 'OK',
  				  closeOnConfirm: true
  				})
				$('#authnum').focus();
				return false;
  			} else {
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
  					if(rightPwd != 'ok' ){
  							swal({
			  				  title: "비밀번호를 확인해주세요.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: 'OK',
			  				  closeOnConfirm: true
			  				})
						$('#userPwd').val("");
						$('#cuserPwd').val("");
						$('#userPwd').focus();
						return false;
  					} else {
  						if(pwdDupCheck != 'ok') {
  							swal({
			  				  title: "비밀번호를 정확히 확인해주세요.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: 'OK',
			  				  closeOnConfirm: true
			  				})
							$('#cuserPwd').val("");
							$('#cuserPwd').focus();
							return false;
  						} else {
  							if ($('#userCheck').is(":checked")) {
  								signupAjax();
  							} else {
  								swal({
				  				  title: "이용약관에 동의해 주세요.",
				  				  type: 'warning',
				  				  confirmButtonClass : "btn-danger btn-sm",
				  				  confirmButtonText: 'OK',
				  				  closeOnConfirm: true
				  				})
								return false;
  							}
  						}
  					}
  				}
  			}
  		}
  	})
  	
 //회원 가입 2/2 (DB에 회원정보 insert)
  function signupAjax(){  
      var form = $('form')[0];
      //FormData parameter에 담아줌
      var formData = new FormData(form);
     $.ajax({
        type : 'post',
        data: formData, 
        enctype: 'multipart/form-data',
        processData : false,
        contentType : false,
        url : '${pageContext.request.contextPath}/member/signup.do',
        success : function(data) {
				  swal({type: "success",
				 		 title: "회원가입이 완료되었습니다.",
				  		 text: "",
				 		 confirmButtonText: "OK",
	              		 confirmButtonClass : "btn-danger btn-sm",
				  	     closeOnConfirm: false
					},
				  function(){
					location.href="${pageContext.request.contextPath}/login.htm";
					});	
	       			},
          error : function(error) {
        	swal({	  title: "잠시 후 다시 시도해주세요.",
        			  type: "warning",
	  				  confirmButtonClass : "btn-danger btn-sm",
	  				  confirmButtonText: "OK",
	  				  closeOnConfirm: true
	  				})
           	console.log(error);
           	console.log(error.status);
       }
    })  
  }
  

</script>