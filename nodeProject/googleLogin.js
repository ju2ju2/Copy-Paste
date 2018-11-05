
var http = require("http");
var request = require("request");
var express = require('express');
var router = express.Router();
var path = require('path');
var fs = require('fs');
var mysql = require("mysql");
var qs = require("querystring");
var app = express();
var cors = require('cors');
var con = mysql.createConnection({
	host: "192.168.0.141",
	port: 3306,
	user: "copyNpaste",
	password: "1004",
	database: "copynpaste"
});

var passport = require('./lib/passport')(app);
var authRouter = require('./routes/authRouter')(passport);
app.use('/auth', authRouter);

app.use(cors());

app.listen(10040);



