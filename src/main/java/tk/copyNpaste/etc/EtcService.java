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

import tk.copyNpaste.mapper.DragMapper;
import tk.copyNpaste.mapper.EtcMapper;
import tk.copyNpaste.vo.ReportVO;

@Service
public class EtcService {
	 @Autowired
	 private SqlSession sqlsession;
	 
	//신고 하기
	public int insertReport(int noteNum) throws Exception {
		EtcMapper etcdao= sqlsession.getMapper(EtcMapper.class);
		return etcdao.insertReport(noteNum);
	}
	
	//신고 목록 보기
	public List<ReportVO> selectAllReport() throws Exception {
		EtcMapper etcdao= sqlsession.getMapper(EtcMapper.class);
		return etcdao.selectAllReport();
	}
	
	//신고 처리 하기
	public int updateReport(int reportNum) throws Exception {
		EtcMapper etcdao= sqlsession.getMapper(EtcMapper.class);
		return etcdao.updateReport(reportNum);
	}

	
	
	
	//댓글알림
	public void commAlarm() throws Exception {}

	//노트신고알림
	public void noteReportAlarm() throws Exception {}

	//댓글신고알림
	public void commReportAlarm() throws Exception {}

	//상위랭크알림
	public void topRankAlarm() throws Exception {}

	
	
	
	//통계 회원 가입월
	public void stateMember() throws Exception {
		EtcMapper etcdao= sqlsession.getMapper(EtcMapper.class);
		etcdao.stateMember();
	}
	
	//통계 상위노트 참조수
	public void stateTopRank() throws Exception {
		EtcMapper etcdao= sqlsession.getMapper(EtcMapper.class);
		etcdao.stateTopRank();
	}
	

	

}
