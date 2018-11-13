<%--
@JSP : about.jsp
@Date : 2018.10.10
@Author : 우나연, 임지현
@Desc : 사이트 소개 페이지 입니다.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<div class="container">
		<div class="row">
			<div class="localeText"><a href="aboutChangeLanguage.htm?lang=">한국어</a>/<a href="aboutChangeLanguage.htm?lang=en">English</a>/<a href="aboutChangeLanguage.htm?lang=jp">日本語</a>/<a href="aboutChangeLanguage.htm?lang=ch">中国语</a></div>
		</div>
		<div class="row">
			<div class="col-sm-5">
				<iframe width="100%" height="270"  style="border: 0;"
					src="https://www.youtube.com/embed/tgbNymZ7vqY?autoplay=1">
				</iframe>
			</div>
			<div class="col-sm-7 aboutSubTitle">
				<div class="aboutConTilte"><strong><spring:message code="aboutConTilte" /><br/>
				&ensp;&ensp;&ensp;<spring:message code="aboutConTilte2" /><br/></strong>
				</div>
				<div class="aboutCon">
				<h3><spring:message code="aboutCon1" /></h3>
				<p><spring:message code="aboutCon1-1" /><br/>
				<spring:message code="aboutCon1-2" /></p>
				</div>
				<div class="aboutCon">
				<h3><spring:message code="aboutCon2" /></h3>
				<p><spring:message code="aboutCon2-1" />
				<br/><spring:message code="aboutCon2-2" /></p>
			</div>
			<div class="aboutCon">
				<h3><spring:message code="aboutCon3" /></h3>
				<p><spring:message code="aboutCon3-1" />
				<br/><spring:message code="aboutCon3-2" /></p>
			</div>
			<div class="aboutCon">
				<h3><spring:message code="aboutCon4" /></h3>
				<p><spring:message code="aboutCon4-1" />
				<br/><spring:message code="aboutCon4-2" /> 
				<br/><spring:message code="aboutCon4-3" /></p>
			</div>
			</div>
		</div>
		
		</div>