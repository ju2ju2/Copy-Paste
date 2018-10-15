/*
* @Class : LoginService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : Login 위한것, 스프링 사용으로 직접 로그인 하지않고 아마도 성공시 처리할 서비스
*/
package tk.copyNpaste.member;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.mapper.MemberMapper;
import tk.copyNpaste.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class LoginService {
	MemberMapper memberdao;
	
	//로그인
	public MemberVO login(MemberVO member) throws Exception{
		
		return memberdao.login(member);
	}
	
	//구글로그인
	public MemberVO googleLogin(String userEmail) throws Exception{
		
		return memberdao.googleLogin(userEmail);
	}
	
	//카카오로그인
	public MemberVO kakaoLogin(String userEmail) throws Exception{
		return memberdao.kakaoLogin(userEmail);
	}
		
	//네이버로그인
	public MemberVO naverLogin(String userEmail) throws Exception{
		return memberdao.naverLogin(userEmail);
	}
	
	
	
}
