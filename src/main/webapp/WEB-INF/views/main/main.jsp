<%-- main>>
@JSP : main.jsp
@Date : 2018.10.09
@Author : 우나연, 임지현, 이주원
@Desc : 메인 인덱스 페이지 
		+ 날씨 API (임지현, 이주원 - 10월 12일)
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 날씨 API script -->
<script>
var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=786c99bd6467a4ab58300feffccd96d2";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        console.log(resp);
        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" ); 
        var temp = resp.main.temp- 273.15;	/* 온도 */
        console.log("temp  : "+Math.round(temp)); 
        var img = resp.weather[0].icon;	/* 날씨 아이콘 */
        var wtext;	/* 날씨 내용 */
        var wImg;	/* 날씨 아이콘 변경 */
        
        if(img=='01d' || img=='01n'){
        	wImg='wi-day-sunny';
        	wtext='맑음';}
        else if(img=='02d' || img=='02n'){
        	wImg='wi-day-cloudy';
        	wtext='구름 조금';}
        else if(img=='03d' || img=='03n'){
        	wImg='wi-cloud';
        	wtext='구름 많음';}
        else if(img=='04d' || img=='04n'){
        	wImg='wi-cloudy-windy';
        	wtext='흐림';}
        else if(img=='09d' || img=='09n'){
        	wImg='wi-rain-wind';
        	wtext='구름많고 비';}
        else if(img=='10d' || img=='10n'){
        	wImg='wi-day-hail';
        	wtext='비';}
        else if(img=='11d' || img=='11n'){
        	wImg='wi-thunderstorm';
        	wtext='천둥';}
        else if(img=='13d' || img=='13n'){
        	wImg='wi-snow-wind';
        	wtext='눈';}
        else if(img=='50d' || img=='50n'){
        	wImg='wi-dust';
        	wtext='안개';}

        var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
        $(".circle").append("<i class='wi "+wImg+"' style='color:#fff; font-size:55px; margin-top:25px;'></i>");
        $(".weatherApi").append("<div style='margin-top:5px;color:#fff; font-weight:bold; font-size:30px; display: inline-block;'>"
        	+Math.round(temp)+"<i class='wi wi-celsius'></i></div>&nbsp;"+"<div style='color:#fff; display: inline-block;'>"+wtext+"</div>");
        $(".weatherApi").append("<div style='color:#fff;font-size:20px;'>서울</div>");
        

    }
});


</script>

<!-- banner start -->
<!-- ================ -->
<div id="banner" class="banner">
	<div class="banner-image"></div>
	<div class="banner-caption">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 object-non-visible"
					data-animation-effect="fadeIn">
					<h1 class="text-center"
						onclick="document.getElementById('subscribe').style.display='block;'"
						data-toggle="modal" data-target="#myModal">
						COPY & <span>PASTE</span>
					</h1>
					<p class="lead text-center ">
						<a href=""
							onclick="document.getElementById('subscribe').style.display='block'"
							data-toggle="modal" data-target="#myModal" class="typewrite"
							data-period="2000"
							data-type='[ "드래그가 글이 되는 공간, COPY&PASTE. ", "로그인을 해주세요 :)   ", "Click Click !   " ]'>
							<span class="wrap"></span>
						</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- banner end -->
<div class="jumbotron">
	<div class="container text-center">
		<center>
		<div class="weatherApi">
			<div class="circle"></div>
			<!-- 날씨 API 영역 -->
			<div class="temper"></div>
		</div>
		</center>
	</div>
</div>

<div class="container bg-3">
	<div>
		<h3>주제1</h3>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<!-- a HTML (to Trigger Modal) -->
				<a data-toggle="modal"
					href="${pageContext.request.contextPath}/note/noteDetail.htm"
					data-target="#modal-testNew" role="button" data-backdrop="static">
					<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
				</a>
			</div>
			<!-- Modal HTML -->
			<div id="modal-testNew" class="modal fade text-center" tabindex="-1"
				role="dialog">
				<div class="modal-dialog" style="width: 1200px; height: 700px">
					<div class="modal-content">
						<!-- Content will be loaded here from "note/noteDetail.htm" file -->
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<!-- a HTML (to Trigger Modal) -->
				<a data-toggle="modal"
					href="${pageContext.request.contextPath}/note/noteDetail.htm"
					data-target="#modal-testNew" role="button" data-backdrop="static">
					<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
				</a>
			</div>
			<!-- Modal HTML -->
			<div id="modal-testNew" class="modal fade text-center" tabindex="-1"
				role="dialog">
				<div class="modal-dialog" style="width: 1200px; height: 700px">
					<div class="modal-content">
						<!-- Content will be loaded here from "note/noteDetail.htm" file -->
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<!-- a HTML (to Trigger Modal) -->
				<a data-toggle="modal"
					href="${pageContext.request.contextPath}/note/noteDetail.htm"
					data-target="#modal-testNew" role="button" data-backdrop="static">
					<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
				</a>
			</div>
			<!-- Modal HTML -->
			<div id="modal-testNew" class="modal fade text-center" tabindex="-1"
				role="dialog">
				<div class="modal-dialog" style="width: 1200px; height: 700px">
					<div class="modal-content">
						<!-- Content will be loaded here from "note/noteDetail.htm" file -->
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
			<div class="card text-center">
				<!-- a HTML (to Trigger Modal) -->
				<a data-toggle="modal"
					href="${pageContext.request.contextPath}/note/noteDetail.htm"
					data-target="#modal-testNew" role="button" data-backdrop="static">
					<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
				</a>
			</div>
			<!-- Modal HTML -->
			<div id="modal-testNew" class="modal fade text-center" tabindex="-1"
				role="dialog">
				<div class="modal-dialog" style="width: 1200px; height: 700px">
					<div class="modal-content">
						<!-- Content will be loaded here from "note/noteDetail.htm" file -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>









