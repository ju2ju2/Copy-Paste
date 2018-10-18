<%-- drag>>
@JSP : list.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 드래그목록

@Date : 2018.10.12
@Author : 고은아
@Desc : 휴지통, 별 추가
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath}/resources/js/drag.js"></script>

<div class="d-container">
<div class="d-inner">
	<!-- Section -->	
	<section>	
		
		<header class="major">				
		<h3>드래그 목록<i class="fas fa-trash icon-size" id="bin"></i></h3>
		</header>
			<!-- <div class="mini-posts">
				<article>
				<div class="icon-right"><i class="far fa-star icon-size"></i></div>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a>
				</article>
			     </div> 
             -->    
        
               <c:forEach items="${dragList}" var="dragList">
              
                <div class="blog card">
                <div class="icon-right"><i class="far fa-star icon-size"></i>
                </div>
                        <tr id="sortable">
                        <td class="seq drag">${dragList.dragNum}</td>
                        <td class="seq drag">${dragList.dragMark}</td>
                        <td class="seq drag">${dragList.userEmail}</td>
                        <td class="seq drag">${dragList.dragText}</td>
                       
                        <td class="seq drag">${dragList.dragDate}</td>
                        <a><td class="seq drag">${dragList.dragOrigin}</td></a>
                    </tr>
                  </div>
                </c:forEach>
               
		</section>
			
	

</div>
</div>

