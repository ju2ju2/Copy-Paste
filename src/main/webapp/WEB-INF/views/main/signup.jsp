<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="row">
		<div class="center-block ">
			<h2 class="text-center signup-title">회원가입</h2>
			<hr>
			<form class="form-horizontal" method="post" name="signup" id="signup" enctype="multipart/form-data">
				<div class="form-group">
					<label class="control-label col-sm-5">프로필 이미지<span class="text-danger">*</span></label>
					<div class="col-lg-4 col-sm-4">				
						<div>
							<div class="col-xs-3">	
                 <img class="img-responsive user-photo img-rounded"" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"  size="">
           </div>
           <input type="file"  name="file_nm" id="file_nm" 
								aria-describedby="file_upload" accept="image/*">
								<div class="form-group">
								<small>* .jpg, .gif, .png 파일만 업로드 가능하며, 500kb를 초과할 수 없습니다.</small>
						 </div>
						</div>
					</div>
				</div>
				
				
				<div class="form-group">
					<label class="control-label col-sm-5">Email ID <span class="text-danger">*</span></label>
					<div class="col-lg-3 col-sm-4">
						<span><!-- class="input-group" -->
							<input type="email" class="form-control" name="emailid"
								id="emailid" placeholder="example@example.com" required
								autofocus value="">
						   </span>
					</div>
					   <button type="button" class="btn btn-secondary">이메일인증</button>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5">Email  인증번호 <span
						class="text-danger">*</span></label>
					<div class="col-lg-3 col-sm-4">
						<span >
							<input type="text" class="form-control" name="authnum"
								id="authnum" placeholder="인증번호를 입력해주세요."
								value="">
						</span>
					</div>
					<button type="button" class="btn btn-secondary" >&ensp;인증확인&ensp;</button>
				</div>
					<div class="form-group">
					<label class="control-label col-sm-5">닉네임 <span
						class="text-danger">*</span></label>
						<div class="col-lg-3 col-sm-4">
						<div >
							<input type="text" class="form-control" name="nickname"
								id="nickname" placeholder="사용할 닉네임을 입력해주세요." value="">
						</div>
					</div>
					 <button type="button" class="btn btn-secondary">&ensp;중복확인&ensp;</button>
				</div>
				
				
				<div class="form-group">
					<label class="control-label col-sm-5">비밀번호<span
						class="text-danger">*</span></label>
					<div class="col-lg-3 col-sm-4">
						<div >
							<input type="password" class="form-control" name="password"
								id="password" placeholder="6자리 이상 입력해주세요."
								value="">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-5">비밀번호 확인<span
						class="text-danger">*</span></label>
					<div class="col-lg-3 col-sm-4">
						<div >
							<input type="password" class="form-control" name="cpassword"
								id="cpassword" placeholder="비밀번호를 확인 해주세요." value="">
						</div>
					</div>
				</div>
				
				<div class="form-group">
                  <label class="checkbox text-center">
    			<input type="checkbox" value="remember-me"><a href="" >이용약관</a>에 동의합니다.</label>
    			</div>
			
				<div class="form-group">
					<div class="col-sm-16 text-center">
						<input name="join" type="button" value="&nbsp;&nbsp;회원가입&nbsp;&nbsp;" class="btn btn-danger btn-md">
					</div>
				</div>
			
				<div class="social-btn text-center">
				<a href="#" class="btn btn-warning btn-md social-btn"><i class="fa fa-kakao"></i> Sign up with <b>Kakao&nbsp;</b></a><br>
				<a href="#" class="btn btn-success btn-md social-btn" ><i class="fa fa-naver"></i> Sign up with <b>Naver&nbsp;&nbsp;</b></a><br>
				<a href="#" class="btn btn-primary btn-md social-btn "><i class="fa fa-google"></i> Sign up with <b>Google</b></a>
		  		</div>
			<br>
			</form>
		</div>
	</div>
	<br>	<br>	<br>
</div>

