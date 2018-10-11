<%-- qna>>
@JSP : insertQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 글쓰기 화면입니다. 동기식으로 이동합니다.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<section id="content">
	<div class="container">

<form action="./BoardAddAction.bo" method="post" id="insertQnaform" class="contact-form">
	<input type="hidden" name="Member_email" value="${sessionScope.email}">
		<c:if test="${sessionScope.email=='admin@admin.org'}">
 			<tr>
 				<td style="font-family:돋음; font-size:12" width="10%" height="16">
				<div align="left"><h3>Q&A 게시판</h3></div></td>
			</tr>
 		</c:if>
		
		<%-- <tr> 
			<td style="Display:none"><strong>작성자</strong></td>
			<td style="Display:none">${sessionScope.email}</td>
		</tr> --%>
	
			<div class="col-md-12">
	        	<div class="form-group">
	         		<input type="text" class="form-control" name="qnatitle" autocomplete="off" id="qnatitle" placeholder="제목">
	       	 	</div>
	        </div>	
			
	        <div class="col-md-12">
		        <div class="form-group">
		            <textarea class="form-control textarea" rows="15" name="qnacontent" id="qnacontent" placeholder="내용을 입력하세요"></textarea>
		        </div>
	        </div>
		<div class="row">
	         <button type="submit" class="btn main-btn center-block" id="qnainsertbtn">등록</button>
		</div>
	
</form>	
	
	
</div></section>
