/*
* @ Class : MemberMapper
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : MemberMapper-DAO
*/
package tk.copyNpaste.mapper;

import java.util.List;

import tk.copyNpaste.vo.MemberVO;

public interface MemberMapper {
	//이메일 중복체크
	public String checkUserEmail(String userEmail) throws Exception;
	
	//닉네임 중복체크
	public String checkUserNick(String userNick) throws Exception;
	
	//회원가입 + 회원가입시 미분류,스크랩 폴더 부여
	public int insertMember(MemberVO member) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO member) throws Exception;
	
	//구글로그인
	public MemberVO googleLogin(String userEmail) throws Exception;
	
	//카카오로그인
	public MemberVO kakaoLogin(String userEmail) throws Exception;
		
	//네이버로그인
	public MemberVO naverLogin(String userEmail) throws Exception;
		
	//회원 정보 보기
	public List<MemberVO> selectAllMember() throws Exception;
	
	//회원 검색
	public List<MemberVO> selectSearchMember (String userEmail) throws Exception;
		
	//회원 정보 수정
	public int updateMember(MemberVO member) throws Exception;
	
	//임시비밀번호
	public int updateUserPwd(String userEmail) throws Exception;
	
	//회원 비활성하기>>update
	public int deleteMember(String userEmail) throws Exception;
	
	

	

}
