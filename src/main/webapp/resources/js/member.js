/*
@JSP : member.js
@Date : 2018.11.02
@Author : 임효진
@Desc : myinfo.jsp, signup.jsp, signupSocial.jsp 
 */

$(function(){

//singup, singupSocial, myinfo에서 사용하는 변수
	//singup, singupSocial 공통 변수
	var nickDupCheck; //닉네임 중복 진행했는지 확인하는 변수. 근데 제외..초기값이 다름
	var writtenNick; //회원이 입력한 닉네임
	
	//singup, myinfo 변수
	var pwdDupCheck; //비밀번호 중복 진행했는지 확인하는 변수
	var rightPwd; //비밀번호 유효성 체크 변수

	//singup 변수
	var mailtoNum; //인증번호 담는 변수
	var mailCheck; //메일 인증 진행했는지 확인하는 변수
	var mailDupCheck; //메일 중복 진행했는지 확인하는 변수
	var writtenMail; //회원이 입력한 메일주소

	//singupSocial 변수
	var userEmail = $('#mailto').val();
	var userPwd = $('#userPwd').val();
		
	//myinfo 변수
	var userPhoto; //회원 프로필 사진
	var userNick; //회원 닉네임
	var userEmail; //회원 이메일
	var userPwd; //회원 비밀번호
	var nickDupCheck ='ok'; //닉네임 중복 진행했는지 확인하는 변수
	




//끝
})