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
			<form class="form-horizontal" method="post" name="signup" id="signup" enctype="multipart/form-data">
				<div class="form-group">
               <label class="control-label col-sm-5">프로필 이미지<span
                  class="text-danger"></span></label>
              <div class="col-sm-4">				
						<div>
							<div class="col-sm-3 pr-0 pl-0" >
								<div class="imgfile" style="width:92.5px;height:92.5px;"><img style="height: 100%;width: 100%" class="img-responsive user-photo img-rounded" 
              						id="beforUserPhoto" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" ></div>				
           					</div>
           				<input type="file" class="userPhoto" name="userPhoto" id="userPhoto" 
								aria-describedby="file_upload" accept="image/*">
								<small> * .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
						</div>
					</div>
            </div>
				
				
				<div class="form-group">
					<label class="control-label col-sm-5">Email ID <span class="text-danger"></span></label>
					<div class="col-lg-3 col-sm-4">
						<span><!-- class="input-group" -->
							<input type="email" class="form-control" name="userEmail"
								id="userEmail" readonly>
						   </span>
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
				
				
				<div class="form-group">
					<label class="control-label col-sm-5">비밀번호<span
						class="text-danger"></span></label>
					<div class="col-lg-3 col-sm-4">
						<div >
							<input type="password" class="form-control" name="userPwd"
								id="userPwd">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5">비밀번호 확인<span
						class="text-danger"></span></label>
					<div class="col-lg-3 col-sm-4">
						<div >
							<input type="password" class="form-control" name="cuserPwd"
								id="cuserPwd">
						</div>
					</div>
				</div>
			
				<div class="social-btn text-center">
				&nbsp;<button type="button" class="btn btn-primary" id="infoUpdate">정보수정 </button>
				&nbsp;<button type="button" class="btn btn-danger" id="deleteMember">회원탈퇴</button>
		  		</div>
			<br>
			</form>
		</div>
	</div>
	<br>	<br>	<br>
</div>

<script type="text/javascript">
var userPhoto; //회원 프로필 사진
var userNick; //회원 닉네임
var nickDupCheck; //닉네임 중복 진행했는지 확인하는 변수
var userEmail; //회원 이메일 담는 변수

//회원 정보 뿌리기
$.ajax({
	type : 'post',
	url : '${pageContext.request.contextPath}/member/myinfo.do',
	success : function(data) {
		userPhoto = data.userPhoto; 
		userNick = data.userNick;
		userEmail = data.userEmail;
		$('#userEmail').val(data.userEmail);
		$('#userNick').val(userNick);
		$('#beforUserPhoto').attr("src", "${pageContext.request.contextPath}/resources/image/userPhoto/" + userPhoto);
		}	
	,
	error : function(error) {
		console.log(error);
		console.log(error.status);
		}
	})
	
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
            		if ($('#userNick').val()==userNick){
            			$('#userNickMessage').addClass("successMessage")
            			$('#userNickMessage').text("사용 가능한 닉네임입니다.");
        				nickDupCheck = 'ok';
            		}else {
            			if (data > 0 ) {
                			$('#userNickMessage').addClass("failMessage")
                			$('#userNickMessage').text("이미 사용 중인 닉네임입니다.");
                			nickDupCheck = ''
                		} else {
                			$('#userNickMessage').addClass("successMessage")
                			$('#userNickMessage').text("사용 가능한 닉네임입니다.");
            				nickDupCheck = 'ok';
               		 }
            		}
            	},
            error : function(error) {
				swal("٩(இ ⌓ இ๑)۶", "잠시 후 다시 시도해 주세요.", "error");
				console.log(error);
				console.log(error.status);
            }
         });
		}
	});
	

$('#infoUpdate').click(function(){

	infoUpdateVali();
	
    var form = $('form')[0];
    //FormData parameter에 담아줌
    var formData = new FormData(form);
	
	swal({
		  title: "An input!",
		  text: "Write something interesting:",
		  type: "input",
		  showCancelButton: true,
		  closeOnConfirm: false,
		  inputPlaceholder: "Write something"
		}, function (inputValue) {
		  if (inputValue === false) return false;
		  if (inputValue === "") {
		    swal.showInputError("You need to write something!");
		    return false
		  }
		  swal("Nice!", "You wrote: " + inputValue, "success");
		});
})
		
	
//정보 수정 유효성 체크
function infoUpdateVali(){
if ($('#userNick').val() != userNick){
	if (nickDupCheck != 'ok' || userNick != $('#userNick').val()) {
  		swal("٩(இ ⌓ இ๑)۶", "사용할 수 없는 닉네임입니다.", "error");
  		return false;
		}
	}
}

//회원탈퇴
 $('#deleteMember').click(function(){
	  swal({
		  title: "Are you sure?",
		  text: "You will not be able to recover this imaginary file!",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "Yes, delete it!",
		  cancelButtonText: "No, cancel plx!",
		  closeOnConfirm: false,
		  closeOnCancel: true
		},
			function(isConfirm) {
		 		 if (isConfirm) {
					  $.ajax({
			       		type : 'post',
			        	data: {userEmail:userEmail},
			        	url :  '${pageContext.request.contextPath}/member/deleteMember.do',
			        	success : function(data) {
								 swal({type: "success",
								 title: '회원 탈퇴가 완료 되었습니다.',
				             	 confirmButtonClass : "btn-danger",
							 	 closeOnConfirm: false
									},
								 function(){
								 location.href="${pageContext.request.contextPath}/logout";
									});	
				       			},
						error : function(error) {
			          			 swal("٩(இ ⌓ இ๑)۶", "에러가 발생했습니다.", "error");
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