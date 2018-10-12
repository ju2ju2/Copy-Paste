<%-- qna>>
@JSP : selectQnaboard.jsp
@Date : 2018.10.09
@Author : 이주원
@Desc : Q&A 게시판 상세보기 화면 입니다. 
		댓글 신고 기능 추가. 2018. 10. 12 이주원
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<!-- <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
 --><script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 신고 모달창에서 ok버튼 눌렀을 때 스윗알럳 띄우기 -->
<script>
$(document).ready(function(){
	$('#reportOK').click(function(){
		swal("신고되었습니다", "", "success")
			});	
})
</script>

  <!-- 댓글 신고 Modal -->
  <div class="modal fade" id="reportModal" role="dialog">
    <div class="modal-dialog">
     <!-- 댓글 신고 Modal content-->
      <div class="modal-content" align="left">
        <div class="modal-header" align="center">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글 신고</h4>
        </div>
        <div class="modal-body">
        <p><strong>작성자</strong>&ensp;&ensp;&ensp;똥싸개</p>
        <p style="width:300px;padding-top: 10px;"><strong>작성내용</strong>
        <div>운영자 이 xxxx xx야 너를 xxxx해서 운영자의 하느님이 주신 용돈을 내가 취하고 싶다. 
        이 xxxx야. 사이트 운영을 개떡대가리같이 하는구나. 어떻게 7분 31초가 지나도록 댓글을 안 달 수가 있냐. 그래놓고도 니가 운영자냐.</div>
        </p>
        <p style="padding-top: 10px;"><strong>신고 사유</strong>&ensp;
        	<select name="cause-category" id="cause-category">
			<option value="">신고 사유를 선택하세요</option>
			<option value="1">저작권 위반</option>
			<option value="1">음란성</option>
			<option value="1">명예훼손</option>
			<option value="1">개인정보 유출</option>
			<option value="1">부적절한 홍보</option>
			<option value="1">기타</option>
			</select>
		</p>
		<p style="padding-top: 10px;"><strong>신고 사유 상세</strong></p><textarea rows="8" class="form-control textarea" placeholder="신고 사유를 입력하세요"></textarea>
		<br>
		<p align="center"><strong>위와 같은 내용으로 해당 댓글을 신고하시겠습니까?</strong></p>
        </div>
        
        <div class="modal-footer">
        <center>
        	<a data-toggle="modal" href="#" data-target="#reportModal" 
        	role="button" class="btn main-btn" data-backdrop="static" id="reportOK">OK</a>
	        <a data-toggle="modal" href="#" data-target="#reportModal" 
        	role="button" class="btn btn-default" data-backdrop="static">Calcel</a>
        </center>
       	</div>
      </div>
      
    </div>
  </div>



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
	         		<h3 align="center"><strong>청소년에게 왜 부적절한데요;;;</strong></h3>
	       	 	</div>
	        </div>	
			
				<div class="col-md-12">
	        	<div class="form-group" align="right">
	         		<strong>발렌티</strong>&nbsp;&nbsp;18/08/27
	       	 	</div>
	        </div>	
			
			<div class="col-md-12">
		        <div class="qnacontent">
			        <p>
			       
			       
			        맨날 술만 처마시냐 발렌티라고 발렌티 발렌타인이 아니고 아니 그리고 발렌타인이라고 청소년에게 유해하다는 것도 웃기네
				발렌타인 데이가 뉴스에서 필터링 돼서 나오는 거 봤냐? 아 진짜 운영자 핵미친놈 빨리 블라인드 풀어
			        
			        
			        </p>
		        </div>
	        <div class="col-md-12">
	
</form>	
		
    <div class="col-lg-12 col-sm-12 text-left">
    <div class="comment-box">  
    	<ul data-brackets-id="12674" id="sortable" class="list-unstyled ui-sortable">
            <div class="media-left">
	        	<img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
	        </div>
	        <div class="media-body">
                <strong class="pull-left primary-font">blueblue</strong><br>
                <small class="pull-right text-muted">
	          <i class="fas fa-trash"></i></span> &ensp;
	          <i class="fas fa-comment"></i> &ensp; 
	          <a href="#" data-toggle="modal" data-target="#reportModal" id="report" class="fas fa-bullhorn"></a>
	          </small>
                <p>운영자 일 안하십니까? 답변 안하시냐구요. 지금 질문한지 7분 13초나 지났는데 아직도 답변 안주시네요. 사이트 폭망하시길 기원합니다.</p>      
            	
            </div>
	        </ul>
	        <!-- <strong class="pull-left primary-font">blueblue</strong>
	        <small class="pull-right text-muted">
	           <span class="glyphicon glyphicon-time"></span>7 mins ago</small>
	        </br>
			<li>운영자 일 안하십니까? 답변 안하시냐구요. 지금 질문한지 7분 13초나 지났는데 아직도 답변 안주시네요. 사이트 폭망하시길 기원합니다.</li>
	        </br> -->
	     
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

	
</div></section>
