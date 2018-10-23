<%-- main>>
@JSP : signup.jsp
@Date : 2018.10.10
@Author : 문지은
@Desc : 회원가입 페이지.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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
							<input type="email" class="form-control" name="userEmail"
								id="mailto" placeholder="example@example.com" required
								autofocus>						
					</div>
					<div class="col-sm-4 ">
						<button type="button" id="mailtoBtn" class="btn btn-secondary">이메일인증</button>
					</div>
				<div class="col-sm-12 text-center"><div id="userEmailMessage" class="mt-10"></div></div>
				</div>
				
			
				
				<div class="form-group">
					<label class="control-label col-sm-4">Email 인증번호 </label>
					<div class="col-sm-4 pr-0">
						<input type="text" class="form-control" name="authnum"
								id="authnum" placeholder="인증번호를 입력해주세요.">
					</div>
					<div class="col-sm-4 "></div>
					<div class="col-sm-12 text-center"><div id="userMailToMessage" class="mt-10"></div></div>
				</div>

				
				<div class="form-group">
					<label class="control-label col-sm-4">닉네임 </label>
						<div class="col-sm-4 pr-0">
						<div>
							<input type="text" class="form-control" name="userNick"
								id="userNick" placeholder="사용할 닉네임을 입력해주세요.">
						</div>
						</div>
					<div class="col-sm-4"></div>
				<div class="col-sm-12 text-center"><div id="userNickMessage" class="mt-10"></div></div>
				</div>
	
				
				<div class="form-group">
					<label class="control-label col-sm-4">비밀번호</label>
					<div class="col-sm-4 pr-0">
						<div >
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
				</div>
				<div class="col-sm-5"></div>
				<div id="userPwdConfirmMessage"></div>
				
				<div class="form-group">
                  <label class="checkbox text-center">
    			<input type="checkbox" value="remember-me" id="userCheck"><a ="" >이용약관</a>에 동의합니다.</label>
    			</div>
			
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<input name="join" id="join" type="button" value="&nbsp;&nbsp;회원가입&nbsp;&nbsp;" class="btn btn-danger btn-md">
					</div>
				</div>
				</form>
				
				<div class="col-sm-12 text-center social-btn">
				<a href="#" class="btn btn-md social-btn"> Sign up with <b>&nbsp;Kakao&nbsp;</b><img src="./resources/image/kakao.png" class="inline"></a><br>
				<a href="#" class="btn  btn-md social-btn" > Sign up with <b>&nbsp;Naver &nbsp;</b><img src="./resources/image/naver.png" class="inline"></a><br>
				<a href="#" class="btn  btn-md social-btn "> Sign up with <b>Google&nbsp;</b><img src="./resources/image/google.png" class="inline"></a>
		  		</div>
			<br>
		</div>
	</div>
	<br>	<br>	<br>
</div>




<script type="text/javascript">
	var mailtoNum; //인증번호 담는 변수
	var mailCheck; //메일 인증 진행했는지 확인하는 변수
	var mailDupCheck; //메일 중복 진행했는지 확인하는 변수
	var nickDupCheck; //닉네임 중복 진행했는지 확인하는 변수
	var writtenMail; //회원이 입력한 메일주소
	var writtenNick //회원이 입력한 닉네임
	var signUpComplete; //회원가입 완료했는지 확인하는 변수
	
	//인증메일 발송
	$('#mailtoBtn').click(function(){
		$('#userMailToMessage').addClass("failMessage")
		$('#userMailToMessage').text("메일이 전송되는데 1분 정도 소요될 수 있습니다.");
		if (mailDupCheck != 'ok'){
			$('#userMailToMessage').addClass("failMessage")
			$('#userMailToMessage').text("아직 이메일 중복확인이 되지 않았습니다.");
		} else{
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/member/singupEmail.do',
				data : {mailto:$('#mailto').val()},
				success : function(data) {
						mailtoNum=data; 
						writtenMail = $('#mailto').val();
						console.log("인증번호:"+mailtoNum);
						$('#userMailToMessage').addClass("successMessage")
	            		
         	   },
          	  error : function(error) {
					swal("٩(இ ⌓ இ๑)۶", "이메일 주소를 확인해 주세요.", "error");
					console.log(error);
					console.log(error.status);
            }
         });
		}
	});
	
	//이메일 인증 번호 확인
	$('#authnum').keyup(function(){
			if(mailtoNum==$('#authnum').val() && writtenMail == $('#mailto').val()){
				$('#userMailToMessage').addClass("successMessage")
        		$('#userMailToMessage').text("인증번호가 확인되었습니다");
        		mailCheck = 'ok';
			}else{
				$('#userMailToMessage').addClass("failMessage")
        		$('#userMailToMessage').text("인증번호가 일치 하지 않습니다.");
			}
	});


	//비밀번호 확인
 	$('#cuserPwd').keyup(function(){
		if($(this).val() != $('#userPwd').val()){
			$('#userPwdConfirmMessage').addClass("failMessage")
			$('#userPwdConfirmMessage').text("비밀번호를 정확히 입력해 주세요.");
		} else {
			$('#userPwdConfirmMessage').addClass("successMessage")
			$('#userPwdConfirmMessage').text("비밀번호가 일치합니다.");
		}
	})

	//비밀번호 영문, 숫자만 입력 가능
	$("#userPwd").keyup(function (event) {
		regexp =  /^[0-9a-zA-Z]{6,20}$/i;
		var v = $(this).val();
		if (regexp.test(v)) {
			$('#userPwdMessage').addClass("successMessage")
			$('#userPwdMessage').text("사용 가능한 비밀번호 입니다.");

			
			/* $(this).val(v.replace(regexp, '')); */
			}else{

				$('#userPwdMessage').addClass("failMessage")
				 $('#userPwdMessage').text("알파벳 대소문자, 숫자로 6자이상 입력해주세요."); 
			}
	})

	
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
	            		$('#userEmailMessage').addClass("failMessage")
	            		$('#userEmailMessage').text("이미 사용 중인 이메일입니다.");
	            	} else {
	            		$('#userEmailMessage').addClass("successMessage")
	            		$('#userEmailMessage').text("사용 가능한 이메일입니다.");
	        			mailDupCheck = 'ok'; }
	            },
	            error : function(error) {
					swal("٩(இ ⌓ இ๑)۶", "이메일 주소를 확인해 주세요.", "error");
					console.log(error);
					console.log(error.status);
	            }
	         });
			
			
			}else{
				$('#userEmailMessage').addClass("failMessage")
				$('#userEmailMessage').text("이메일 형식으로 입력해주세요");
			}

	});

	//닉네임 중복확인
	$('#userNick').keyup(function(){
		if ($('#userNick').val() == ''){
			$('#userNickMessage').text("사용할 닉네임을 입력해 주세요");
		} else {
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/member/checkUserNick.do',
            data : {userNick:$('#userNick').val()},
            success : function(data) {
            	if (data > 0) {
            		$('#userNickMessage').addClass("failMessage")
            		$('#userNickMessage').text("이미 사용 중인 닉네임입니다.");
            	} else {
            		$('#userNickMessage').addClass("successMessage")
            		$('#userNickMessage').text("사용 가능한 닉네임입니다.");
        			nickDupCheck = 'ok';
        			writtenNick = $('#userNick').val();	
            }},
            error : function(error) {
				swal("٩(இ ⌓ இ๑)۶", "잠시 후 다시 시도해 주세요.", "error");
				console.log(error);
				console.log(error.status);
            }
         });
		}
	});
			
  	//유효성 체크
function validate(){
  	if ($('#mailto').val() == ''){
  			swal("٩(இ ⌓ இ๑)۶", "이메일 주소를 입력해 주세요", "error");
  	    	$('#mailto').focus();
  	    	return false;
  		} else {
  			if (mailCheck != 'ok' || writtenMail != $('#mailto').val() ) {
  				swal("٩(இ ⌓ இ๑)۶", "이메일 인증을 진행해 주세요.", "error");
				$('#authnum').focus();
				return false;
  			} else {
  				
  				if (nickDupCheck != 'ok' || writtenNick != $('#userNick').val()) {
  					swal("٩(இ ⌓ இ๑)۶", "닉네임 중복확인을 진행해 주세요.", "error");
  					return false;
  				} else {
  					if($('#userPwd').val().length < 6 ){
  						swal("٩(இ ⌓ இ๑)۶", "비밀번호를 6글자 이상 입력해 주세요.", "error");
						$('#userPwd').val("");
						$('#cuserPwd').val("");
						$('#userPwd').focus();
						return false;
  					} else {
  						if($('#userPwd').val() != $('#cuserPwd').val()) {
  							swal("٩(இ ⌓ இ๑)۶", "비밀번호를 정확히 확인해 주세요.", "error");
							$('#cuserPwd').val("");
							$('#cuserPwd').focus();
							return false;
  						} else {
  							if ($('#userCheck').is(":checked")) {
  							} else {
  								swal("٩(இ ⌓ இ๑)۶", "이용약관에 동의해 주세요.", "error");
								return false;
  							}
  						}
  					}
  				}
  			}
  		}
  	}
  	

	 $('#join').click(function(){		
 		var form = $('#fileform')[0];
		//FormData parameter에 담아줌
		var formData = new FormData(form);
		
		$.ajax({
			type : 'post',
 			data: formData,
			processData : false,
			contentType : false,
			url : '${pageContext.request.contextPath}/member/signup.do',
			success : function(data) {
				console.log(data)
					swal("୧༼ ヘ ᗜ ヘ ༽୨", "회원가입 성공 ", "success")
     	   },
      	  error : function(error) {
				swal("٩(இ ⌓ இ๑)۶", "이ddd주세요.", "error");
				console.log(error);
				console.log(error.status);
        }
     });
		
	 })

  //회원가입 
   $('#join').click(function(e){      
       var form = $('form')[0];
       //FormData parameter에 담아줌
       var formData = new FormData(form);

      $.ajax({
         type : 'post',
         data: formData, 
         enctype: 'multipart/form-data',
         processData : false,
         contentType : false,
         url :  '${pageContext.request.contextPath}/member/signup.do',
         success : function(data) {
	    	  swal({type: "success",
				  title: '성공적으로 가입되었습니다.',
	              confirmButtonClass : "btn-danger",
				  closeOnConfirm: false
			},
			function(){
				location.href="${pageContext.request.contextPath}/login.htm";
			});	
	       },
           error : function(error) {
            swal("٩(இ ⌓ இ๑)۶", "에러가 발생했습니다.", "error");
            console.log(error);
            console.log(error.status);
        }
     })
   }) 

  	
</script>