/*
* @ Class : EtcMapper
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : EtcMapper-DAO
*/
package tk.copyNpaste.mapper;

import java.util.List;

import tk.copyNpaste.vo.EtcVO;
import tk.copyNpaste.vo.ReportVO;

public interface EtcMapper {
	
	
	//신고 하기
	public int insertReport(int noteNum) throws Exception;
	
	//신고 목록 보기
	public List<ReportVO> selectAllReport() throws Exception;
	
	//노트 신고 목록 보기
	public List<ReportVO> selectNoteReport() throws Exception;
	
	//댓글 신고 목록 보기
	public List<ReportVO> selectCommReport() throws Exception;
	
	//신고 처리 하기
	public int updateReport(int reportNum, String reportmemo, String checkCode) throws Exception;

	//노트 블라인드
	public int updateReportNoteBlind(int noteNum) throws Exception;
	
	//노트 블라인드 해제
	public int updateReportNoteDontBlind(int noteNum) throws Exception;
	
	//댓글 블라인드
	public int updateReportNoteCommBlind(int noteNum) throws Exception;
	
	//댓글 블라인드 해제
	public int updateReportNoteCommDontBlind(int noteNum) throws Exception;
	
	//댓글알림
	public void commAlarm() throws Exception;
	
	//노트신고알림
	public void noteReportAlarm() throws Exception;
	
	//댓글신고알림
	public void commReportAlarm() throws Exception;
	
	//상위랭크알림
	public void topRankAlarm() throws Exception;
	

	
	//통계 회원 가입
	public List<EtcVO> stateMember() throws Exception;
	
	//노트 주제 선택 수
	public List<EtcVO> stateNoteSubject() throws Exception;

	
}
