<%-- admin>>
@JSP : qnaboardList.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 노트 일괄 삭제를 위한 페이지

@Date : 2018.10.29
@Author : 임효진
@Desc : 노트 검색 및 삭제
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath}/resources/js/admin/manageNote.js"></script>

<section>
	<div class="container">
	<div>
		<h3  class="major">노트관리 </h3>
	</div>
	<div id="adminBtnDiv">
		<a href="${pageContext.request.contextPath}/etc/adminNote.htm" class="btn btn-sm drop-btn">노트 전체 보기</a>
		<a href="#" id="deleteNoteEmailBtn" class="btn btn-sm drop-btn" data-toggle="modal"
			data-target="#modal-deleteNoteEmail">이메일별 노트삭제</a>
	</div>
	<br>		
	<table id="table_id" >
    <thead>
        <tr>
            <th>노트개수</th>
            <th>노트번호</th>
            <th>노트제목</th>
			<th>노트내용</th>
            <th>노트상태</th>
            <th>작성일자</th>
            <th>작성자 이메일</th>
            <th>작성자 상태</th>
            <th>노트삭제</th>
        </tr>
    </thead>
    <tbody>
		<c:forEach var="NoteVo" items="${NoteVo}">
			<tr>
				<td>${NoteVo.rnum}</td>
				<td id="noteNum">${NoteVo.noteNum}</td>
				<td id="noteTitle">
					 <c:choose>
           				<c:when test="${fn:length(NoteVo.noteTitle) gt 8}">
            				<c:out value="${fn:substring(NoteVo.noteTitle,0,7)}"/>...
          				</c:when>
           				<c:otherwise>
            				<c:out value="${NoteVo.noteTitle}"/>
          				</c:otherwise> 
        			</c:choose>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum=${NoteVo.noteNum}"
								class="btn btn-sm drop-btn reportViewBtn" data-toggle="modal"
								data-target="#modal-testNew" role="button"
								data-backdrop="static">노트보기</a>
				</td>
				<td>
					<c:choose>
						<c:when test="${NoteVo.notePublic == '1'}" >
							공개
						</c:when>
						<c:when test="${NoteVo.notePublic == '0'}" >
							비공개
						</c:when>
					</c:choose>
				</td>
				<td>${NoteVo.noteDate}</td>
				<td>${NoteVo.userEmail}</td>
				<td>
					<c:choose>
						<c:when test="${NoteVo.userEnabled == '1'}" >
							정상
						</c:when>
						<c:when test="${NoteVo.userEnabled == '0'}" >
							탈퇴
						</c:when>
					</c:choose>				
				</td>
				<td><button type="button" class="btn btn-sm drop-btn deleteNoteBtn">노트 삭제</button></td>		
			</tr>
		</c:forEach>
    </tbody>
</table>
</div>
</section>

<!-- 노트보기 모달 -->
<div id="modal-testNew" class="modal fade text-center overlay"
	 role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">Content will be loaded here from
			"note/noteDetail.htm" file</div>
	</div>
</div>

<!-- 아이디별 삭제 모달 -->
<div id="modal-deleteNoteEmail" class="modal fade text-center overlay " role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">
					<button type="button" class="close modal-deleteNoteEmail-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">이메일별 노트삭제</h4>
				</div>
				<div class="modal-body text-left">
					<div class="form-group">
						<br/>
							<label class="control-label col-sm-2">이메일 입력</label>
							<input type="email" name="userEmail" id="userEmail">
							<button type="button" class="btn btn-danger noteCountEmailBtn">작성 노트확인</button>
					</div>
				<div class="form-group noteCountEmail">
						<br/>
							<label class="control-label col-sm-2">작성 노트 개수</label>
							<span id="noteCountResult"></span>
							&nbsp;<button type="button" class="btn btn-danger deleteMemNoteBtn">노트 일괄삭제</button>
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger modal-deleteNoteEmail-close" data-dismiss="modal">close</button>
				</div>
			</form>
		</div>
	</div>
</div>
