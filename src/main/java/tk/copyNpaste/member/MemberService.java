/*
* @Class : MemberService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : MemberMapper 사용, 서비스처리.
*/
package tk.copyNpaste.member;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tk.copyNpaste.mapper.EtcMapper;
import tk.copyNpaste.mapper.FolderMapper;
import tk.copyNpaste.mapper.MemberMapper;
import tk.copyNpaste.vo.MemberVO;


@Service
public class MemberService {
	 @Autowired
	 private SqlSession sqlsession;
	 
	 @Autowired
	 private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//이메일 중복체크
	public int checkUserEmail(String userEmail) throws Exception {
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		int result = memberdao.checkUserEmail(userEmail);
		return result;
	};
	
	//닉네임 중복체크
	public int checkUserNick(String userNick) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		int result = memberdao.checkUserNick(userNick);
		return result;
	};

	//회원가입
	@Transactional
	public void insertMember(MemberVO member, MultipartHttpServletRequest request) 
			throws IOException, ClassNotFoundException, SQLException {
	
		String userPhoto = "userProfile.png"; //프로필 사진 미업로드 시 기본 파일명
    	String userPhotoName = ""; //DB에 들어갈 파일명(이메일 + 파일명)
    	String userEmail = member.getUserEmail();
    	    	
    	MultipartFile userPhotoFile = request.getFile("userPhotoFile");
       	
    	String originFileName = userPhotoFile.getOriginalFilename(); // 원본 파일 명
    	
    	long fileSize = userPhotoFile.getSize(); // 파일 사이즈
    	String path= request.getServletContext().getRealPath("resources/image/userPhoto/");
    	
    	String safeFile = path + userEmail + originFileName;
    	userPhotoFile.transferTo(new File(safeFile));  //폴더에 파일 쓰기
    	
    	if( fileSize > 0) {
    		userPhotoName = userEmail +originFileName; 
    	} else {
    		userPhotoName = userPhoto;
    	}
       
    	member.setUserPwd(bCryptPasswordEncoder.encode(member.getUserPwd()));
    	member.setUserPhoto(userPhotoName); // DB에 들어갈 파일명 지정
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		
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
	
	//회원 가입 시 권한 부여
/*	public int insertMemberRole(String userEmail) throws Exception {
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.insertMemberRole(userEmail);
	}*/
	
	//임시 비밀번호 부여
	public void updatePwd(MemberVO member) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		memberdao.updateMember(member);
	}
	
	//전회원 정보 보기
	public List<MemberVO> selectAllMember() throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.selectAllMember();
	}
	
	//회원 검색
	public List<MemberVO> selectSearchMember (String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.selectSearchMember(userEmail);
	}
	
	//내 정보 보기
	public MemberVO selectSearchMemberByEmail (String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		MemberVO member = memberdao.selectSearchMemberByEmail(userEmail);
		return member;
	}
	
	//내 정보 수정 시 비밀번호 비교
	public String matchPwd(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		String encodepassword = memberdao.matchPwd(userEmail);
		return encodepassword;
	}
	
	//내 정보 수정
	public void updateMember(MemberVO member, MultipartHttpServletRequest request) 
			throws Exception{
    	
		String userPhotoName = ""; //DB에 들어갈 파일명(이메일 + 파일명)
    	String userEmail = member.getUserEmail();
    	String userPwd = member.getUserPwd();
    	MultipartFile userPhotoFile = request.getFile("userPhotoFile");   
    	long fileSize = userPhotoFile.getSize(); // 파일 사이즈
    	
    	if (fileSize > 0) {  
        		String originFileName = userPhotoFile.getOriginalFilename(); // 원본 파일명
        		String path= request.getServletContext().getRealPath("resources/image/userPhoto/");
        		String safeFile = path + userEmail + originFileName;
        		userPhotoFile.transferTo(new File(safeFile));  //폴더에 파일 쓰기
        	
        		userPhotoName = userEmail +originFileName; 
        		member.setUserPhoto(userPhotoName); // DB에 들어갈 파일명 지정
    	}
    	
    	long pwdSize = userPwd.length(); // 비밀번호 사이즈
    	if (pwdSize == 0) {
    			userPwd=null;
    			member.setUserPwd(userPwd);
    	} else {
    		member.setUserPwd(bCryptPasswordEncoder.encode(member.getUserPwd()));
    	}	
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);			
		memberdao.updateMember(member); //회원정보 수정	
	}

	
	//회원 비활성하기>>update
	public void deleteMember(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		memberdao.deleteMember(userEmail);
	}
	
}
