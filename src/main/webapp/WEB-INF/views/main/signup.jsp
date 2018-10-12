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
			<form class="form-horizontal" method="post" name="signup" id="signup" enctype="multipart/form-data">
				<div class="form-group">
					<label class="control-label col-sm-4">프로필 이미지</label>
					<div class="col-sm-4">				
						<div>
							<div class="col-xs-4">	
                 <img class="img-responsive user-photo img-rounded" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" >
           </div>
           				<input type="file"  name="userPhoto" id="userPhoto" 
								aria-describedby="file_upload" accept="image/*">
								<div class="form-group">
								<small>* .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
						 </div>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-4">Email ID </label>
					<div class="col-sm-4">
						
							<input type="email" class="form-control" name="userEmail"
								id="userEmail" placeholder="example@example.com" required
								autofocus value="">						
					</div>
					<div class="col-sm-4 pl-0"><button type="button" class="btn btn-secondary">이메일인증</button>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-4">Email  인증번호 </label>
					<div class="col-sm-4">
							<input type="text" class="form-control" name="authnum"
								id="authnum" placeholder="인증번호를 입력해주세요."
								value="">
						</div>
					<div class="col-sm-4 pl-0">
					     <button type="button" class="btn btn-secondary" >&ensp;인증확인&ensp;</button>
					     </div>
				</div>
					<div class="form-group">
					<label class="control-label col-sm-4">닉네임 </label>
						<div class="col-sm-4">
						<div >
							<input type="text" class="form-control" name="userNick"
								id="userNick" placeholder="사용할 닉네임을 입력해주세요." value="">
						</div>
					</div>
					<div class="col-sm-4 pl-0">
					 <button type="button" class="btn btn-secondary">&ensp;중복확인&ensp;</button>
				</div>
				</div>
				
				
				<div class="form-group">
					<label class="control-label col-sm-4">비밀번호</label>
					<div class="col-sm-4">
						<div >
							<input type="password" class="form-control" name="userPwd"
								id="userPwd" placeholder="6자리 이상 입력해주세요."
								value="">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-4">비밀번호 확인</label>
					<div class="col-sm-4">
						<div >
							<input type="password" class="form-control" name="cuserPwd"
								id="cuserPwd" placeholder="비밀번호를 확인 해주세요." value="">
						</div>
					</div>
				</div>
				
				<div class="form-group">
                  <label class="checkbox text-center">
    			<input type="checkbox" value="remember-me"><a href="" >이용약관</a>에 동의합니다.</label>
    			</div>
			
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<input name="join" type="button" value="&nbsp;&nbsp;회원가입&nbsp;&nbsp;" class="btn btn-danger btn-md">
					</div>
				</div>
			
				<div class="col-sm-12 text-center">
				<a href="#" class="btn btn-warning btn-md social-btn"> Sign up with <b>Kakao&nbsp;</b></a><br>
				<a href="#" class="btn btn-success btn-md social-btn" > Sign up with <b>Naver&nbsp;&nbsp;</b></a><br>
				<a href="#" class="btn btn-primary btn-md social-btn "> Sign up with <b>Google</b></a>
		  		</div>
			<br>
			</form>
		</div>
	</div>
	<br>	<br>	<br>
</div>

