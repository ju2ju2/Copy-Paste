<%-- main>>
@JSP : login.jsp
@Date : 2018.10.10
@Author : 문지은
@Desc : 로그인 페이지.
--%>

<<<<<<< Updated upstream
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div>
			<h2 class="text-center login-title">LOGIN</h2>
			<hr>
			<div>
				<c:url value="login" var="loginUrl" />
				<form:form class="form-signin" name="f" action="${loginUrl}"
					method="POST">
					<c:if test="${param.error != null}">
						<p>아이디와 비밀번호가 잘못되었습니다.</p>
					</c:if>
					<c:if test="${param.logout != null}">
						<p>로그아웃 하였습니다.</p>
					</c:if>
					<input type="text" id="userEmail" name="emailid"
						class="form-control" placeholder="Email" required autofocus />
					<input type="password" id="userPwd" name="password"
						class="form-control" placeholder="Password" required />
					<button class="btn btn-lg btn-danger btn-block" type="submit">로그인</button>
					<hr>
					<h3 class="mg-top-6 text-center login-title">SNS LOGIN</h3>
					<div class="text-center">
						<hr>
						&nbsp;<a href="#"><img src="./resources/image/naver.png"
							class="inline"> &ensp;</a> <a href="#"><img
							src="./resources/image/kakao.png" class="inline"> &ensp;</a> <a
							href="#"><img src="./resources/image/google.png"
							class="inline"></a>
					</div>


					<a data-toggle="modal" href="#" class="pull-right need-help"
						data-target="#modal-tempPassword" role="button"
						data-backdrop="static"> Forgot password? </a>
					<span class="clearfix"></span>
					<a href="signup.htm" class="pull-right new-account">SING UP</a>
					<span class="clearfix"></span>
				</form:form>
			</div>
			<br> <br> <br> <br>
		</div>
	</div>
</div>


<!-- Modal HTML -->
<div id="modal-tempPassword" class="modal fade text-center"
	tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">임시 비밀번호</h4>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<div class="container">
    	<div class="row">
        	<div >
            	<h2 class="text-center login-title">LOGIN</h2><hr>
            		<div >
		<c:url value="login" var="loginUrl" />
  <form:form class="form-signin" name="f" action="${loginUrl}" method="POST">
     <c:if test="${param.error != null}">
        <p>아이디와 비밀번호가 잘못되었습니다.</p>
     </c:if>
    <c:if test="${param.logout != null}">
        <p>로그아웃 하였습니다.</p>
    </c:if>
         <input type="text" id="userEmail" name="emailid" class="form-control" placeholder="Email" required autofocus />
         <input type="password" id="userPwd" name="password" class="form-control" placeholder="Password" required/>
    	 <button class="btn btn-lg btn-danger btn-block" type="submit" >로그인</button>
              <hr>
    		<h3 class="mg-top-6 text-center login-title">SNS LOGIN</h3>
    		<div class="text-center"><hr>
			&nbsp;<a href="#"><img src="./resources/image/naver.png" class="inline"> &ensp;</a>
			<a href="#"><img src="./resources/image/kakao.png" class="inline"> &ensp;</a>
			<a href="#"><img src="./resources/image/google.png" class="inline"></a>
		     </div>
		    
   					 <a href="#" class="pull-right need-help">Forgot password? </a><span class="clearfix"></span>
   					 <a href="signup.htm" class="pull-right new-account">SING UP</a><span class="clearfix"></span>
  						</form:form>
 					   </div><br><br><br><br>
           			 </div>
    			</div>
>>>>>>> Stashed changes
			</div>
			<div class="modal-body">
				<div class="form-group">
					<div class="row">
						<div>
							<form class="form-signin" name="f" action="${loginUrl}"	method="POST">
							<input type="text" id="userEmail" name="userEmail"
								class="form-control" placeholder="Email" required autofocus />
							<button class="mt-10 btn btn-sm btn-danger btn-block" type="submit">임시비밀번호
								발송</button>
							</form>
						</div>
					</div>
					<div class="row">
						<b>비밀번호 찾기 안내</b>
						<p>
							사용자 이메일로 임시비밀번호가 발송됩니다.</br> 비밀번호 찾기 후 반드시 포털시스템에서 비밀번호를 수정하시기 바랍니다.
						</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>



