<%-- main>>
@JSP : signup.jsp
@Date : 2018.10.10
@Author : 문지은
@Desc : 회원가입 페이지.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="center-block ">
			<h2 class="text-center signup-title">회원가입</h2>
			<hr>
			<form class="form-signup" method="post" id="signup" enctype="multipart/form-data">
			
			<div class="form-group">
			<label class="control-label col-sm-4">프로필 이미지</label>
					<div class="col-sm-5">				
						<div>
							<div class="col-sm-3 pr-0 pl-0" >	
              					<img class="img-responsive user-photo img-rounded" 
              						src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" >
           					</div>
           				<input type="file"  name="userPhoto" id="userPhoto" 
								aria-describedby="file_upload" accept="image/*">
								<small> * .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
						</div>
					</div>
				</div>
				
				<div class=" col-sm-8">
				<label class="control-label col-sm-4 pr-0 pl-0">Email ID </label>
				</div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="이메일 주소입력">
                <input type="button" name="name" class="social-btn"id="signbtn" value="이메일인증">
                
                <div class=" col-sm-8">
                <label class="control-label col-sm-4 pr-0 pl-0">Email  인증번호 </label></div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="이메일 인증번호 입력">
                <input type="button" name="name" class="social-btn"id="signbtn" value="인증확인">
                
                <div class=" col-sm-8">
                <label class="control-label col-sm-4 pr-0 pl-0">닉네임 </label></div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="닉네임입력">
                <input type="button" name="name" class="social-btn"id="signbtn" value="중복확인">
                
                <div class=" col-sm-8">
                <label class="control-label col-sm-4 pr-0 pl-0">비밀번호</label></div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="비밀번호를 입력해주세요">
		        
		        <div class=" col-sm-8">
		        <label class="control-label col-sm-4 pr-0 pl-0 mt-10">비밀번호 확인</label></div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="비밀번호 확인">
                
                <label class="checkbox text-center">
    			<input type="checkbox" value="remember-me"><a href="" >이용약관</a>에 동의합니다.</label>
				
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<input name="join" type="button" value="&nbsp;&nbsp;회원가입&nbsp;&nbsp;" class="btn btn-danger btn-md">
						<input name="join" type="button" value="&nbsp;&nbsp; 취소 &nbsp;&nbsp;" class="btn btn-primary btn-md">
				</div>
			
				<div class="col-sm-12 text-center social-btn">
				<a href="#" class="btn btn-md social-btn"> Sign up with <b>&nbsp;Kakao&nbsp;</b>
				<img src="./resources/image/kakao.png" class="inline"></a><br>
				<a href="#" class="btn  btn-md social-btn" > Sign up with <b>&nbsp;Naver &nbsp;</b>
				<img src="./resources/image/naver.png" class="inline"></a><br>
				<a href="#" class="btn  btn-md social-btn "> Sign up with <b>Google&nbsp;</b>
				<img src="./resources/image/google.png" class="inline"></a>
		  		</div>
		  		</div>
			<br>
			</form>
		</div>
	</div>
	<br>	<br>	<br>
</div>
					
					
				