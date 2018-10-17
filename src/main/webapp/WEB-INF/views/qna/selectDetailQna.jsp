<%-- qna>>
@JSP : selectQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 상세보기 화면 입니다. 
		댓글 신고 기능 추가. 2018. 10. 12 이주원
		
@Date : 2018.10.09
@Author : 임지현
@Desc : Q&A 게시판 상세보기
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<section id="content">
	<div class="container">
		<form action="./BoardAddAction.bo" method="post" id="insertQnaform" class="contact-form">
			<input type="hidden" name="Member_email" value="${sessionScope.email}">
			<c:if test="${sessionScope.email=='admin@admin.org'}">
 				<tr>
 					<td style="font-family:돋음; font-size:12" width="10%" height="16">
						<div align="left">
							<h3>Q&A 게시판</h3>
						</div>
					</td>
				</tr>
	 		</c:if>
	 		<!-- QnA 게시판 디테일 -->
			<div class="col-md-12">
		       	<div class="form-group">
		       		<h3 align="center"><strong>제목영역</strong></h3>
		     	</div>
			</div>				
			<div class="col-md-12">
		        <div class="form-group" align="right">
		         	<strong>작성자영역</strong>&nbsp;&nbsp;작성일자
		       	 </div>
			</div>		
			<div class="col-md-12">
				<div class="qnacontent">
					<p>컨텐츠 내용<br>맨날 술만 처마시냐 발렌티라고 발렌티 발렌타인이 아니고 아니 그리고 발렌타인이라고 청소년에게 유해하다는 것도 웃기네
					발렌타인 데이가 뉴스에서 필터링 돼서 나오는 거 봤냐? 아 진짜 운영자 핵미친놈 빨리 블라인드 풀어</p>
			     </div>
			</div>		 
		</form>	
		<!-- QnA 댓글 -->
		<div class="col-lg-12 col-sm-12 text-left">
			<div class="comment-box">  
				<ul data-brackets-id="12674" id="sortable" class="list-unstyled ui-sortable">
					<div class="media-left">
						<img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</div>
	        		<div class="media-body">
                		<strong class="pull-left primary-font">blueblue</strong><br>
                		<small class="pull-right text-muted">
	          				<i class="fas fa-trash"></i> &ensp;
	          				<i class="fas fa-comment"></i> &ensp; 
	          				<a href="#" data-toggle="modal" data-target="#reportModal" id="report" class="fas fa-bullhorn"></a>
	          			</small>
             		   	<p>운영자 일 안하십니까? 답변 안하시냐구요. 지금 질문한지 7분 13초나 지났는데 아직도 답변 안주시네요. 사이트 폭망하시길 기원합니다.</p>      
            		</div>
	       		 </ul>
	       		</div>
	       		</div>
		    <div class="media-left">
	       		 <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
	        </div>
	        <div class="media-body">
                <strong class="pull-left primary-font">green</strong><br>
                <small class="pull-right text-muted">
	           <i class="fas fa-trash"></i> &ensp;
	           <i class="fas fa-comment"></i> &ensp;
	           <a href="#" data-toggle="modal" data-target="#reportModal" id="report" class="fas fa-bullhorn"></a></small>
                <p>위엣분 성격 더럽게 급하시네요.</p>      
            </div>
        
     <div class="input-group">
	        <input type="text" id="userComment" class="form-control input-sm chat-input" placeholder="댓글을 입력하세요" />
		    <span class="input-group-btn" onclick="addComment()">     
	            <div>
	            <a href="#" class="btn main-btn center-block" id="commentbtn"><i class="fas fa-check"></i> Add Comment</a>	
	            </div>
	        </span>
    </div>
</div>
</section>
