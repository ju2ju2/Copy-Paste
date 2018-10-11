<%-- main>>
@JSP : about.jsp
@Date : 2018.10.10
@Author : 임지현, 우나연
@Desc : 사이트 소개 페이지 입니다.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<iframe width="100%" height="270"  style="border: 0;"
					src="https://www.youtube.com/embed/tgbNymZ7vqY?autoplay=1">
				</iframe>
			</div>
			<div class="col-sm-8">
				<img src="${pageContext.request.contextPath}/resources/image/logo.png"
				class="logo" alt="logo" style="display: inline-block;"><strong>COPY&PASTE</strong><br/>
				<div id="subtitle">사이트들을 구경하다가 마음에 드는 문장을 찾았다면?!<br/>
				이력서, 사직서, 경조사 글을 써야하는데 막막하다면?!
				</div>
				<h4>당신의 글작성을 도와주는 획기적인 사이트</h4>
				<span>COPY&PASTE에서 원하는 글양식을 검색하여 다른 사람들의 글들을 참고하고,<br/>
				마음에 드는 글들을 가져와 내가 원하는 양식으로 만들어 사용해보세요.</span>

			</div>
		</div>
		</div>