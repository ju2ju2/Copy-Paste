/*
@JS : member.js
@Date : 2018.11.10
@Author : 임효진
@Desc : myinfo,signup, singnupSocial에서 사용
*/

console.log('member.js');

//header.jsp에서 사용


/*header.jsp의 사용자 프로필 이미지 , 닉네임 출력
myinfo.jsp에서 사용자 정보 뿌림*/

var userSocialStatus;

function selectMemberInfo(pageName){
	var pageName = pageName;
	console.log('pageName: ' + pageName);
	if(session != ''){
		$.ajax({
				type : 'post',
				url : '../copyNpaste/member/myinfo.do',
				success : function(data) {
						userPhoto = data.userPhoto; 
						userNick = data.userNick;
						userSocialStatus = data.userSocialStatus;
						
						console.log('userNick: ' + userNick);
						console.log('userPhoto: ' + userPhoto);
						console.log('userSocialStatus: ' + userSocialStatus);
						
						if(pageName == 'header'){													
							$('.userNick').text(userNick);
							if (userSocialStatus != 0){
								$('#headerUserPhoto').attr("src", userPhoto);
							} else {$('#headerUserPhoto').attr("src", "../copyNpaste/resources/image/userPhoto/" + userPhoto);	
							}
						}
						if (pageName == 'myinfo'){
							console.log(pageName);
							userEmail = data.userEmail;	
							$('#userEmail').val(data.userEmail);
							$('#userNick').val(userNick); 
							if (userSocialStatus != 0){
								$('.socialUser').hide();
								$('#beforUserPhoto').attr("src", userPhoto);
							} else {$('#beforUserPhoto').attr("src", "${pageContext.request.contextPath}/resources/image/userPhoto/" + userPhoto);
									$('.normalUser').hide();
								}
						}
					},
		     	error:function(error) {
		     			console.log('에러');
		     			console.log(error.status);
		     	  }
		     })
	}
}