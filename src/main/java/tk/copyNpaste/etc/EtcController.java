/*
* @Class : EtcController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 기타 관련 컨트롤러. + 관리자 (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.etc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.copyNpaste.vo.EtcVO;

@RequestMapping("/etc/")
@Controller //동기 컨트롤러. retrun>> ModelAndView or String.
public class EtcController {
	@Autowired 
	EtcService etcService; 
	 
	@RequestMapping("admin.htm")
	//관리자 페이지 (회원관리)
	public String adminMemberPage() throws Exception {
		return "admin.manageMember";
	};
	
	
	@RequestMapping("adminNote.htm")
	//관리자 페이지 (노트관리)
	public String adminNotePage() throws Exception {
		return "admin.manageNote";
	};
	
	@RequestMapping("adminReport.htm")
	//관리자 페이지 (신고관리)
	public String adminReportPage() throws Exception {
		return "admin.manageReport";
	};
	@RequestMapping("adminStatistic.htm")
	//관리자 페이지 (통계)
	public String adminStatisticPage() throws Exception {
		return "admin.manageStatistic";
	};
	
	//노트 신고 목록 보기
	@RequestMapping("noteReport.json")
	public @ResponseBody String selectNoteReport() throws Exception {		
		return "";
	};
	
	//댓글 신고 목록 보기
	@RequestMapping("commReport.json")
	public  @ResponseBody String selectCommReport() throws Exception {
		return "";
	};

	//신고 하기
	public void insertReport(int noteNum) throws Exception {
		etcService.insertReport(noteNum);
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
	
	//통계 노트 주제
	@RequestMapping("/stateNoteSubject.json")
	public @ResponseBody List<EtcVO> stateNoteSubject() throws Exception {
		return etcService.stateNoteSubject();
	};

	/*qna 게시판에 관련된 내용. 
	 * [작성자 : 이주원] [작성날짜 : 2018-10-10]*/
	
	@RequestMapping("/selectQnaboard.htm")
	public String selectAllQnaboard() {
		return "qna.selectQnaboard";
	}

	@RequestMapping("/insertQnaboard.htm")
	public String insertQnaboard() {
		return "qna.insertQnaboard";
	}
	
	@RequestMapping("/selectDetailQna.htm")
	public String selectDetailQnaboard() {
		return "qna.selectDetailQna";
	}
	
	/*검색 게시판에 관련된 내용. 
	 * [작성자 : 임효진] [작성날짜 : 2018-10-10]*/
	
	@RequestMapping("/selectSearchSite.htm")
	public String selectSearchSite() {
		return "search.selectSearchSite";
	}

	@RequestMapping("/selectSearchNaver.htm")
	public String selectSearchNaver() {
		return "search.selectSearchNaver";
	}
	
	@RequestMapping("/selectSearchGoogle.htm")
	public String selectSearchGoogle() {
		return "search.selectSearchGoogle";
	}
	
}
