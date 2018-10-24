/*
* @Class : EtcService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : EtcMapper 사용, 업무수행.
*/

package tk.copyNpaste.etc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.copyNpaste.mapper.EtcMapper;
import tk.copyNpaste.mapper.MemberMapper;
import tk.copyNpaste.vo.EtcVO;
import tk.copyNpaste.vo.MemberVO;
import tk.copyNpaste.vo.ReportVO;

@Service
public class EtcService {
	@Autowired
	private SqlSession sqlsession;

	// 회원 보기
	public List<MemberVO> showMember() throws Exception {
		MemberMapper memberdao = sqlsession.getMapper(MemberMapper.class);
		return memberdao.selectAllMember();
	}
	
	// 회원 탈퇴 시키기
	public int deleteMember(String userEmail) throws Exception {
		MemberMapper memberdao = sqlsession.getMapper(MemberMapper.class);
		return memberdao.deleteMember(userEmail);
	}
	
	// 신고 하기
	public int insertReport(int noteNum) throws Exception {
		EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
		return etcdao.insertReport(noteNum);
	}

	// 신고 목록 보기
	public List<ReportVO> selectAllReport() throws Exception {
		EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
		return etcdao.selectAllReport();
	}

	// 노트 신고 목록 보기
	public List<ReportVO> selectNoteReport() throws Exception {
		EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
		return etcdao.selectNoteReport();
	}

	// 댓글 신고 목록 보기
	public List<ReportVO> selectCommReport() throws Exception {
		EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
		return etcdao.selectCommReport();
	}
	
	// 신고된 댓글을 가진 노트 num 구하기
	public int selectHasReportComm(int reportNum) throws Exception {
		EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
		return etcdao.selectHasReportComm(reportNum);
	}

	// 신고 처리 하기
	@Transactional
	public int updateReport(int reportNum, String reportmemo, String checkCode,
			String noteOrCommCode, int noteNum) throws Exception {
		
		try {
			EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
			int reportInt = etcdao.updateReport(reportNum, reportmemo, checkCode);
			int noteOrCommInt = 0;
			if (checkCode.equals("PS01")) {
				if (noteOrCommCode.equals("노트")) {
					noteOrCommInt = etcdao.updateReportNoteBlind(noteNum);
				} else {
					noteOrCommInt = etcdao.updateReportNoteCommBlind(noteNum);
				}
			} else {
				if (noteOrCommCode.equals("노트")) {
					noteOrCommInt = etcdao.updateReportNoteDontBlind(noteNum);
				} else {
					noteOrCommInt = etcdao.updateReportNoteCommDontBlind(noteNum);
				}
			}
			
			return reportInt+noteOrCommInt;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	// 댓글알림
	public void commAlarm() throws Exception {
	}

	// 노트신고알림
	public void noteReportAlarm() throws Exception {
	}

	// 댓글신고알림
	public void commReportAlarm() throws Exception {
	}

	// 상위랭크알림
	public void topRankAlarm() throws Exception {
	}

	// 통계 회원 가입월
	public List<EtcVO> stateMember() throws Exception {
		EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
		return etcdao.stateMember();
	}

	// 통계 상위노트 참조수
	public List<EtcVO> stateNoteSubject() throws Exception {
		EtcMapper etcdao = sqlsession.getMapper(EtcMapper.class);
		return etcdao.stateNoteSubject();
	}

}
