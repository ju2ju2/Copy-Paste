/*
@JSP : main.js
@Date : 2018.10.11
@Author : 우나연
@Desc : 메인 텍스트 슬라이드, 스크립트 관련 파일
 */

/*// 파일 다운로드 후 창닫기.
 $("#formID").submit(function() {
 $("#dialog_div_ID").dialog("close");
 });*/
//활성화 된 링크 active 클래스주기
// 메인 텍스트 슬라이드
var TxtType = function(el, toRotate, period) {
	this.toRotate = toRotate;
	this.el = el;
	this.loopNum = 0;
	this.period = parseInt(period, 10) || 2000;
	this.txt = '';
	this.tick();
	this.isDeleting = false;
};

TxtType.prototype.tick = function() {
	var i = this.loopNum % this.toRotate.length;
	var fullTxt = this.toRotate[i];

	if (this.isDeleting) {
		this.txt = fullTxt.substring(0, this.txt.length - 1);
	} else {
		this.txt = fullTxt.substring(0, this.txt.length + 1);
	}

	this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

	var that = this;
	var delta = 200 - Math.random() * 100;

	if (this.isDeleting) {
		delta /= 2;
	}

	if (!this.isDeleting && this.txt === fullTxt) {
		delta = this.period;
		this.isDeleting = true;
	} else if (this.isDeleting && this.txt === '') {
		this.isDeleting = false;
		this.loopNum++;
		delta = 500;
	}

	setTimeout(function() {
		that.tick();
	}, delta);
};

window.onload = function() {
	var elements = document.getElementsByClassName('typewrite');
	for (var i = 0; i < elements.length; i++) {
		var toRotate = elements[i].getAttribute('data-type');
		var period = elements[i].getAttribute('data-period');
		if (toRotate) {
			new TxtType(elements[i], JSON.parse(toRotate), period);
		}
	}
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);

	/* 날씨 api */

	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=";

	$.ajax({
				url : apiURI,
				dataType : "json",
				type : "GET",
				async : "false",
				success : function(resp) {
					var temp = resp.main.temp - 273.15; /* 온도 */
					var img = resp.weather[0].icon; /* 날씨 아이콘 */
					var wtext; /* 날씨 내용 */
					var wImg; /* 날씨 아이콘 변경 */

					if (img == '01d' || img == '01n') {
						wImg = 'wi-day-sunny';
						wtext = '맑음';
					} else if (img == '02d' || img == '02n') {
						wImg = 'wi-day-cloudy';
						wtext = '구름 조금';
					} else if (img == '03d' || img == '03n') {
						wImg = 'wi-cloud';
						wtext = '구름 많음';
					} else if (img == '04d' || img == '04n') {
						wImg = 'wi-cloudy-windy';
						wtext = '흐림';
					} else if (img == '09d' || img == '09n') {
						wImg = 'wi-rain-wind';
						wtext = '구름많고 비';
					} else if (img == '10d' || img == '10n') {
						wImg = 'wi-day-hail';
						wtext = '비';
					} else if (img == '11d' || img == '11n') {
						wImg = 'wi-thunderstorm';
						wtext = '천둥';
					} else if (img == '13d' || img == '13n') {
						wImg = 'wi-snow-wind';
						wtext = '눈';
					} else if (img == '50d' || img == '50n') {
						wImg = 'wi-dust';
						wtext = '안개';
					}

					var imgURL = "http://openweathermap.org/img/w/"
							+ resp.weather[0].icon + ".png";
					$(".circle")
							.append(
									"<i class='wi "
											+ wImg
											+ "' style='color:#fff; font-size:55px; margin-top:25px;'></i>");
					$(".weatherApi")
							.append(
									"<div style='margin-top:5px;color:#fff; font-weight:bold; font-size:30px; display: inline-block;'>"
											+ Math.round(temp)
											+ "<i class='wi wi-celsius'></i></div>&nbsp;"
											+ "<div style='color:#fff; display: inline-block;'>"
											+ wtext + "</div>");
					$(".weatherApi").append(
							"<div style='color:#fff;font-size:20px;'>서울</div>");

				}
			});
	
	/*file업로드시 영역에 이미지 읽어오기*/
	 var file = document.querySelector('.userPhoto');

	    file.onchange = function () { 
	        var fileList = file.files ;
	        
	        // 읽기
	        var reader = new FileReader();
	        reader.readAsDataURL(fileList [0]);

	        //로드 한 후
	        reader.onload = function  () {
	            //로컬 이미지를 보여주기
	            /*var imglink="<img class='img-responsive user-photo img-rounded' src='' >";
	            $('.imgfile').html(imglink);*/
	            document.querySelector('.img-responsive').src = reader.result;
	        }; 
	    };    


};
