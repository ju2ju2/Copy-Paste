<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<div class="container">
    	<div class="row">
        	<div class="col-sm-6 col-md-4 col-md-offset-4">
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
    		<div class="text-center">
			<a href="#" class="btn btn-warning btn-block btn-lg"><i class="fa fa-kakao"></i> Sign in with <b>Kakao</b></a>
			<a href="#" class="btn btn-success btn-block btn-lg"><i class="fa fa-naver"></i> Sign in with <b>Naver</b></a>
			<a href="#" class="btn btn-primary btn-block btn-lg"><i class="fa fa-google"></i> Sign in with <b>Google</b></a>
		     </div>
   					 <a href="#" class="pull-right need-help">Forgot password? </a><span class="clearfix"></span>
   					 <a href="signup.htm" class="pull-right new-account">SING UP</a><span class="clearfix"></span>
  						</form:form>
 					   </div><br><br><br><br>
           			 </div>
    			</div>
			</div>

