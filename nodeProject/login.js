/**
 * http://usejsdoc.org/
 */
var http = require("http");
var request = require("request");
var express = require('express');
var mysql = require("mysql");
var qs = require("querystring");
var app = express();
var cors = require('cors');

var loginResult = []; 


var con = mysql.createConnection({
	host: "192.168.0.141",
	port: 3306,
	user: "copyNpaste",
	password: "1004",
	database: "copynpaste"
});
/*
http.createServer(function(request, response) {
	console.log(request.url);
	switch (request.url) {
	case "/login":
		login(request, response);	
		break;
	default:
		response.end();
	}
})
.listen(10030, function() {
	console.log("10030 서버 구동중");
});*/

function login(userEmail, userPwd) {
	
	var sql = "select userEmail, userNick, userPhoto from users where userEmail = ? and userPwd = ?";
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
	);
}

app.use(cors());

app.post('/login', function(req, res){
	console.log("로그인");
	var param = req.query;
	var userEmail = param.userEmail;
	var userPwd = param.userPwd;
	login(userEmail, userPwd);
	setTimeout(function() { 
	console.log(loginResult);
	res.send(loginResult);
	}, 1600)
});

app.listen(10030);














