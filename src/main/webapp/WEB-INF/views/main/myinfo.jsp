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
				
				<div class=" col-sm-9">
				<label class="control-label col-sm-3 pr-0 pl-0">Email ID </label>
				</div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="이메일 주소입력">
                
                <div class=" col-sm-8">
                <label class="control-label col-sm-4 pr-0 pl-0 mt-5">닉네임 </label></div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="닉네임입력">
                <input type="button" name="name" class="social-btn"id="signbtn" value="중복확인">
                
                <div class=" col-sm-8">
                <label class="control-label col-sm-4 pr-0 pl-0">비밀번호</label></div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="비밀번호를 입력해주세요">
		        
		        <div class=" col-sm-8">
		        <label class="control-label col-sm-4 mt-5 pr-0 pl-0 ">비밀번호 확인</label></div>
		        <input type="text" class="form-control text" name="name" value="" placeholder="비밀번호 확인">
                
             
			
				<div class="social-btn text-center">
				&nbsp;<a href="#" class="btn btn-primary  ">정보수정 </a>&nbsp;<a href="#" class="btn btn-danger ">회원탈퇴 </a>
		  		</div>
		  		</div>
			<br>
			</form>
		</div>
	</div>
	<br>	<br>	<br>
</div>
			
			
			<!-- <form class="form-horizontal" method="post" name="signup" id="signup" enctype="multipart/form-data">
				<div class="form-group">
					<label class="control-label col-sm-5">프로필 이미지<span class="text-danger"></span></label>
					<div class="col-lg-4 col-sm-4">				
						<div>
							<div class="col-sm-2 pr-0 pl-0">	
                 <img class="img-responsive user-photo img-rounded" src="https://s-i.huffpost.com/gen/3948866/thumbs/o-PEPE-THE-FROG-570.jpg?3"  >
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
					<label class="control-label col-sm-5">Email ID <span class="text-danger"></span></label>
					<div class="col-lg-3 col-sm-4">
						<span>class="input-group"
							<input type="email" class="form-control" name="emailid"
								id="emailid" placeholder="admin@admin.com" required
								autofocus value="" readonly>
						   </span>
					</div>
				</div>
					<div class="form-group">
					<label class="control-label col-sm-5">닉네임 <span
						class="text-danger"></span></label>
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
						class="text-danger"></span></label>
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
						class="text-danger"></span></label>
					<div class="col-lg-3 col-sm-4">
						<div >
							<input type="password" class="form-control" name="cpassword"
								id="cpassword" placeholder="비밀번호를 확인 해주세요." value="">
						</div>
					</div>
				</div>
			
				<div class="social-btn text-center">
				&nbsp;<a href="#" class="btn btn-primary btn-sm ">정보수정 </a>&nbsp;<a href="#" class="btn btn-danger btn-sm">회원탈퇴 </a>
		  		</div>
			<br>
			</form>
		</div>
	</div>
	<br>	<br>	<br>
</div>
 -->
