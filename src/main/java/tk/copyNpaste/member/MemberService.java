/*
* @Class : MemberService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : MemberMapper 사용, 서비스처리.
*/
package tk.copyNpaste.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.copyNpaste.mapper.MemberMapper;
import tk.copyNpaste.vo.MemberVO;

@Service
public class MemberService {
	 @Autowired
	 private SqlSession sqlsession;
	
	//회원가입 인증메일
	public void sendSingupEmail(String userEmail) throws Exception {
		//벨로시티 회원가입 이메일전송
	};
	
	//이메일 중복체크
	public String checkUserEmail(String userEmail) throws Exception {
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.checkUserEmail(userEmail);
	};
	
	//닉네임 중복체크
	public String checkUserNick(String userNick) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.checkUserNick(userNick);
	};
	
	//회원가입 + 회원가입시 미분류,스크랩 폴더 부여
	public int insertMember(MemberVO member) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.insertMember(member);
	}
	

		
	//회원 정보 보기
	public List<MemberVO> selectAllMember() throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.selectAllMember();
	}
	
	//회원 검색
	public List<MemberVO> selectSearchMember (String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.selectSearchMember(userEmail);
	}
	
	//회원 정보 수정
	public int updateMember(MemberVO member) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.updateMember(member);
	}
	
	//임시비밀번호
	public int updateUserPwd(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		//임시비밀번호 벨로시티발송.
		return memberdao.updateUserPwd(userEmail);
	}
	
	//회원 비활성하기>>update
	public int deleteMember(String userEmail) throws Exception{
		MemberMapper memberdao= sqlsession.getMapper(MemberMapper.class);
		return memberdao.deleteMember(userEmail);
	}
	

	
}
