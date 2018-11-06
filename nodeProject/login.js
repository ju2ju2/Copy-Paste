/*@Project : copyNpaste
 *@File name : drag.js
 *@Date : 2018.10.26
 *@Author : 우나연
 *@Desc : 웹 확장프로그램>> 로그인 */
/*
	// 사용할 모듈 정리
	1. request (파라미터값과 헤더설정을 추가하여 웹서버에 요청을 )
	2. express (웹 서버 기능) 
	4. querystring (파라미터 처리)
	5. cors(Access-Control-Allow-Origin 헤더를 설정)>>맞춤법검사에 적용필요
	6. bcrypt (비밀번호 암호화 db 해싱)
 */
var http = require("http");
var request = require("request");
var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var cors = require('cors');
var loginResult = []; 



/*var con = mysql.createConnection({
	host: "192.168.0.141",
	port: 3306,
	user: "copyNpaste",
	password: "1004",
	database: "copynpaste"
});*/


function login(userEmail, userPwd) {
	console.log("login메소드 실행")
	let inputData = { "userEmail" : userEmail, "userPwd" : userPwd};
	let opts = {
		    host: '192.168.0.134',
		    port: 8090,
		    method: 'POST',
		    path: '/copyNpaste/member/login.json',
		    headers: {'Content-type': 'application/json'},
		    body: inputData
		};

	// 포트 8090 에서는 톰캣 서버가 대기하고 있다.
	// 스프링 컨트롤러에서 '/start' URI 에 매핑하는 메소드를 두었다.
	// 전달 방식은 json 형태로 하였다.
	let resData = '';
	let req = http.request(opts, function(res) {

	    res.on('end', function() {
	        console.log("resData"+resData);
	    });
	});

	opts.headers['Content-Type'] = 'application/x-www-form-urlencoded';
	req.data = opts ;
	opts.headers['Content-Length'] = req.data.length;
	req.on('error', function(err) {
	    console.log("에러 발생 : " + err.message);
	});
	console.log("resData"+resData);
	app.use(bodyParser.urlencoded({ extended: false}));
	var data = app.use(bodyParser.json(resData));
	loginResult = [];
	if (data[0] != null){
	
		loginResult = {"loginChk":"true","userEmail":data[0].userEmail, "userNick": data[0].userNick, "userPhoto": data[0].userPhoto};
	}else {
		loginResult = {"loginChk":"false"};
	}

	// 요청 전송
	req.write(JSON.stringify(req.data.body));

	req.end();
/*	axios({
		  method: 'post',
		  url: '/member/login',
		  data: {
			userEmail: userEmail,
			userPwd: userPwd
		  }
		});*/
/*	var sql = "select userEmail, userNick, userPhoto from users where userEmail = ? and userPwd = ?";
	con.query(
			sql, 
			[userEmail, userPwd], 
			function (err, rows, result) {
				if (err) {
					console.log("등록 중 오류 발생");
					console.log(err);
					return;
				}
				loginResult = [];
				if (rows[0] != null){
					console.log(rows[0].userEmail);
					console.log(rows[0].userNick);
					console.log(rows[0].userPhoto);
					loginResult = {"loginChk":"true","userEmail":rows[0].userEmail, "userNick": rows[0].userNick, "userPhoto": rows[0].userPhoto};
				}else {
					loginResult = {"loginChk":"false"};
				}
			}
	);*/
}


app.use(cors());

app.post('/login', function(req, res){
	console.log("로그인 요청");
	var param = req.query;
	var userEmail = param.userEmail;
	var userPwd = param.userPwd;
	login(userEmail, userPwd);

	console.log("로그인 실행됨");
/*	setTimeout(function() { */
/*	console.log(loginResult);*/
/*	res.send(loginResult);*/
/*	}, 1600)*/
});

app.listen(10030,function() {
	console.log("10030 로그인 서버 구동중");
});










