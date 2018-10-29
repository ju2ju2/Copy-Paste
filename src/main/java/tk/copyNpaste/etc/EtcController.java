/*
* @Class : EtcController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 기타 관련 컨트롤러. + 관리자 (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.etc;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tk.copyNpaste.vo.EtcVO;
import tk.copyNpaste.vo.MemberVO;
import tk.copyNpaste.vo.NoteVO;
import tk.copyNpaste.vo.ReportVO;

@RequestMapping("/etc/")
@Controller // 동기 컨트롤러. retrun>> ModelAndView or String.
public class EtcController {
	@Autowired
	EtcService etcService;

	@RequestMapping("admin.htm")
	// 관리자 페이지 (회원관리)
	public ModelAndView adminMemberPage() throws Exception {
		List<MemberVO> memberlist = etcService.showMember();
		ModelAndView adminmav = new ModelAndView();
		adminmav.setViewName("admin.manageMember");
		adminmav.addObject("memberVo", memberlist);
		return adminmav;
	};
	
	@RequestMapping("memberdelete.json")
	// 관리자 페이지 (회원 탈퇴)
	public @ResponseBody int deleteMember(String userEmail) throws Exception {
		return etcService.deleteMember(userEmail);
	};

	@RequestMapping("adminNote.htm")
	// 관리자 페이지 (노트관리)
	public String adminNotePage() throws Exception {
		return "admin.manageNote";
	};

	@RequestMapping("adminReport.htm")
	// 관리자 페이지 (신고관리)
	public ModelAndView adminReportPage() throws Exception {
		List<ReportVO> reportList = etcService.selectAllReport();
		ModelAndView adminmav = new ModelAndView();
		adminmav.setViewName("admin.manageReport");
		adminmav.addObject("reportVo", reportList);
		return adminmav;
	};
	
	// 노트 신고 목록 보기
	@RequestMapping("noteReport.htm")
	public ModelAndView selectNoteReport() throws Exception {
		List<ReportVO> reportList = etcService.selectNoteReport();
		ModelAndView adminmav = new ModelAndView();
		adminmav.setViewName("admin.manageReport");
		adminmav.addObject("reportVo", reportList);
		return adminmav;
	};

	// 댓글 신고 목록 보기
	@RequestMapping("commReport.htm")
	public ModelAndView selectCommReport() throws Exception {
		List<ReportVO> reportList = etcService.selectCommReport();
		ModelAndView adminmav = new ModelAndView();
		adminmav.setViewName("admin.manageReport");
		adminmav.addObject("reportVo", reportList);
		return adminmav;
	};


	@RequestMapping("adminStatistic.htm")
	// 관리자 페이지 (통계)
	public String adminStatisticPage() throws Exception {
		return "admin.manageStatistic";
	};
	
	// 댓글 신고된 노트로 이동
	@RequestMapping("hasReportComm.json")
	public @ResponseBody int selectHasReportComm(int reportNum) throws Exception {
		return etcService.selectHasReportComm(reportNum);
	};

	// 신고 하기
	@RequestMapping("insertReport.json")
	public @ResponseBody int insertReport(ReportVO report) throws Exception {
		return etcService.insertReport(report);
	};

	// 신고 처리 하기
	@RequestMapping("reportCheck.json")
	public @ResponseBody int updateReport(int reportNum, String reportmemo, String checkCode,
			String noteOrCommCode, int noteNum) throws Exception {
		return etcService.updateReport(reportNum, reportmemo, checkCode, noteOrCommCode, noteNum);
	};

	// 댓글알림
	public void commAlarm() throws Exception {
		etcService.commAlarm();
	};

	// 노트신고알림
	public void noteReportAlarm() throws Exception {
		etcService.noteReportAlarm();
	};

	// 댓글신고알림
	public void commReportAlarm() throws Exception {
		etcService.commReportAlarm();
	};

	// 상위랭크알림
	public void topRankAlarm() throws Exception {
		etcService.topRankAlarm();
	};

	// 통계 회원 가입
	@RequestMapping("stateMember.json")
	public @ResponseBody List<EtcVO> stateMember() throws Exception {
		return etcService.stateMember();
	};

	// 통계 노트 주제
	@RequestMapping("stateNoteSubject.json")
	public @ResponseBody List<EtcVO> stateNoteSubject() throws Exception {
		return etcService.stateNoteSubject();
	};

	// 사이트내 검색
	@RequestMapping("/selectSearchSite.htm")
	public String selectSearchSite() {
		return "search.selectSearchSite";
	}
	
		// * 사이트 내 검색	- 10.29 이주원
	@RequestMapping(value="selectSearchSite.json", method = RequestMethod.GET)
	public @ResponseBody List<NoteVO> selectSearchSite(String boundary, String subjectCategory,String keyword) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		map.put("boundary", boundary);
		map.put("subjectCategory", subjectCategory);
		map.put("keyword", keyword);
		/*return etcService.selectSearchSite(map);*/
		return etcService.selectSearchSite(map);
	}
	

	// 네이버 검색
	@RequestMapping("/selectSearchNaver.htm")
	public String selectSearchNaver() {
		return "search.selectSearchNaver";
	}

	// 구글 검색
	@RequestMapping("/selectSearchGoogle.htm")
	public String selectSearchGoogle(HttpServletRequest request) {
		//etcService.google(request);
		return "search.selectSearchGoogle";
	}

}
