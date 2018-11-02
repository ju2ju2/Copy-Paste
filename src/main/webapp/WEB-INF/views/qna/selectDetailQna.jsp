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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!-- Sweet Alert cdn -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/api/alert/sweetalert.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/api/sweetalert.min.js"></script>

<se:authentication property="name" var="loginuser" />
<se:authentication property="authorities" var="role" />

<section id="content">
	<div class="container qnaDitailContent">
		<c:choose>
			
			<c:when test="${qna.qnaSecret>0}">
				<c:choose>
					<c:when test="${role=='[ROLE_ADMIN]' || loginuser==qna.userEmail}">
						<form action="./BoardAddAction.bo" method="post" id="insertQnaform" class="contact-form">
					<input type="hidden" name="Member_email" value="${sessionScope.email}">
					<!-- QnA 게시판 디테일 -->
					<div class="col-md-12 ">
						<div class="form-group">
							<h3 align="center">
							<strong>${qna.qnaTitle}</strong>
							</h3>
						</div>
					</div>
					<div class="col-md-12 qnaDetail">
						<div class="form-group" align="right">
							<strong>${qna.userNick}</strong>&nbsp;&nbsp;${qna.qnaDate}
						</div>
					</div>
					<div class="col-md-12 qnaContent">
						<div class="qnacontent">${qna.qnaContent}</div>
						<br />
					</div>
					<div class="col-md-12">
						<div class="form-group qnaDetail" align="right">
						<!-- 게시글 답글, 삭제버튼 -->
						<c:choose>
							<c:when test="${role=='[ROLE_ADMIN]'}">
								<a href="updateQna.htm?qnaNum=${qna.qnaNum}&qnaDept=1" ><i class="fas fa-edit"></i></a>
								<a href="insertQnaboard.htm?qnaNum=${qna.qnaNum}&qnaDept=1" class="qnaReply"><i class="fas fa-reply"></i></a>&nbsp;&nbsp;
								<a href="deleteQna.htm?qnaNum=${qna.qnaNum}" class="qnaDel"><i class="fas fa-trash"></i></a>
							</c:when>
							<c:when test="${qna.userEmail==loginuser}">
								<a href="updateQna.htm?qnaNum=${qna.qnaNum}&qnaDept=1" ><i class="fas fa-edit"></i></a>
								<a href="deleteQna.htm?qnaNum=${qna.qnaNum}" class="qnaDel"><i class="fas fa-trash"></i></a>
							</c:when>
						</c:choose>
					</div>
				</div>
			</form>
			<!-- QnA 댓글 -->
			<div class="col-lg-12 col-sm-12 text-left">
				<div class="commentBox">
					<c:forEach var="qnaComm" items="${qnaCommList}">
						<div class="comment">
							<strong class="pull-left primary-font"> 
								<c:if test="${qnaComm.qnaCommDept==1}">
								ㄴ
								</c:if>
								${qnaComm.userNick}
							</strong> 
							${qnaComm.qnaCommDate}<br> 
							<small class="pull-right text-muted"> 
								<!-- 본인이거나 admin일때 삭제버튼 -->
								<c:if test="${role=='[ROLE_ADMIN]' or qnaComm.userEmail==loginuser}">
									<i class="fas fa-trash qnaCommTrashBtn"> 
										<input id="qnaCommNum" type="hidden" value="${qnaComm.qnaCommNum}" />
									</i>
								</c:if> 
								<!-- 댓글일때 본인이거나 admin일때 대댓글버튼 --> 
								<c:choose>
									<c:when test="${qnaComm.qnaCommDept == 0 and qna.userEmail==loginuser}">
										<i class="fas fa-comment qnaCommCommBtn"> 
											<input id="qnaCommNum" type="hidden" value="${qnaComm.qnaCommNum}" />
											<input id="qnaCommPos" type="hidden" value="${qnaComm.qnaCommPos}" />
										</i>
									</c:when>
									<c:when test="${qnaComm.qnaCommDept == 0 and role=='[ROLE_ADMIN]'}">
										<i class="fas fa-comment qnaCommCommBtn"> 
											<input id="qnaCommNum" type="hidden" value="${qnaComm.qnaCommNum}" />
											<input id="qnaCommPos" type="hidden" value="${qnaComm.qnaCommPos}" />
										</i>
									</c:when>
								</c:choose>
							</small>
							<div class="qnaCommContent">
								<c:if test="${qnaComm.qnaCommDept==1}">
									&ensp;&ensp;
								</c:if>
								${qnaComm.qnaCommContent}
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 로그인한 회원,어드민들 댓글창 -->
				<se:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
					<div class="qnaComm-inputBox input-group">
						<input type="text" id="userComment" class="form-control input-sm chat-input" placeholder="댓글을 입력하세요" />
						<span class="input-group-btn commentBtn">
							<a href="#" class="btn main-btn center-block" id="commentBtn">
								<i class="fas fa-check"></i> Add Comment
							</a>
						</span>
					</div>
				</se:authorize>
				<!-- 비회원일때 댓글창 -->
				<se:authorize access="!hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
					<div class="qnaComm-inputBox input-group">
						<input type="text" id="userComment" disabled class="form-control input-sm chat-input" placeholder="로그인 후 이용해주세요" />
					</div>
				</se:authorize>
				</div>
					</c:when>
					<c:otherwise>
						<div class="col-sm-12 secretQna">
						<div class="secretQnaBox">
							<div class="secretQnaBoxContent">
							비밀글인 게시글 입니다.
							</div><br/>
							<div class="secretQnaBtn">
								<button class="btn btn-danger historyBtn">뒤로</button>
							</div>
						</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:when>
	
			<c:otherwise>
				<form action="./BoardAddAction.bo" method="post" id="insertQnaform" class="contact-form">
					<input type="hidden" name="Member_email" value="${sessionScope.email}">
					<!-- QnA 게시판 디테일 -->
					<div class="col-md-12">
						<div class="form-group">
							<h3 align="center">
							<strong>${qna.qnaTitle}</strong>
							</h3>
						</div>
					</div>
					<div class="col-md-12 qnaDetail">
						<div class="form-group" align="right">
							<strong>${qna.userNick}</strong>&nbsp;&nbsp;${qna.qnaDate}
						</div>
					</div>
					<div class="col-md-12 qnaContent">
						<div class="qnacontent">${qna.qnaContent}</div>
						<br />
					</div>
					<div class="col-md-12">
						<div class="form-group qnaDetail" align="right">
						<!-- 게시글 답글, 삭제버튼 -->
						<c:choose>
							<c:when test="${role=='[ROLE_ADMIN]'}">
								<a href="updateQna.htm?qnaNum=${qna.qnaNum}&qnaDept=1" ><i class="fas fa-edit"></i></a>
								<a href="insertQnaboard.htm?qnaNum=${qna.qnaNum}&qnaDept=1" class="qnaReply"><i class="fas fa-reply"></i></a>&nbsp;&nbsp;
								<a href="deleteQna.htm?qnaNum=${qna.qnaNum}" class="qnaDel"><i class="fas fa-trash"></i></a>
							</c:when>
							<c:when test="${qna.userEmail==loginuser}">
								<a href="updateQna.htm?qnaNum=${qna.qnaNum}&qnaDept=1" ><i class="fas fa-edit"></i></a>
								<a href="deleteQna.htm?qnaNum=${qna.qnaNum}" class="qnaDel"><i class="fas fa-trash"></i></a>
							</c:when>
						</c:choose>
					</div>
				</div>
			</form>
			<!-- QnA 댓글 -->
			<div class="col-lg-12 col-sm-12 text-left">
				<div class="commentBox">
					<c:forEach var="qnaComm" items="${qnaCommList}">
						<div class="comment">
							<strong class="pull-left primary-font"> 
								<c:if test="${qnaComm.qnaCommDept==1}">
								ㄴ
								</c:if>
								${qnaComm.userNick}
							</strong> 
							${qnaComm.qnaCommDate}<br> 
							<small class="pull-right text-muted"> 
								<!-- 본인이거나 admin일때 삭제버튼 -->
								<c:if test="${role=='[ROLE_ADMIN]' or qnaComm.userEmail==loginuser}">
									<i class="fas fa-trash qnaCommTrashBtn"> 
										<input id="qnaCommNum" type="hidden" value="${qnaComm.qnaCommNum}" />
									</i>
								</c:if> 
								<!-- 댓글일때 본인이거나 admin일때 대댓글버튼 --> 
								<c:choose>
									<c:when test="${qnaComm.qnaCommDept == 0 and qna.userEmail==loginuser}">
										<i class="fas fa-comment qnaCommCommBtn"> 
											<input id="qnaCommNum" type="hidden" value="${qnaComm.qnaCommNum}" />
											<input id="qnaCommPos" type="hidden" value="${qnaComm.qnaCommPos}" />
										</i>
									</c:when>
									<c:when test="${qnaComm.qnaCommDept == 0 and role=='[ROLE_ADMIN]'}">
										<i class="fas fa-comment qnaCommCommBtn"> 
											<input id="qnaCommNum" type="hidden" value="${qnaComm.qnaCommNum}" />
											<input id="qnaCommPos" type="hidden" value="${qnaComm.qnaCommPos}" />
										</i>
									</c:when>
								</c:choose>
							</small>
							<div class="qnaCommContent">
								<c:if test="${qnaComm.qnaCommDept==1}">
									&ensp;&ensp;
								</c:if>
								${qnaComm.qnaCommContent}
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 로그인한 회원,어드민들 댓글창 -->
				<se:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
					<div class="qnaComm-inputBox input-group">
						<input type="text" id="userComment" class="form-control input-sm chat-input" placeholder="댓글을 입력하세요" />
						<span class="input-group-btn commentBtn">
							<a href="#" class="btn main-btn center-block" id="commentBtn">
								<i class="fas fa-check"></i> Add Comment
							</a>
						</span>
					</div>
				</se:authorize>
				<!-- 비회원일때 댓글창 -->
				<se:authorize access="!hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
					<div class="qnaComm-inputBox input-group">
						<input type="text" id="userComment" disabled class="form-control input-sm chat-input" placeholder="로그인 후 이용해주세요" />
					</div>
				</se:authorize>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</section>
<script>
	$(function() {
		var commCommClickNum = 0;
		var qnaCommNum;
		var qnaCommPos;
		var commBoxHtml="<div class='qnaComm-inputBox input-group qnaCommCommBox'>"
			+" <div class='qnaCommCommExit' align='right'><i class='fas fa-times'></i></div>" 
			+" <div class='display-Table'><input type='text' id='userCommComm' class='form-control input-sm chat-input' placeholder='답댓글을 입력하세요' />"
			+" <span class='input-group-btn' id='commCommbtn'>"
			+" <div>"
			+" <a href='#' class='btn main-btn center-block' id='commCommAtag'>"
			+" <i class='fas fa-check'></i> Add Comment"
			+" </a></div></span></div></div>";
		/* 댓글 작성 버튼 클릭시 */
		$('.commentBtn').click(function(){
			if($('#userComment').val()==""){
				swal("", "내용을 입력해주세요", "warning");
			}else{
				$.ajax({
					url : "<%=request.getContextPath()%>/qna/insertQnaComm.json",
				    type : "get",
				    data : {
				    	"qnaCommContent": $('#userComment').val(),
				    	"qnaNum":${qna.qnaNum}
				    },
				    success : function(data){
				    	location.reload();
				    },
				    error : function(){
				        	console.log("실패");
				    }
				});	
			}	
		});
		/* 대댓글아이콘 클릭시 */
		$('.qnaCommCommBtn').click(function() {
			if(commCommClickNum==0){
				qnaCommNum=$(this).children('#qnaCommNum').val();
				qnaCommPos=$(this).children('#qnaCommPos').val();
				commCommClickNum=1;
				$(this).parents('.comment').append(commBoxHtml);
			}else if(commCommClickNum==1){
				$('.qnaCommCommBox').remove();
				qnaCommNum=$(this).children('#qnaCommNum').val();
				qnaCommPos=$(this).children('#qnaCommPos').val();
				$(this).parents('.comment').append(commBoxHtml);
			}
			/* 대댓글 화면 닫기 */
			$('.qnaCommCommExit').click(function(){
				$('.qnaCommCommBox').remove();
				commCommClickNum=0;
			});
		});
		
		/* 대댓글 작성 버튼 클릭시 */
		$(document).on("click", "#commCommbtn", function(){
			console.log(${qna.qnaNum});
			$.ajax({
				url : "<%=request.getContextPath()%>/qna/insertQnaCommComm.json",
			    type : "get",
			    data : {
			    	"qnaCommContent": $('#userCommComm').val(),
			    	"qnaNum":${qna.qnaNum},
			    	"qnaCommNum":qnaCommNum,
			    	"qnaCommPos":qnaCommPos
			    },
			    success : function(data){
			    	commCommClickNum=0;
			    	qnaCommNum="";
			    	qnaCommPos="";
			    	location.reload();
			    },
			    error : function(){
			        	console.log("실패");
			    }
			});	
		});
		
		/* 댓글삭제아이콘 클릭시 */
		$('.qnaCommTrashBtn').click(function() {
			qnaCommNum=$(this).children('#qnaCommNum').val();
			qnaCommPos=$(this).children('#qnaCommPos').val();
			swal({
				  title: "댓글을 삭제하시겠습니까?",
				  text: "답댓글이 달려있는 경우 함께 삭제됩니다.",
				  type: "warning",
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "OK",
				  showCancelButton: true
				},
				function(isConfirm) {
				  if (isConfirm) {
					 $.ajax({
						    url : "<%=request.getContextPath()%>/qna/deleteQnaComm.json",
						    type : "get",
						    data : {
						    	"qnaCommNum":qnaCommNum
						    },
						    success : function(data){
						    	qnaCommNum="";
						    	location.reload();
						    },
						    error : function(){
						    	swal({
									  title: "댓글 삭제에 실패하였습니다",
									  text: "",
									  type: "warning",
									  confirmButtonClass: "btn-danger",
									  confirmButtonText: "OK",
									  showCancelButton: true
									});
						    }
					});
				  } 
				}); 
		});
		
		$('.historyBtn').click(function(){
			history.go(-1);
		});
		
		
	});
</script>