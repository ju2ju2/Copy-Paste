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
					<h4 class="modal-title">처리 메모 </h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="hidden" id="reportNum" name="reportNum">
						<input type="hidden" id="noteOrCommCode" name="noteOrCommCode">
						<input type="hidden" id="noteNum" name="noteNum">
						<br/>
							<label class="control-label col-sm-2">메모 </label>
							<textarea rows="15" cols="60" name="reportmemo" id="reportmemo"></textarea>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">처리여부 </label>
						<select name="checkCode" class="form-control checkCode" id="checkCode">
							<option value="PS00">기각</option>
							<option value="PS01">블라인드</option>
							<option value="PS02">미확인</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button"class="btn btn-danger" id="submitBtn" value="추가">
				</div>
			</form>
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
					<th>대상번호</th>
					<th>확인</th>
					<th>신고사유</th>
					<th>상세내용</th>
					<th>신고일자</th>
					<th>처리여부</th>
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
						<td><a href="../note/noteDetail.htm?noteNum=${reportVo.noteNum}"
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
						<td><button class="btn btn-sm drop-btn reportBtn"
									data-toggle="modal" data-target="#memoModal">설정</button>
						</td>
						<td>
							<c:if test="${reportVo.reportmemo != null}"></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
		