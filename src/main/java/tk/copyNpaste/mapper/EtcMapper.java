/*
* @ Class : EtcMapper
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : EtcMapper-DAO
*/
package tk.copyNpaste.mapper;

import java.util.HashMap;
import java.util.List;

import tk.copyNpaste.vo.EtcVO;
import tk.copyNpaste.vo.ReportVO;
import tk.copyNpaste.vo.noticeVO;
import tk.copyNpaste.vo.NoteVO;

public interface EtcMapper {
	
	//알림 읽음 체크
	public int notifyReadCheck(String userEmail, String notifyCode, int notifyTarget) throws Exception;
	
	//알림 리스트 가지고 오기
	public List<noticeVO> noticeList(String userEmail) throws Exception;
	
	//알림 개수 가지고 오기
	public int countNotify(String userEmail) throws Exception;
	
	//신고 하기
	public int insertReport(ReportVO report) throws Exception;
	
	//신고 목록 보기
	public List<ReportVO> selectAllReport() throws Exception;
	
	//노트 신고 목록 보기
	public List<ReportVO> selectNoteReport() throws Exception;
	
	//댓글 신고 목록 보기
	public List<ReportVO> selectCommReport() throws Exception;
	
	//신고된 댓글 노트 보러 가기
	public int selectHasReportComm(int reportNum) throws Exception;
	
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

	//가장 많이 쓰인 단어
	public List<String> wordchart() throws Exception;
	
	//사이트 내 검색
	/*public List<NoteVO> selectSearchSite(HashMap map) throws Exception;*/
	public List<NoteVO> selectSearchSite(HashMap map) throws Exception;
	
	// write 사이트 내 검색
	public List<NoteVO> selectSearchSiteWrite(HashMap map) throws Exception;
	
}
