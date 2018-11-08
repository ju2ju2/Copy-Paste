/*
* @Class : EtcController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 기타 관련 컨트롤러. + 관리자 (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.etc;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import tk.copyNpaste.note.NoteService;
import tk.copyNpaste.vo.EtcVO;
import tk.copyNpaste.vo.MemberVO;
import tk.copyNpaste.vo.NoteVO;
import tk.copyNpaste.vo.ReportVO;
import tk.copyNpaste.vo.noticeVO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

@RequestMapping("/etc/")
@Controller // 동기 컨트롤러. retrun>> ModelAndView or String.
public class EtcController {
	
	@Autowired
    private View jsonview;
	@Autowired
	EtcService etcService;
	@Autowired
	NoteService noteService;

	@RequestMapping("notifyList.json")
	// 알림 리스트 보내기
	public @ResponseBody List<noticeVO> noticeList(String userEmail) throws Exception {
		return etcService.noticeList(userEmail);
	}
	
	@RequestMapping("notifyReadCheck.json")
	// 알림 읽음 처리 하기
	public @ResponseBody int notifyReadCheck(String userEmail, String notifyCode, int notifyTarget) throws Exception {
		return etcService.notifyReadCheck(userEmail, notifyCode, notifyTarget);
		
	}
	
	@RequestMapping("adminMember.htm")
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
	// 관리자 페이지 (노트목록)
	public ModelAndView adminNotePage() throws Exception {
		List<NoteVO> noteList = noteService.selectAllNoteAdmin();
		ModelAndView adminmav = new ModelAndView();
		adminmav.setViewName("admin.manageNote");
		adminmav.addObject("NoteVo", noteList);
		return adminmav;
	};
	
/*	// 회원별 노트 검색-관리자-노트관리
	public List<NoteVO> selectByMemNote(String userEmail) throws Exception {
		return noteService.selectByMemNote(userEmail);
	}*/

	// 노트 개별 삭제-관리자-노트관리
	@RequestMapping(value="deleteNoteNumAdmin.do")
	public @ResponseBody int deleteNoteNumAdmin(int noteNum) throws Exception {
		int result = noteService.deleteNoteNumAdmin(noteNum);
		return result;
		}	
	
	// 회원별 작성 노트 개수-관리자-노트관리
	@RequestMapping(value="selectNoteCount.do")
	public @ResponseBody int selectNoteCount(String userEmail) throws Exception {
		int result = noteService.selectNoteCount(userEmail);
		return result;
	}	
	
	// 회원별 노트 일괄 삭제-관리자-노트관리
	@RequestMapping(value="deleteMemNote.do")
	public @ResponseBody int deleteMemNote(String userEmail) throws Exception {
		int result = noteService.deleteMemNote(userEmail);
		return result;
	}	
	
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
	public @ResponseBody int updateReport(ReportVO report) throws Exception {
		return etcService.updateReport(report);
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
	
	// 통계 유형별 회원가입 
		@RequestMapping("stateJoinMember.json")
		public @ResponseBody List<EtcVO> stateJoinMember() throws Exception {
			return etcService.stateJoinMember();
		};

	// 많이 사용된 단어 가져오기
	@RequestMapping("wordchart.json")
	public @ResponseBody View wordchart(Model model) throws Exception {
		List<String> wordChartList = etcService.wordchart();
		model.addAttribute("wordChartList",wordChartList);
		return jsonview;
	};
	
	
	// 사이트내 검색 + 인기글 목록 뿌려주기
	@RequestMapping("/selectSearchSite.htm")
	public String selectSearchSite(Model model, String subjectName) throws Exception {
		model.addAttribute("subjectName", subjectName);
		return "search.selectSearchSite";
	}
	
	// * 사이트 내 검색	- 10.29 이주원
	@RequestMapping(value="selectSearchSite.json", method = RequestMethod.GET)
	public @ResponseBody List<NoteVO> selectSearchSite(String boundary, String subjectCategory,String keyword,String page) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		map.put("boundary", boundary);
		map.put("subjectCategory", subjectCategory);
		map.put("keyword", keyword);
		map.put("page", page);
		List<NoteVO> noteList=etcService.selectSearchSite(map);
		return noteList;
	}

	
	
	// 사이트 내 검색 자동완성(우나연 11.06)
	@RequestMapping(value="collectSearchKeywords.json", method = RequestMethod.GET)
	public @ResponseBody List<NoteVO> collectSearchKeywords(String subjectName) throws Exception {
	return etcService.collectSearchKeywords(subjectName);
}
	
	// 네이버 검색
	@RequestMapping("/selectSearchNaver.htm")
	public String selectSearchNaver(HttpServletRequest request) throws InterruptedException {
		etcService.naver(request);
		return "search.selectSearchNaver";
	}

	// 구글 검색
	@RequestMapping("/selectSearchGoogle.htm")
	public String selectSearchGoogle(HttpServletRequest request) throws InterruptedException {
		etcService.google(request);
		return "search.selectSearchGoogle";
	}


}
