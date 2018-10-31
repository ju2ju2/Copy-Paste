/*
@JSP : main.js
@Date : 2018.10.11
@Author : 우나연
@Desc : 메인 텍스트 슬라이드, 스크립트 관련 파일
 */

//활성화 된 링크 active 클래스주기
//모달 내용 초기화
$('body').on('hidden.bs.modal', '.modal', function() {
	$(this).removeData('bs.modal');
});
$('#modal-testNew').on('shown.bs.modal', function() {
	$(document).off('focusin.modal');
});

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

	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=786c99bd6467a4ab58300feffccd96d2";

	$
			.ajax({
				url : apiURI,
				dataType : "json",
				type : "GET",
				async : "false",
				success : function(resp) {
					/*
					 * console.log(resp); console.log("현재온도 : " +
					 * (resp.main.temp - 273.15)); console.log("현재습도 : " +
					 * resp.main.humidity); console.log("날씨 : " +
					 * resp.weather[0].main); console.log("상세날씨설명 : " +
					 * resp.weather[0].description); console.log("날씨 이미지 : " +
					 * resp.weather[0].icon); console.log("바람 : " +
					 * resp.wind.speed); console.log("나라 : " +
					 * resp.sys.country); console.log("도시이름 : " + resp.name);
					 * console.log("구름 : " + (resp.clouds.all) + "%");
					 */
					var temp = resp.main.temp - 273.15; /* 온도 */
					/* console.log("temp : " + Math.round(temp)); */
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

	/* file업로드시 영역에 이미지 읽어오기 */
	var file = document.querySelector('.userPhoto');
	if (file != null) {
		file.onchange = function() {
			var fileList = file.files;

			// 읽기
			var reader = new FileReader();
			reader.readAsDataURL(fileList[0]);

			// 로드 한 후
			reader.onload = function() {
				// 로컬 이미지를 보여주기
				/*
				 * var imglink="<img class='img-responsive user-photo
				 * img-rounded' src='' >"; $('.imgfile').html(imglink);
				 */
				document.querySelector('.img-responsive').src = reader.result;
			};
		};
	}
	;

};
//이전 드래그 텍스트
var prevText;


// 드래그 저장
$(document).mouseup(function(event){
	event.preventDefault(); 
	event.stopPropagation(); 
	
     var selection = window.getSelection();
	 var text = selection.toString();
	 
	 // 드래그 텍스트 공백인지 앞의 드래그와 중복되는지 체크
	 if (text !='' && text.length > 1 && $.trim(text).length != 0 && prevText != text) {
		 // 드래그 저장
		var dragfd = new FormData();
		var dragOriginLink = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname;
		dragfd.append("dragOriginLink",dragOriginLink);
		dragfd.append("dragOrigin","copyNpaste");
		dragfd.append("dragText", text);

		$.ajax({
			url : "drag/insertDrag.json",
			type:"POST",
			data :dragfd,
			dataType : "json",
			processData: false,
			contentType:false
		})
		.done(function (result) {
			swal({
				type : "success",
				title : '드래그가 저장되었습니다.',
				confirmButtonClass : "btn-danger",
				closeOnConfirm : false
			}, function() {
				location.reload();
				
			});
			
			prevText = text;
		})
		
		return false;
	 }	
 });





