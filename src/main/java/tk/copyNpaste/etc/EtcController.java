/*
* @Class : EtcController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 기타 관련 컨트롤러. + 관리자 (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.etc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/etc/")
@Controller //동기 컨트롤러. retrun>> ModelAndView or String.
public class EtcController {
	EtcService etcService = new EtcService(); 
	
	@RequestMapping("admin.htm")
	//관리자 페이지 (회원관리)
	public String adminPage() throws Exception {
		return "admin.manageMember";
	};
	
	//신고 하기
	public void insertReport(int noteNum) throws Exception {
		etcService.insertReport(noteNum);
	};
	
	//신고 목록 보기
	public  void selectAllReport() throws Exception {
		etcService.selectAllReport();
	};
	
	//신고 처리 하기
	public void updateReport(int reportNum) throws Exception {
		etcService.updateReport(reportNum);
	};
	

	
	//댓글알림
	public void commAlarm() throws Exception {
		etcService.commAlarm();
	};
	
	//노트신고알림
	public void noteReportAlarm() throws Exception {
		etcService.noteReportAlarm();
	};
	
	//댓글신고알림
	public void commReportAlarm() throws Exception {
		etcService.commReportAlarm();
	} ;
	
	//상위랭크알림
	public void topRankAlarm() throws Exception {
		etcService.topRankAlarm();
	};
	

	
	//통계 회원 가입
	public void stateMember() throws Exception {
		etcService.stateMember();
	};
	
	//통계 상위노트 참조수
	public void stateTopRank() throws Exception {
		etcService.stateTopRank();
	};
	
	
}
