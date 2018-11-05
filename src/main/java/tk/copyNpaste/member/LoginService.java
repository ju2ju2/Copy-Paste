/*
 * @Class : LoginService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : Login 위한것, 스프링 사용으로 직접 로그인 하지않고 아마도 성공시 처리할 서비스
*/
package tk.copyNpaste.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import tk.copyNpaste.mapper.FolderMapper;
import tk.copyNpaste.mapper.MemberMapper;
import tk.copyNpaste.vo.MemberVO;

@Controller
public class LoginService {
	 @Autowired
	 private SqlSession sqlsession;
	 @Autowired
	 private BCryptPasswordEncoder bCryptPasswordEncoder;
	 
	//구글로그인
	public MemberVO googleLogin(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.googleLogin(userEmail);
	}
	
	 //카카오 회원가입 1/2 (회원정보 얻기)
    public MemberVO kakaoSingUp(String code, HttpServletRequest request, HttpServletResponse response) throws Exception{
        JsonNode token = KakaoLogin.getAccessToken(code);
        KakaoLogin.connectKakao(token.path("access_token").toString());
        
        JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
        System.out.println("profile: " +profile);
        
        MemberVO member = KakaoLogin.changeData(profile);

        return member;
        }
    
    //소셜 회원가입 2/2 (DB 저장)
    @Transactional
    public void socialSingUp(MemberVO member) throws Exception{
        
        MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
        FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
        String userEmail = member.getUserEmail();
        
        member.setUserPwd(bCryptPasswordEncoder.encode(member.getUserPwd()));
        member.setUserSocialStatus(1); //일반회원:0, 카카오:1, 네이버:2, 구글:3
        
        try {
            memberdao.insertMember(member); //DB에 회원정보 입력
            memberdao.insertMemberRole(userEmail); // 권한 설정
            folderdao.insertFolderUserDefault(userEmail); //기본폴더 생성
            folderdao.insertFolderUserScrap(userEmail); //스크랩 폴더 생성
        } catch (Exception e) {
            System.out.println("에러" + e.getMessage());        
            throw e; // 예외 발생 시기면 : 자동 rollback
        }
    }
		
	//네이버로그인
	public MemberVO naverLogin(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.naverLogin(userEmail);
	}
	

	
}
