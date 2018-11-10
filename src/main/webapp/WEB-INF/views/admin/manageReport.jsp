<%-- admin>>
@JSP : manageNote.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 관리자 노트관리

@Date : 2018.10.19
@Author : 고은아
@Desc : 관리자 신고 관리

--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin/report.js"></script>

<!-- 노트 모달창 -->
<div id="reportModal" class="modal fade text-center overlay"
	 role="dialog">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

<!-- 메모 모달창 -->

<div id="memoModal" class="modal fade form-horizontal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" align="center">처리 메모 </h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input id="mreportNum" name="reportNum">
						<input id="mnoteOrCommCode" name="noteOrCommCode">
						<input id="mnoteNum" name="noteNum">
						<input id="mnoteCommNum" name="noteCommNum">
						<br/>
							<label class="control-label col-sm-2">메모 </label>
							<textarea rows="5" cols="60" name="reportmemo" id="reportmemo" placeholder="신고 처리 결과에 대한 메모를 작성해주세요."></textarea>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">처리여부 </label>
						<select name="checkCode" class="form-control checkCode" id="checkCode">
							<option value="PS00">기각</option>
							<option value="PS01">블라인드</option>
							<option value="PS02">미확인</option>
						</select>
					</div>
					<div class="form-group">
					<label class="control-label col-sm-2">처리 전<br> 주의 사항</label>
					<p style="font-size:14px;margin-top:10px;">사안이 중대하여 사이트 내 처리 능력의 한계를 넘어설 경우 아래 수사 기관에 협조를 <br>요청하여 주십시오.</p>
					<ul style="margin-left:80px;font-size:14px;">				
					<li style="list-style: none;">
					<a href="http://www.kics.go.kr/" target="_blank" class="link_organsite"><strong>형사사법포털</strong></a><br>
					<p style="font-size:12px;">시스템 불법침입,전자상거래사기 등 컴퓨터 범죄신고</p>
					</li>
					<li style="list-style: none;">
					<a href="http://cyberbureau.police.go.kr/" target="_blank" class="link_organsite"><strong>사이버 안전국</strong></a><br>
					<p style="font-size:12px;">사이버상의 정보이용 방해, 정보오용, 인터넷을 이용한 범죄 등 모든 사이버 테러 방지 및 사이버 <br>치안 유지, 범죄신고 접수</p>
					</li>
					<li style="list-style: none;">
					<a href="http://www.police.go.kr/" target="_blank" class="link_organsite"><strong>사이버 경찰청</strong></a><br>
					<p style="font-size:12px;">명예훼손·협박·사기·매매춘·음화판매 등 사이버범죄 신고</p>
					</li>
					</ul>
					</div>
				</form>	
				</div>
				<div class="modal-footer">
					<center><input type="button" class="btn btn-danger" id="submitBtn" value="추가"></center>
				</div>
			
		</div>
	</div>
</div>
	
<section>
	<div class="container">
		<div>
			  <h3 class="major">신고 관리</h3>
		</div>
		<div id="adminBtnDiv">
			<a href="${pageContext.request.contextPath}/etc/adminReport.htm" class="btn btn-sm drop-btn">전체 신고 내역</a>
			<a href="${pageContext.request.contextPath}/etc/noteReport.htm" class="btn btn-sm drop-btn">노트 신고 내역</a>
			<a href="${pageContext.request.contextPath}/etc/commReport.htm" class="btn btn-sm drop-btn">댓글 신고 내역</a>
		</div>
		<br>
		<table id="table_id">
			<thead>
				<tr>
					<th>신고번호</th>
					<th>신고자 이메일</th>
					<th>대상</th>
					<th>노트번호</th>
					<th>댓글번호</th>
					<th>확인</th>
					<th>신고사유</th>
					<th>상세내용</th>
					<th>신고일</th>
					<th>처리</th>
					<th>처리</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reportVo" items="${reportVo}">
					<tr>
						<td>${reportVo.reportNum}</td>
						<td>${reportVo.userEmail}</td>
						<td>
							<c:choose>
								<c:when test="${reportVo.noteOrCommCode == 'NC00'}">
									노트
								</c:when>
								<c:otherwise>
									댓글
								</c:otherwise>
							</c:choose>
						</td>
						<td>${reportVo.noteNum}</td>
						<td>${reportVo.noteCommNum}</td>
					    <td><a href="../note/noteDetail.htm?noteNum=${reportVo.noteNum}&noteCommNum=${reportVo.noteCommNum}"
								class="btn btn-sm drop-btn reportViewBtn" data-toggle="modal"
								data-target="#reportModal" role="button"
								data-backdrop="static">확인</a></td>
						<td>
							<c:choose>
								<c:when test="${reportVo.reportCauseCode == 'NR01'}">
									광고/음란성
								</c:when>
								<c:when test="${reportVo.reportCauseCode == 'NR02'}">
									비속어 사용
								</c:when>
								<c:when test="${reportVo.reportCauseCode == 'NR03'}">
									비방글 작성
								</c:when>
								<c:when test="${reportVo.reportCauseCode == 'NR04'}">
									저작권 침해
								</c:when>
								<c:otherwise>
									기타 사유
								</c:otherwise>	
							</c:choose>					
						</td>
						<td>
							<c:if test="${reportVo.reportContent != null}">
								${reportVo.reportContent}
							</c:if>
						</td>
						<td>${reportVo.reportInDate}</td>
						<td>
							<c:choose>
								<c:when test="${reportVo.checkCode == 'PS00'}">
									기각
								</c:when>
								<c:when test="${reportVo.checkCode == 'PS01'}">
									블라인드
								</c:when>
								<c:otherwise>
									미확인
								</c:otherwise>
							</c:choose>
						</td>
						<td><a class="updateReportForm btn btn-sm btn-danger">처리</a>				
						</td>
						<td>
							<c:if test="${reportVo.reportmemo != null}">${reportVo.reportmemo}</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
		