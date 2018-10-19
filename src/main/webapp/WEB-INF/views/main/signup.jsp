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
					<div class="col-sm-4 "><button type="button" id="mailtoBtn" class="btn btn-secondary">이메일인증</button>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-4">Email  인증번호 </label>
					<div class="col-sm-4 pr-0">
							<input type="text" class="form-control" name="authnum"
								id="authnum" placeholder="인증번호를 입력해주세요.">
						</div>
					<div class="col-sm-4 ">
					     <button type="button" id="mailtoOkBtn" class="btn btn-secondary">&ensp;인증확인&ensp;</button>
					     </div>
				</div>
					<div class="form-group">
					<label class="control-label col-sm-4">닉네임 </label>
						<div class="col-sm-4 pr-0">
						<div >
							<input type="text" class="form-control" name="userNick"
								id="userNick" placeholder="사용할 닉네임을 입력해주세요.">
						</div>
					</div>
					<div class="col-sm-4 ">
					 <button type="button" class="btn btn-secondary">&ensp;중복확인&ensp;</button>
				</div>
				</div>
				
				
				<div class="form-group">
					<label class="control-label col-sm-4">비밀번호</label>
					<div class="col-sm-4 pr-0">
						<div >
							<input type="password" class="form-control" name="userPwd"
								id="userPwd" placeholder="6자리 이상 입력해주세요.">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-4">비밀번호 확인</label>
					<div class="col-sm-4 pr-0">
						<div >
							<input type="password" class="form-control" name="cuserPwd"
								id="cuserPwd" placeholder="비밀번호를 확인 해주세요.">
						</div>
					</div>
				</div>
				
				<div class="form-group">
                  <label class="checkbox text-center">
    			<input type="checkbox" value="remember-me" id="userCheck"><a href="" >이용약관</a>에 동의합니다.</label>
    			</div>
			
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<input name="join" id="join" type="submit" value="&nbsp;&nbsp;회원가입&nbsp;&nbsp;" class="btn btn-danger btn-md">
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
	var mailtoNum;
	var mailCheck;
	$('#mailtoBtn').click(function(){
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/member/singupEmail.do',
            data : {mailto:$('#mailto').val()},
            success : function(data) {
            	swal("୧༼ ヘ ᗜ ヘ ༽୨", "이메일 인증을 위한 메일이 발송 되었습니다.", "success")
            	mailtoNum=data; 
            	console.log(mailtoNum);

            },
            error : function(error) {
				swal("٩(இ ⌓ இ๑)۶", "이메일 주소를 확인해 주세요.", "error");
				console.log(error);
				console.log(error.status);
            	console.log($('#userPwd').val().length());
            }
         });
	});
	
	$('#mailtoOkBtn').click(function(){
		if(mailtoNum==$('#authnum').val()){
        	swal("୧༼ ヘ ᗜ ヘ ༽୨", "이메일 인증이 완료 되었습니다.", "success")
        	mailCheck = 'ok';
		}else{
        	swal("٩(இ ⌓ இ๑)۶", "인증번호를 정확히 적어 주세요.", "error");
			$('#authnum').val("");
		}
	});
	
	
  	/* $('#join').click(function(){
		if($('#mailto').val() == ''){
        	swal("٩(இ ⌓ இ๑)۶", "이메일 주소를 입력해 주세요", "error");
        	$('#mailto').focus();
        	return false;
		} else {
			if(mailCheck != 'ok'){
				swal("٩(இ ⌓ இ๑)۶", "이메일 인증을 진행해 주세요.", "error");
				$('#authnum').focus();
				return false;
			} else {
				if($('#userNick').val() ==''){
					swal("٩(இ ⌓ இ๑)۶", "닉네임을 입력해 주세요.", "error");
					$('#userNick').focus();
					return false;
					} else {
						if($('#userPwd').val()==''){
							swal("٩(இ ⌓ இ๑)۶", "비밀번호를 입력해 주세요.", "error");
							$('#userPwd').focus();
							return false;
						} else {
							if ($('#userPwd').val().)
							if($('#cuserPwd').val()==''){
								swal("٩(இ ⌓ இ๑)۶", "비밀번호 확인을 진행해 주세요.", "error");
								$('#cuserPwd').focus();
								return false;
							} else {
								if ($('#userPwd').val() !=$('#cuserPwd')){
									swal("٩(இ ⌓ இ๑)۶", "비밀번호를 정확히 확인해 주세요.", "error");
									$('#cuserPwd').focus();
								}
							}
							else {
								if ($('#userCheck').is(":checked")){	
								} else {
									swal("٩(இ ⌓ இ๑)۶", "이용약관에 동의해 주세요.", "error");
									return false;
								}
							}
						}
					}
				}
			}
	}) */

	
</script>