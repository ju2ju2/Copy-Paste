/*
* @Class : NoteController
* @ Date : 2018.10.05
* @ Author : 우나연
* @ Desc : 노트 관련 컨트롤러. (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.note;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tk.copyNpaste.folder.FolderService;
import tk.copyNpaste.vo.NoteCommVO;
import tk.copyNpaste.vo.NoteVO;

@Controller
@RequestMapping(value = "/note/")
public class NoteController {
	@Autowired
	NoteMailnFileService noteMailnFileService;
	
	@Autowired
	NoteVisionService noteVisionSpellService;
	
	@Autowired
	NoteService noteService;
	
	@Autowired
	FolderService folderService;

	
	// 회원의 노트 목록 보기
	@RequestMapping(value = "selectAllNote.json")
	public @ResponseBody List<NoteVO> selectAllNote(Model model, String page, Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("userEmail", principal.getName());
		List<NoteVO> noteList = noteService.selectAllNote(map);
		return noteList;
	}
	
	
	//mynote 페이지
	@RequestMapping(value = "note.htm")
	public String notepage(Model model, Principal principal, String noteNum) throws Exception {
		if (noteNum!=null) {
			model.addAttribute("noteNum", noteNum);
		}
		return "note.list";
	}

	// 노트 상세 보기(+노트 작성)
	@RequestMapping(value = "noteDetail.htm")
	public String selectDetailNote(int noteNum, Model model) throws Exception {
		NoteVO note = noteService.selectDetailNote(noteNum);
		List<NoteCommVO> noteCommList = noteService.selectAllNoteComm(noteNum);
		model.addAttribute("note", note);
		model.addAttribute("noteCommList", noteCommList);
		return "notedetail";//(modal/notedetail.jsp)
	}

	// 노트 주제 검색 
	@RequestMapping(value="selectSubjectCode.json")
	public @ResponseBody List<NoteVO> selectSubjectCode() throws Exception {
		List<NoteVO> note = noteService.selectSubjectCode();
		return note;
	}
	
	// 노트 작성페이지로 이동
	@RequestMapping(value="write.htm", method = RequestMethod.GET)
	public String writeNotePage(Model model) throws Exception {
		return "write.insertNote";
	}
	
	// 노트 작성 
	@RequestMapping(value="insertNote.json")
	public @ResponseBody int insertNote(NoteVO note,Principal principal) throws Exception {
		note.setUserEmail(principal.getName());
		String NoteContent = note.getNoteContent();
		Document doc = Jsoup.parseBodyFragment(NoteContent);
		Elements imgs = doc.getElementsByTag("img");
		if(imgs.size() > 0) { 
			String src = imgs.get(0).attr("src"); 
			note.setNoteThumnail(src);
		} else { note.setNoteThumnail(
				"https://d1u1amw606tzwl.cloudfront.net/assets/users/avatar-default-96007ee5610cdc5a9eed706ec0889aec2257a3937d0fbb747cf335f8915f09b2.png");
		}	
		noteService.insertNote(note);			
		return note.getNoteNum();
	}
	
	// 노트 수정 페이지로 이동
	@RequestMapping(value="updateNote.htm", method = RequestMethod.GET)
	public String updateNotePage(int noteNum, Model model) throws Exception {
		NoteVO note = noteService.selectDetailNote(noteNum);
		model.addAttribute("note", note);
		return "write.updateNote";//(write/updateNote.jsp)
	}
	// 작성된 노트 이용해 작성하는 페이지로 이동
	@RequestMapping(value="insertWithOtherNote.htm", method = RequestMethod.GET)
	public String insertWithOtherNote(int noteNum, Model model) throws Exception {
		NoteVO note = noteService.selectDetailNote(noteNum);
		model.addAttribute("note", note);
		return "write.insertWithOtherNote";//(write/updateNote.jsp)
	}
	// 노트 수정 -비동기
	@RequestMapping(value="updateNote.json")
	public @ResponseBody int updateNote(NoteVO note, Principal principal) throws Exception {
		String NoteContent = note.getNoteContent();
		Document doc = Jsoup.parseBodyFragment(NoteContent);
		Elements imgs = doc.getElementsByTag("img");
		if(imgs.size() > 0) { 
			String src = imgs.get(0).attr("src"); 
			note.setNoteThumnail(src);
		} else {
			note.setNoteThumnail("https://d1u1amw606tzwl.cloudfront.net/assets/users/avatar-default-96007ee5610cdc5a9eed706ec0889aec2257a3937d0fbb747cf335f8915f09b2.png");}// 수정시 이미지 없을때 기본이미지로.
		noteService.updateNote(note);
		return note.getNoteNum();
	}
		
	// 노트 삭제
	@RequestMapping(value="deleteNote.json")
	public @ResponseBody int deleteNote(int noteNum) throws Exception {
		return noteService.deleteNote(noteNum);
	}
	
	// 노트 폴더별 조회
	@RequestMapping(value = "selectByFolderNote.json")
	public @ResponseBody List<NoteVO> selectByFolderNote(NoteVO note,Principal principal) throws Exception {
		note.setUserEmail(principal.getName());
		return noteService.selectByFolderNote(note);
	}

	// 노트 정렬
	@RequestMapping(value="selectOrderbyNote.json")
	public @ResponseBody List<NoteVO> selectOrderbyNote(String sortCategory,String page,Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sortCategory", sortCategory);
		map.put("page", page);
		map.put("userEmail", principal.getName());
		return noteService.selectOrderbyNote(map);
	}

	// 노트 날짜별 검색
	@RequestMapping(value="selectByCalNote.json")
	public @ResponseBody List<NoteVO> selectByCalNote(String fromDate, String toDate,String page, Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fromDate", fromDate);
		map.put("toDate", toDate);
		map.put("page", page);
		map.put("userEmail", principal.getName());
		return noteService.selectByCalNote(map);
	}

	// 노트 키워드 검색
	@RequestMapping(value="selectByKeyNote.json")
	public @ResponseBody List<NoteVO> selectByKeyNote(String keyword,String page,Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("page", page);
		map.put("userEmail", principal.getName());

		return noteService.selectByKeyNote(map);
	}

	// 노트 스크랩
	@RequestMapping(value="scrapNote.json")
	public @ResponseBody int scrapNote(NoteVO note, Principal principal) throws Exception {
		note.setUserEmail(principal.getName());
		return noteService.scrapNoteAspect(note);
	}

	// 노트 댓글 조회-비동기
	@RequestMapping(value="selectAllNoteComm.json")
	public @ResponseBody List<NoteCommVO> selectAllNoteComm(int noteNum, Principal principal) throws Exception {
		return noteService.selectAllNoteComm(noteNum);
	}

	// 노트 댓글 작성-비동기
	@RequestMapping(value="insertNoteComm.json")
	public @ResponseBody int insertNoteComm(NoteCommVO note, int noteNum, Principal principal) throws Exception {
		note.setUserEmail(principal.getName());//로그인한 사용자 ID
		return noteService.insertNoteComm(note);
		/*return noteService.selectAllNoteComm(noteNum);*/
	}

	// 노트 대댓글 작성-비동기
	@RequestMapping(value="insertNoteCommComm.json")
	public @ResponseBody int insertNoteCommComm(NoteCommVO note, int noteNum, Principal principal) throws Exception {
		note.setUserEmail(principal.getName());//로그인한 사용자 ID
		return noteService.insertNoteCommComm(note);
	}

	// 댓글  삭제 
	@RequestMapping(value="deleteNoteComm.json")
	public @ResponseBody int deleteNoteComm(int noteCommNum) throws Exception {
		return noteService.deleteNoteComm(noteCommNum);
	}
	
	// 노트 메일 전송
	@RequestMapping(value="emailNote.json")
	public @ResponseBody void emailNote(NoteVO note, String noteEmailTo, Principal principal) throws Exception {
		noteMailnFileService.emailNote(note, noteEmailTo, principal);
	}

	// 노트 pdf파일로 다운로드
	@RequestMapping(value="downloadNotePdf.do")
	public void pdfDownNote(NoteVO note, HttpServletRequest request, HttpServletResponse response) throws Exception {	
		noteMailnFileService.pdfDownNote(note, request, response);
	}

	// 노트 xls파일로 다운로드
	public NoteVO xlsDownNote(NoteVO note) throws Exception {
		return null;
	}

	// 노트 hwp파일로 다운로드
	public NoteVO hwpDownNote(NoteVO note) throws Exception {
		return null;
	}
	
	// 노트 블라인드 처리-관리자
	public int blindNote(int noteNum) throws Exception{	
		return noteService.blindNote(noteNum);
	}
	
	
	// 비젼 api 문자인식
	@RequestMapping(value="visionAnalizeImg.json")
	public @ResponseBody Map<String, String> visionAnalizeImg(Principal principal, MultipartHttpServletRequest req) throws Exception {
		String userEmail=principal.getName();
		String text=noteVisionSpellService.vision(userEmail, req);
		Map<String, String> map = new HashMap<String, String> ();
		map.put("text", text);
		return map;
	}
	
}



