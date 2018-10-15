<%-- modal>>
@JSP : notedetail.jsp
@Date : 2018.10.11
@Author : 우나연
@Desc : 노트 상세보기
		댓글 신고 클릭시 모달창 추가, OK버튼 누를 때 스위트알럳 뜸. 버튼색은 추후 수정 필요.(이주원, 10월 12일)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sweet Alert cdn -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 신고 모달창에서 ok버튼 눌렀을 때 스윗알럳 띄우기 -->
<script>
$('#reportOK').click(function(){
	swal("신고되었습니다", "", "success")
		});	
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
        	role="button" class="btn btn-default" data-backdrop="static">Cancel</a>
        </center>
       	</div>
      </div>
      
    </div>
  </div>
	

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<br>
	<h2 class="modal-title">가을에 쓴 편지</h2>
	<div class="row">
		<div class="col-xs-6" />
		<div class="col-xs-6">
			<strong>발렌티</strong>&nbsp;&nbsp;18/08/27
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6" />
		<div class="col-xs-6"></div>
	</div>
</div>
<div class="modal-body">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="text-right col-sm-2" />
				<!-- 본문 -->
				<div class="text-left col-sm-8">
				이름<br><br>
				 
				나머지 주소, 시/도, 우편 번호<br>
				전화 번호<br>
				전자 메일<br>
				<br>
				날짜<br>
				받는 사람 이름 귀하, <br>
				본 모습 그대로의 편지지 모양도 멋지지만, 언제든지 개인의 취향을 반영할 수 있습니다.<br>
				리본의 디자인 탭에서 테마, 색 및 글꼴 갤러리를 사용하여 다양한 선택을 했을 때 어떤 모양이 될지 미리 볼 수 있습니다. <br>
				그런 다음 클릭하면 원하는 모양이 적용됩니다.<br>
				클릭 한 번으로 이 편지의 서식을 통일할 수 있는 스타일도 새로 만들었습니다. <br>
				리본의 홈 탭에서 이 편지에 사용된 모든 스타일에 대한 스타일 갤러리를 확인하세요.<br>
				삽입 탭에서 사용하기 더욱 쉬운 도구를 찾아 하이퍼링크를 추가하거나 메모를 삽입하는 등의 작업을 할 수도 있습니다.<br>
				감사합니다.<br><br>
				
				이름<br>
				
				
				
				
				
				</div>
				<div class="row">
					<br><br><br><br>
					<div class="col-sm-10"></div>
					<div class="col-sm-2">
					<strong>
					<i class="far fa-edit 3x notewirte"></i> &nbsp;
					<i class="fas fa-arrow-down"></i> &nbsp;
					<i class="fas fa-trash"></i> &nbsp;
					<i class="fas fa-archive"></i> </strong></div>
				</div>
				
			</div>

			<div class="modal-footer">
				<div class="panel-footer">
					<div class="row">
						<div class="col-lg-12 col-sm-12 text-left">
							<div class="comment-box">
								<ul data-brackets-id="12674" id="sortable"
									class="list-unstyled ui-sortable">
									<div class="media-left">
										<img class="img-responsive user-photo"
											src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
									</div>
									<div class="media-body">
										<strong class="pull-left primary-font">blueblue</strong><br>
										<small class="pull-right text-muted"> <span class="">삭제</span>&ensp;
											<span class="">댓글</span>&ensp; 
											<a href="#" data-toggle="modal" data-target="#reportModal" id="report">신고</a>&ensp;
										</small>
										<p>운영자 일 안하십니까? 답변 안하시냐구요. 지금 질문한지 7분 13초나 지났는데 아직도 답변
											안주시네요. 사이트 폭망하시길 기원합니다.</p>

									</div>
								</ul>

								<div class="media-left">
									<img class="img-responsive user-photo"
										src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
								</div>
								<div class="media-body">
									<strong class="pull-left primary-font">green</strong><br>
									<small class="pull-right text-muted"> <span class="">삭제</span>&ensp;
									<span class="">댓글</span>&ensp; 
									<a href="#" data-toggle="modal" data-target="#reportModal" id="report">신고</a>&ensp;
									</small>
									<p>위엣분 성격 더럽게 급하시네요.</p>
								</div>

								<div class="input-group">
									<input type="text" id="userComment"
										class="form-control input-sm chat-input"
										placeholder="댓글을 입력하세요" /> <span class="ml-5 input-group-btn"
										onclick="addComment()"> <a href="#"
										class="btn main-btn center-block" id="commentbtn">  댓글달기</a>


									</span>

								</div>


							</div>
						</div>
					</div>
				</div>

				<input type="button" class="btn btn-default" data-dismiss="modal"
					value="Close" id="empbutton" />
				<div class="col-xs-10" id="lblstatus"></div>
			</div>
		</div>
	</div>