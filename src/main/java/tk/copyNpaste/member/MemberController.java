/*
* @Class : MemberController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 회원 관련 컨트롤러. (service 사용, 뷰 매핑)
* 		   내 정보 보기 페이지 들어가기 메서드 추가. (10월 10일)
*/

package tk.copyNpaste.member;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;


import com.github.scribejava.core.model.OAuth2AccessToken;

import tk.copyNpaste.folder.FolderService;
import tk.copyNpaste.vo.MemberVO;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	 @Autowired
	 MemberService memberService;
	 @Autowired
	 LoginService loginService;
	 @Autowired
	 FolderService folderService;
	 @Autowired
	 MemberMailService mailer;
	 @Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//회원가입 인증메일
	 @RequestMapping(value="singupEmail.do", method = RequestMethod.POST)
	 public @ResponseBody String sendSingupEmail(String mailto) throws Exception {
		//벨로시티 회원가입 인증메일전송
		String randomNum = mailer.sendMail(mailto, "singupEmail.do");// 회원가입 메일발송
		/*System.out.println("randomNum>>"+randomNum);*/
		return randomNum;
	}
	 
	//임시비밀번호 메일 발송 및 비밀번호 변경
	 @RequestMapping(value="findUserPwd.do", method = RequestMethod.POST)
	public @ResponseBody String sendUserPwd(String mailto) throws Exception{
		//임시비밀번호 벨로시티발송.
		 String randomNum = mailer.sendMail(mailto, "findUserPwd.do");// 회원가입 메일발송
		 return randomNum; 
	};
	
	//이메일 중복체크
	@RequestMapping(value="checkUserEmail.do", method = RequestMethod.POST)
	public @ResponseBody int checkUserEmail(String mailto) throws Exception {
		int result=memberService.checkUserEmail(mailto);
		return result;
	};
	
	//닉네임 중복체크
	@RequestMapping(value="checkUserNick.do", method = RequestMethod.POST)
	public @ResponseBody int checkUserNick(String userNick) throws Exception{
		int result=memberService.checkUserNick(userNick);
		return result;
	};
	

	//회원가입 + 회원가입시 미분류,스크랩 폴더 부여
	@RequestMapping(value="signup.do", method = RequestMethod.POST)
    public @ResponseBody void insertMember(MemberVO member, MultipartHttpServletRequest request) 
          throws Exception{
       memberService.insertMember(member, request);
    };

	
	//로그인
	public void login(MemberVO member) throws Exception{
		
	};
	
	//구글로그인
	public void googleLogin(String userEmail) throws Exception{
		
	};
	
	//카카오 회원가입 1/2 (회원정보 얻기)
	@RequestMapping(value = "kakaoOauth.do", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView kakaoSingUp(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		
		MemberVO member = loginService.kakaoSingUp(code, request, response);
		ModelAndView soscialMav = new ModelAndView();
		soscialMav.setViewName("index.signupSocial");
		soscialMav.addObject("memberVo", member);
		return soscialMav;
	};
		
	//카카오 회원가입 2/2 (DB 저장)
	@RequestMapping(value = "socialSingUp.do")
	public String socialSingUp(MemberVO member) throws Exception{
		 loginService.socialSingUp(member);
		 return "index.login";
	};
	
	//네이버 회원가입 1/2 (회원정보 얻기) //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "naverOauth.do", method= RequestMethod.GET)
    public String naverSignup(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
        OAuth2AccessToken oauthToken= NaverLogin.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        String profile = NaverLogin.getUserProfile(oauthToken);
    	MemberVO member = NaverLogin.changeData(profile);
        model.addAttribute("memberVo", member);
        /* 네이버 로그인 성공 페이지 View 호출 */
        return "index.signupSocial";
    }
	
	//네이버 회원가입 2/2 (DB 저장)
	@RequestMapping(value = "naverOauth.do", method= RequestMethod.POST)
	public String naverSignup2(MemberVO member) throws Exception{
		 return "index.login";
	};
	
		
	//전회원 정보 보기
	public @ResponseBody List<MemberVO> selectAllMember() throws Exception{
		List<MemberVO> memberList = memberService.selectAllMember();
		return memberList;
	};
	
	//회원 검색
	public @ResponseBody List<MemberVO> selectSearchMember (String userEmail) throws Exception{
		List<MemberVO> memberList = memberService.selectSearchMember(userEmail);
		return memberList;
	};
	
	//내 정보 보기 페이지 들어가기 * 작업자 : 이주원
	@RequestMapping("myinfo.htm")
	public String updateMember(String userEmail) throws Exception{
		return "index.myinfo";
	};
	
	//내 정보 보기
	@RequestMapping(value="myinfo.do", method = RequestMethod.POST)
	public @ResponseBody MemberVO selectSearchMemberByEmail (Principal principal) throws Exception{
		String userEmail = principal.getName();
		MemberVO member = memberService.selectSearchMemberByEmail(userEmail);
		return member;
	};
	
	//내 정보 수정 시 비밀번호 비교
	@RequestMapping(value="matchPwd.do", method = RequestMethod.POST)
	public @ResponseBody boolean matchPwd(Principal principal, String rawpassword) throws Exception{
		String userEmail = principal.getName();
		String rawPassword = rawpassword;
		String encodePassword = memberService.matchPwd(userEmail);
		
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodePassword);
		return result;
	};
	
	//내 정보 수정
	@RequestMapping(value="updateMember.do", method = RequestMethod.POST)
	public @ResponseBody void updateMember(MemberVO member, MultipartHttpServletRequest request) 
			throws Exception{
		memberService.updateMember(member, request);
	};
	
	//회원 삭제
	@RequestMapping(value="deleteMember.do", method = RequestMethod.POST)
	public @ResponseBody void deleteMember(String userEmail) throws Exception{
		memberService.deleteMember(userEmail);
	};
	
	//노드 된건가
	@RequestMapping(value="login.json", method = RequestMethod.POST)
	public @ResponseBody MemberVO loginnode(String userEmail,String userPwd) throws Exception{
		System.out.println("node 요청들어옴");
		MemberVO member = new MemberVO();
		System.out.println("userPwd/"+userPwd);
		userPwd= bCryptPasswordEncoder.encode(userPwd);

		member =loginService.login(userEmail,userPwd);
		JSONObject memberjson = new JSONObject();
        memberjson.put("userEmail",member.getUserEmail());
        memberjson.put("userPhoto",member.getUserPhoto());
        memberjson.put("userNick",member.getUserNick());

        URLConn conn = new URLConn("http://127.0.0.1",10030);
        conn.urlPost(memberjson);
		return member;
	};
	
}
