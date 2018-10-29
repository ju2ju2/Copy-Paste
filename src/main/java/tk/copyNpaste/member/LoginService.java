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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tk.copyNpaste.mapper.FolderMapper;
import tk.copyNpaste.mapper.MemberMapper;
import tk.copyNpaste.vo.MemberVO;

@Controller
/*@RequestMapping(value = "/member")*/
public class LoginService {
	 @Autowired
	 private SqlSession sqlsession;
	 
	//로그인
	 @RequestMapping(value = "/login", method = RequestMethod.POST)
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
/*	public void kakaoLogin(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		memberdao.kakaoLogin(userEmail);
	}*/
	
	//카카오 회원가입
	@Transactional
	public void kakaoLogin(String userEmail) throws Exception{
			MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
			FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
			try {
				memberdao.kakaoLogin(userEmail);
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
