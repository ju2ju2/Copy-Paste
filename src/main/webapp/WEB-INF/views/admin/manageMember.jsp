<%-- admin>>
@JSP : manageMember.jsp
@Date : 2018.10.24
@Author : 고은아
@Desc : 회원관리
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/api/jquery/dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<!-- Sweet Alert cdn -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/api/alert/sweetalert.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/api/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/deleteMember.js"></script>

<section>
	<div class="container">
	<div>
		<h3>회원관리 </h3>
	</div>
	<table id="table_id" >
    <thead>
        <tr>
            <td>회원이메일</td>
            <td>회원닉네임</td>
            <td>강 제 탈 퇴</td>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="memberVo" items="${memberVo}">
		<c:if test="${memberVo.userNick != 'admin'}">
		    <tr>
		    	<td>${memberVo.userEmail}</td>
           	 	<td>${memberVo.userNick}</td>
         	   	<td>
         	   		<c:choose>
            			<c:when test="${memberVo.userEnabled  == 1}">
            				<button class="btn btn-danger btn-xs changeMemberBtn" onclick="deleteMember(this)">강제탈퇴</button>
            			</c:when>
            			<c:otherwise>탈퇴한 회원입니다.</c:otherwise>
            		</c:choose>
          	  </td>
		    </tr>	
		</c:if>
    </c:forEach>
    </tbody>
</table>
</div>
</section>
