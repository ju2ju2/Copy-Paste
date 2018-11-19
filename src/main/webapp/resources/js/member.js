/*
@JS : member.js
@Date : 2018.11.10
@Author : 임효진
@Desc : myinfo, signup, singnupSocial에서 사용
*/

var writtenNick; //회원이 입력한 닉네임


//닉네임 중복함수1/2. 닉네임 입력칸이 공백인 경우 처리(signup, signupSocial, myinfo)
function checkNick(pageName){
	if ($('#userNick').val() == ''){
		if($('#userNickMessage').hasClass("successMessage")){
			$('#userNickMessage').removeClass("successMessage");
			}
    	$('#userNickMessage').addClass("failMessage");
		$('#userNickMessage').text("사용할 닉네임을 입력해주세요");
		if (pageName == 'signup'){
			nickDupCheck = '';
			}
		} else {
			checkNick2(pageName);
		}
}

//닉네임 중복 함수2/2. 닉네임 입력칸이 공백이 아닌 경우 DB와 닉네임 중복 확인(signup, signupSocial, myinfo)
function checkNick2(pageName){
	$.ajax({
        type : 'post',
        url : '../copyNpaste/member/checkUserNick.do',
        data : {userNick:$('#userNick').val()},
        success : function(data) {
        	if ($('#userNick').val()==userNick){
    			$('#userNickMessage').removeClass("failMessage")
    			$('#userNickMessage').addClass("successMessage")
    			$('#userNickMessage').text("사용 가능한 닉네임입니다.");
				nickDupCheck = 'ok';   
    		} else {
    			if (data > 0) {
    				if($('#userNickMessage').hasClass("successMessage")){
    					$('#userNickMessage').removeClass("successMessage");
        			}
    				$('#userNickMessage').addClass("failMessage");
    				$('#userNickMessage').text("이미 사용 중인 닉네임입니다.");
    				nickDupCheck = '';
    			} else {
    				if($('#userNickMessage').hasClass("failMessage")){
    					$('#userNickMessage').removeClass("failMessage");
    					}
    				$('#userNickMessage').addClass("successMessage");
    				$('#userNickMessage').text("사용 가능한 닉네임입니다.");
    				nickDupCheck = 'ok';
    				if (pageName == 'singup'){
    					writtenNick = $('#userNick').val();
    					}
        		}
    		}	
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
     });	
}
	
//비밀번호에는 영문, 숫자만 입력 가능(signup, myinfo)
function pwdValid(){
		regexp =  /^[0-9a-zA-Z]{6,20}$/i;
		var v = $(this).val();
		if (regexp.test(v)) {
			$('#userPwdMessage').removeClass("failMessage");
			$('#userPwdMessage').addClass("successMessage");
			$('#userPwdMessage').text("사용 가능한 비밀번호입니다.");
			rightPwd = 'ok';
			}else{
				$('#userPwdMessage').removeClass("successMessage");
				$('#userPwdMessage').addClass("failMessage");
				$('#userPwdMessage').text("알파벳 대소문자, 숫자를 이용해 6글자 이상 입력해주세요."); 
				rightPwd = '';
			}
}
	
//비밀번호 일치 확인 (signup, myinfo)
function pwdDupCheck(){
	if($(this).val() != $('#userPwd').val()){
		$('#userPwdConfirmMessage').removeClass("successMessage")
		$('#userPwdConfirmMessage').addClass("failMessage")
		$('#userPwdConfirmMessage').text("비밀번호를 정확히 입력해주세요.");
		pwdDupCheck = '';
	} else {
		$('#userPwdConfirmMessage').removeClass("failMessage")
		$('#userPwdConfirmMessage').addClass("successMessage")
		$('#userPwdConfirmMessage').text("비밀번호가 일치합니다.");
		pwdDupCheck = 'ok';
	}
}