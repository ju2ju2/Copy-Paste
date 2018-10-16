/*
* @Class : LoginService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : Login 위한것, 스프링 사용으로 직접 로그인 하지않고 아마도 성공시 처리할 서비스
*/
package tk.copyNpaste.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.mapper.FolderMapper;
import tk.copyNpaste.mapper.MemberMapper;
import tk.copyNpaste.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class LoginService {
	 @Autowired
	 private SqlSession sqlsession;
	 
	//로그인
	public MemberVO login(MemberVO member) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.login(member);
	}
	
	//구글로그인
	public MemberVO googleLogin(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.googleLogin(userEmail);
	}
	
	//카카오로그인
	public MemberVO kakaoLogin(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.kakaoLogin(userEmail);
	}
		
	//네이버로그인
	public MemberVO naverLogin(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.naverLogin(userEmail);
	}
	
	
	
}
