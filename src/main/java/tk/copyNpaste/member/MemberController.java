/*
* @Class : MemberController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 회원 관련 컨트롤러. (service 사용, 뷰 매핑)
* 		   내 정보 보기 페이지 들어가기 메서드 추가. (10월 10일)
*/

package tk.copyNpaste.member;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
    @RequestMapping(value="signup.do", method = RequestMethod.POST)
    public void insertMember(MemberVO member, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{

    	String userPhoto = "userProfile.png"; //DB에 입력될 기본 파일명
    	String userEmail = member.getUserEmail();
    	System.out.println(userEmail);
    	
       MultipartFile userPhotoFile = request.getFile("userPhotoFile");
   
       String originFileName = userPhotoFile.getOriginalFilename(); // 원본 파일 명
       long fileSize = userPhotoFile.getSize(); // 파일 사이즈
       String path= request.getServletContext().getRealPath("resources/image/userPhoto/");
       
       String safeFile = path + System.currentTimeMillis() + originFileName;
       userPhotoFile.transferTo(new File(safeFile));  //폴더에 파일 쓰기
   
       if( fileSize > 0) {
    	   String userPhotoName = userEmail+originFileName;
    	   member.setUserPhoto(userPhotoName); // DB에 들어갈 파일명 지정
    	   System.out.println("filesize >0 : " + userPhotoName);
    	   try {
               memberService.insertMember(member);
           } catch (Exception e) {
                   e.printStackTrace()	;
           }
       } else {
    	   String userPhotoName = userEmail+userPhoto;
    	   member.setUserPhoto(userPhotoName); // DB에 들어갈 파일명 지정
    	   System.out.println("filesize <0 : " + userPhotoName);
    	   try {
               memberService.insertMember(member);
           } catch (Exception e) {
                   e.printStackTrace();
           }
       }
      
      folderService.insertFolderUserDefault(userEmail);
      folderService.insertFolderUserScrap(userEmail);
      
      PrintWriter writer = response.getWriter();
      writer.println("<script>alert('Delete Success'); location.href='/login.htm';</script>");
      
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
		return "index.myinfo";
	};
	
	//임시비밀번호
	public void updateUserPwd(String userEmail) throws Exception{
		//임시비밀번호 벨로시티발송.
	};
	
	//회원 삭제
	public void deleteMember(String userEmail) throws Exception{
		
	};
	
	
	
}
