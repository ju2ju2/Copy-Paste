/*
* @Class : MemberController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 회원 관련 컨트롤러. (service 사용, 뷰 매핑)
* 		   내 정보 보기 페이지 들어가기 메서드 추가. (10월 10일)
*/

package tk.copyNpaste.member;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.vo.MemberVO;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	MemberService  memberService = new MemberService();
	LoginService loginService = new LoginService();
	
	//회원가입 인증메일
	public void sendSingupEmail(String userEmail) throws Exception {
		//벨로시티 회원가입 인증메일전송
	};
	
	//이메일 중복체크
	public void checkUserEmail(String userEmail) throws Exception {
		
	};
	
	//닉네임 중복체크
	public void checkUserNick(String userNick) throws Exception{
		
	};
	
	//회원가입 + 회원가입시 미분류,스크랩 폴더 부여
	public void insertMember(MemberVO member) throws Exception{
		
	};
	
	//로그인
	public void login(MemberVO member) throws Exception{
		
	};
	
	//구글로그인
	public void googleLogin(String userEmail) throws Exception{
		
	};
	
	//카카오로그인
	public void kakaoLogin(String userEmail) throws Exception{
		
	};
		
	//네이버로그인
	public void naverLogin(String userEmail) throws Exception{
		
	};
		
	//회원 정보 보기
	public void selectAllMember() throws Exception{
		
	};
	
	//회원 검색
	public void selectSearchMember (String userEmail) throws Exception{
		
	};
		
	//내 정보 보기 페이지 들어가기 * 작업자 : 이주원
	@RequestMapping("myinfo.htm")
	public String updateMember(String userEmail) throws Exception{
		return "member.myinfo";
	};
	
	//임시비밀번호
	public void updateUserPwd(String userEmail) throws Exception{
		//임시비밀번호 벨로시티발송.
	};
	
	//회원 삭제
	public void deleteMember(String userEmail) throws Exception{
		
	};
	
	
	
}
