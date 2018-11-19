<%-- main>>
@JSP : myinfo.jsp
@Date : 2018.10.10
@Author : 이주원
@Desc : 내 정보 보기 페이지.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="center-block">
			<h2 class="text-center signup-title">내 정보 보기</h2>
			<hr>
			<br class="normalUser">
			<br class="normalUser">
			<br class="normalUser">
			<br class="normalUser">
			<form class="form-horizontal" method="post" name="updateMember" id="updateMember" enctype="multipart/form-data"
					action="member/updateMember.do">
				<div class="form-group">
					<label class="control-label col-sm-5">프로필 이미지<span class="text-danger"></span></label>
					<div class="col-sm-4">				
						<div>
							<div class="col-sm-3 pr-0 pl-0" >
								<div class="imgfile" style="width:92.5px;height:92.5px;"><img style="height: 100%;width: 100%" class="img-responsive user-photo img-rounded" 
              						id="beforUserPhoto" ></div>				
           					</div>
           				<input type="file" class="userPhoto socialUser" name="userPhotoFile" id="userPhoto" 
								aria-describedby="file_upload" accept="image/*">
								<small class="socialUser"> * .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
						</div>
					</div>
            	</div>
            	
				<br class="normalUser">
				<br class="normalUser">
				<div class="form-group socialUser">
					<label class="control-label col-sm-5">Email ID <span class="text-danger"></span></label>
					<div class="col-lg-3 col-sm-4">
						<div><!-- class="input-group" -->
							<input type="email" class="form-control" name="userEmail"
								id="userEmail" readonly>
						 </div>
						 <div class="col-sm-4"></div>
					 	<div class="col-sm-12 text-center"><div></div></div>  
					</div>
					
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5">닉네임 <span class="text-danger"></span></label>
						<div class="col-lg-3 col-sm-4">
							<div>
								<input type="text" class="form-control" name="userNick"
										id="userNick">
							</div>
						</div>
						<div class="col-sm-4"></div>
					 <div class="col-sm-12 text-center"><div id="userNickMessage" class="mt-10"></div></div>
				</div>
				
				
				<div class="form-group socialUser">
					<label class="control-label col-sm-5">비밀번호<span class="text-danger"></span></label>
						<div class="col-lg-3 col-sm-4">
							<div>
								<input type="password" class="form-control" name="userPwd" id="userPwd">
							</div>
						</div>
						<div class="col-sm-4"></div>
					<div class="col-sm-12 text-center"><div id="userPwdMessage" class="mt-10"></div></div>
				</div>
				
				
				<div class="form-group socialUser">
					<label class="control-label col-sm-5">비밀번호 확인<span class="text-danger"></span></label>
						<div class="col-lg-3 col-sm-4">
							<div>
								<input type="password" class="form-control" name="cuserPwd"
										id="cuserPwd">
							</div>
						</div>
					<div class="col-sm-4"></div>
					<div class="col-sm-12 text-center"><div id="userPwdConfirmMessage" class="mt-10"></div></div>
				</div>
				<br class="normalUser">
				<br class="normalUser">
				<div class="social-btn text-center">
				&nbsp;<input name ="infoUpdate" type="button" class="btn btn-primary" id="infoUpdate" value="정보수정">
				&nbsp;<input name ="deleteMember" type="button" class="btn btn-danger" id="deleteMember" value="회원탈퇴">
		  		</div>
			<br>
			</form>
			<br class="normalUser">
			<br class="normalUser">
			<br class="normalUser">
			<br class="normalUser">
		</div>
	</div>
	<br>	<br>	<br>
</div>

<script type="text/javascript">
var userPhoto; //회원 프로필 사진
var userNick; //회원 닉네임
var userEmail; //회원 이메일
var userSocialStatus //회원 소셜 여부
var nickDupCheck ='ok'; //닉네임 중복 진행했는지 확인하는 변수
var rightPwd; //비밀번호 유효성 체크 변수
var pwdDupCheck; //비밀번호 중복 진행했는지 확인하는 변수 

//회원 정보 뿌리기
 $.ajax({
	type : 'post',
	url : '${pageContext.request.contextPath}/member/myinfo.do',
	success : function(data) {
		userPhoto = data.userPhoto; 
		userNick = data.userNick;
		userEmail = data.userEmail;	
		userSocialStatus = data.userSocialStatus;
		$('#userEmail').val(data.userEmail);
		$('#userNick').val(userNick); 
		if (userSocialStatus != 0){
			$('.socialUser').hide();
			$('#beforUserPhoto').attr("src", userPhoto);
		} else {$('#beforUserPhoto').attr("src", "${pageContext.request.contextPath}/resources/image/userPhoto/" + userPhoto);
				$('.normalUser').hide();
			}
	}	
	,
	error : function(error) {
		console.log(error);
		console.log(error.status);
		}
	})

	
//닉네임 중복확인. signup.jsp와 다름
	$('#userNick').keyup(function(){
		checkNick('myinfo');
	});

//비밀번호에는 영문, 숫자만 입력 가능
 $("#userPwd").keyup(pwdValid);

 //비밀번호 일치 확인
 $('#cuserPwd').keyup(pwdDupCheck);

		
//정보수정 1/3 (회원 정보 수정 버튼 클릭 시, 입력한 정보의 유효성 검사)
$('#infoUpdate').click(function(){
	//비밀번호와 비밀번호 확인 입력칸이 공백인 경우
 	if ($('#userPwd').val() == '' && $('#cuserPwd').val() == '') { 
		if ( nickDupCheck != 'ok' && $('#userNick').val() != userNick ){
						swal({
			  				  title: "사용할 수 없는 닉네임입니다.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: 'OK',
			  				  closeOnConfirm: true
			  				})
			} else { 
				//소셜 회원이면 현재 비밀번호 입력 없이 바로 정보 수정
				if (userSocialStatus ==0){
					updateMember();
					} else {
						infoUpdateAjax();
					}
				 }
	} else { //비밀번호와 비밀번호 확인을 모두 입력한  경우
		if ( rightPwd != 'ok' || pwdDupCheck != 'ok' ){
					swal({
			  				  title: "변경할 비밀번호를 \n제대로 입력해주세요.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: 'OK',
			  				  closeOnConfirm: true
			  				})
			
		} else {
			if ( nickDupCheck != 'ok' && $('#userNick').val() != userNick ){
						swal({
			  				  title: "사용할 수 없는 닉네임입니다.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: 'OK',
			  				  closeOnConfirm: true
			  				})
				} else {
					//소셜 회원이면 현재 비밀번호 입력 없이 바로 정보 수정
					if (userSocialStatus ==0){
						updateMember();
						} else {
							infoUpdateAjax();
						}
				}
			}	
	} 
})

//정보수정 2/3 (유효성 검사 확인 후, 현재 비밀번호를 맞게 입력했는지 검증)
function updateMember(){	       
		swal({
			  title: "비밀번호 확인",
			  text: "<form style='font-size:15px;'><br><input type='password' class='pw'"+
			  		"id='rawpassword' size='40' placeholder='현재 비밀번호를 입력해주세요'/></form>",
			  html: true,
			  inputAttributes: { autocapitalize: 'off' },
			  showCancelButton: true,
			  confirmButtonText : "OK",
			  confirmButtonClass : "btn-danger btn-sm",
			  cancelButtonClass : "btn btn-sm",
			  closeOnConfirm: false
			}, function () {
					//비밀번호 비교
					var rawpassword=$('#rawpassword').val();
					$.ajax({
						type: "post",
						data: {rawpassword:rawpassword},
						url: '${pageContext.request.contextPath}/member/matchPwd.do',
						success: function(data){
							if( data == true){
								//비밀번호 확인 후 정보 수정
								infoUpdateAjax();
							} else{
								$('#userPwd').val("");
								$('#userPwd').attr("placeholder","비밀번호를 정확히 입력해주세요.");
							}
						},
						error: function (){
							$('#userPwd').val("");
							$('#userPwd').attr("placeholder","잠시후 다시 시도해주세요.");
						}
					})				
				  }
			)
	};
	
	
//정보수정 3/3 (DB의 정보 update)
		function infoUpdateAjax(){
		var form = $('form')[1];
			//FormData parameter에 담아줌
			var formData = new FormData(form);	

			$.ajax({
				type : 'post',
				data: formData, 
				enctype: 'multipart/form-data',
				processData : false,
				contentType : false,
				url : '${pageContext.request.contextPath}/member/updateMember.do',
				success : function() {
						 swal({type: "success",
						 title: "회원정보가 수정되었습니다.",
						 text: "",
						 confirmButtonClass : "btn-danger btn-sm",
						 confirmButtonText: "OK",
						 closeOnConfirm: false},
						 function(){	location.reload();	});	
						},
				error : function(error) {
						swal({
			  				  title: "잠시 후 다시 시도해주세요.",
			  				  type: 'warning',
			  				  confirmButtonClass : "btn-danger btn-sm",
			  				  confirmButtonText: 'OK',
			  				  closeOnConfirm: true
			  				})
						console.log(error);
						console.log(error.status);
						}
			})
		}		
		
		
//회원탈퇴
 $('#deleteMember').click(function(){
	  swal({
		  title: "탈퇴하시겠습니까?",
		  text: "탈퇴해도 작성한 노트 및 드래그, \n게시글, 댓글은 삭제되지 않으며 \n동일한 Email로는 재가입이 불가능합니다.",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger btn-sm",
		  confirmButtonText: "회원 탈퇴",
		  cancelButtonClass: "btn-sm",
		  cancelButtonText: "cancel",
		  closeOnConfirm: false,
		},
			function(isConfirm) {
		 		 if (isConfirm) {
					  $.ajax({
			       		type : 'post',
			        	data: {userEmail:userEmail},
			        	url :  '${pageContext.request.contextPath}/member/deleteMember.do',
			        	success : function(data) {
								 swal({type: "success",
								 title: "회원 탈퇴가 완료되었습니다.",
								 text: "",
								 confirmButtonText: "OK",
				             	 confirmButtonClass : "btn-danger btn-sm",
							 	 closeOnConfirm: false
									},
								 function(){
								 location.href="${pageContext.request.contextPath}/logout";
									});	
				       			},
						error : function(error) {
			          			 swal({  title: "잠시 후 다시 시도해주세요.",
									text: "",
									type: "warning",
									confirmButtonClass: "btn-danger btn-sm",
									confirmButtonText: "OK",
									showCancelButton: false
								})
			           	  	 	console.log(error);
			           		 	console.log(error.status);
			       				}
			    		})
		  		} else {
		    		return false;
		  			}
		});
})

</script>