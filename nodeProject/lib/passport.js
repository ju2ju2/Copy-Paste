var bcrypt = require('bcrypt');

module.exports = function (app) {

    var passport = require('passport'),
        LocalStrategy = require('passport-local').Strategy,
        GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;

    app.use(passport.initialize());
    app.use(passport.session());

    passport.serializeUser(function (user, done) {  //아이디값 색출
        console.log('serializeUser', user);
        done(null, user.id);
    });

   /* passport.deserializeUser(function (id, done) { //아이디값 기반으로 유저를 가져와 request.user 정보를 셋팅
        var user = db.get('users').find({
            id: id
        }).value();
        console.log('deserializeUser', id, user);
        done(null, user);
    });*/

/*    passport.use(new LocalStrategy({
            usernameField: 'email',
            passwordField: 'pwd'
        },
        function (email, password, done) {
            console.log('LocalStrategy', email, password);
            var user = db.get('users').find({
                email: email
            }).value();
            if (user) {
                bcrypt.compare(password, user.password, function (err, result) {
                    if (result) {
                        return done(null, user, {
                            message: 'Welcome.'
                        });
                    } else {
                        return done(null, false, {
                            message: 'Password is not correct.'
                        });
                    }
                });
            } else {
                return done(null, false, {
                    message: 'There is no email.'
                });
            }
        }
    ));*/

    var googleCredentials = require('../config/google.json');
    passport.use(new GoogleStrategy({
            clientID: googleCredentials.web.client_id, //클라이언트 아이디
            clientSecret: googleCredentials.web.client_secret, //클라이언트 시크릿
            callbackURL: googleCredentials.web.redirect_uris[0], //콜백 주소
    		/*passReqToCallback: googleCredentials.web.passReqToCallback*/
        },
        function (request, accessToken, refreshToken, profile, done) {//내가 받아올 정보
        	 return done(null, profile);
        }
    ));
           
            /*var user = db.get('users').find({email:email}).value();
            if(user){  //디비에 이미 사용자가 있는 경우
                user.googleId = profile.id;
                db.get('users').find({id:user.id}).assign(user).write();
                redirect('http://localhost:8090/copyNpaste/login.htm');
            } else { //디비에 사용자 없는 경우
                user = {
                    id:shortid.generate(),
                    userEmail:email,
                    userNick:profile.displayName,
                    googleId:profile.id
                }
                db.get('users').push(user).write();
            }
            done(null, user);*/

    //Authenticate Requests 인증 요청
    app.get('/auth/google.do',
        passport.authenticate('google', {
            scope: ['https://www.googleapis.com/auth/plus.login', 'email'] } )
            /*, function(req, res) {
    					var email = profile.emails[0].value;
    					var displayName = profile.displayName;
    					var photos = profile.photos[0].value;
    					console.log(email);
    					console.log(displayName);  
    					console.log(photos);*/
    
        
        /*var email = profile.emails[0].value();*/
        /*var user = db.get('users').find({email:email}).value();
        users.googleId = profile.id; //구글 아이디값이 추가된 객체 생성
        db.get('users').find({id:user.id}).assign(user).write(); //디비에 아이디 넣음
        done(null, user); //유저값 줘서 로그인 끝냄
*/        	);

    app.get('/auth/google/callback', //여기로 접속하면 
        passport.authenticate('google', { //이 미들웨어 리턴
            failureRedirect: 'http://localhost:8090/copyNpaste/' //로그인에 실패한 경우 여기로 보냄
        }),
        function (req, res) {
            res.redirect('http://localhost:8090/copyNpaste/login.htm');  //로그인 성공하면 여기로 이동시켜라
        });
    return passport;
}