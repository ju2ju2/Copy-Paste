/*
* @ Class : EtcMapper
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : EtcMapper-DAO
*/
package tk.copyNpaste.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import tk.copyNpaste.vo.DragVO;
import tk.copyNpaste.vo.ReportVO;

public interface EtcMapper {
	
	
	//신고 하기
	public int insertReport(int noteNum) throws Exception;
	
	//신고 목록 보기
	public List<ReportVO> selectAllReport() throws Exception;
	
	//신고 처리 하기
	public int updateReport(int reportNum) throws Exception;
	

	
	//댓글알림
	public void commAlarm() throws Exception;
	
	//노트신고알림
	public void noteReportAlarm() throws Exception;
	
	//댓글신고알림
	public void commReportAlarm() throws Exception;
	
	//상위랭크알림
	public void topRankAlarm() throws Exception;
	

	
	//통계 회원 가입
	public void stateMember() throws Exception;
	
	//통계 상위노트 참조수
	public void stateTopRank() throws Exception;

	
}
