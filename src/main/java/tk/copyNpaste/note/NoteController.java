/*
* @Class : NoteController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 노트 관련 컨트롤러. (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.note;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.copyNpaste.folder.FolderService;
import tk.copyNpaste.vo.FolderVO;
import tk.copyNpaste.vo.NoteCommVO;
import tk.copyNpaste.vo.NoteVO;

@Controller
@RequestMapping(value = "/note/")
public class NoteController {
	@Autowired
	NoteMailnFileService noteMailnFileService;

	@Autowired
	NoteService noteService;
	
	@Autowired
	FolderService folderService;

	
	// 회원의 노트 목록 보기
	@RequestMapping(value = "selectAllNote.json")
	public @ResponseBody List<NoteVO> selectAllNote(Model model, Principal principal) throws Exception {
		List<NoteVO> noteList = noteService.selectAllNote(principal.getName());
		return noteList;
	}
	
	// 회원의 노트 목록 보기+폴더 목록 조회
	@RequestMapping(value = "note.htm")
	public String notepage(Model model, Principal principal) throws Exception {
		List<NoteVO> noteList = noteService.selectAllNote(principal.getName());
		List<FolderVO> folderList = folderService.selectAllFolder(principal.getName());
		model.addAttribute("noteList", noteList);
		model.addAttribute("folderList", folderList);
		return "note.list";
	}

	// 노트 상세 보기(+노트 작성)
	@RequestMapping(value = "noteDetail.htm")
	public String selectDetailNote(int noteNum,String cmd, Model model) throws Exception {
		NoteVO note = noteService.selectDetailNote(noteNum);
		List<NoteCommVO> noteCommList = noteService.selectAllNoteComm(noteNum);
		model.addAttribute("note", note);
		model.addAttribute("noteCommList", noteCommList);
		String viewpage;
		if(cmd!=null) {
			viewpage="mynotedetail";
		}else {viewpage="notedetail";}
		
		return viewpage;//(modal/notedetail.jsp)
	}

	// 노트 주제 검색 
	@RequestMapping(value="selectSubjectCode.json")
	public @ResponseBody List<NoteVO> selectSubjectCode() throws Exception {
		List<NoteVO> note = noteService.selectSubjectCode();
		return note;
	}
	
	// 노트 작성페이지로 이동
	@RequestMapping(value="write.htm", method = RequestMethod.GET)
	public String writeNotePage() throws Exception {
		return "write.insertNote";
	}
	
	// 노트 작성 
	@RequestMapping(value="write.json")
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
		return noteService.insertNote(note);
	}
	
	// 노트 수정 페이지로 이동
	@RequestMapping(value="updateNote.htm", method = RequestMethod.GET)
	public String updateNotePage(int noteNum, Model model) throws Exception {
		NoteVO note = noteService.selectDetailNote(noteNum);
		model.addAttribute("note", note);
		return "write.updateNote";//(write/updateNote.jsp)
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
		return noteService.updateNote(note);
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
	
	// MY NOTE → 노트 폴더별 조회
	@RequestMapping(value = "selectNoteByFolder.json")
	public @ResponseBody List<NoteVO> selectNoteByFolder(NoteVO note,Principal principal) throws Exception {
		note.setUserEmail(principal.getName());
		return noteService.selectNoteByFolder(note);
	}
	
	// 노트 정렬
	@RequestMapping(value="selectOrderbyNote.json")
	public @ResponseBody List<NoteVO> selectOrderbyNote(String sortCategory,Principal principal) throws Exception {
		System.out.println("정렬 기준 : " + sortCategory);
		String sortCategory1 = sortCategory;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sortCategory", sortCategory);
		map.put("userEmail", principal.getName());
		
		List<NoteVO> a;
		if(sortCategory.trim().equals("n.noteDateDesc")) {
			a= noteService.selectOrderbyNote1(map);
			System.out.println("노트 최신순 정렬");
		}else if(sortCategory.trim().equals("n.noteDateAsc")){
			a= noteService.selectOrderbyNote2(map);
			System.out.println("노트 오래된순 정렬");
		}else if(sortCategory.trim().equals("n.noteTitle")) {
			a= noteService.selectOrderbyNote3(map);
			System.out.println("노트 가나다순 정렬");
		}else {
			a= noteService.selectOrderbyNote4(map);
			System.out.println("노트 전체보기");
		}
		return a;
	}
	
	// 노트 달력 검색 //public List<NoteVO> noteByDate(HashMap<String, Object> map) throws
	// Exception;
	public List<NoteVO> selectByCalNote(Date period) throws Exception {
		return noteService.selectByCalNote(period);
	}

	// 노트 키워드 검색
	@RequestMapping(value="selectByKeyNote.json")
	public @ResponseBody List<NoteVO> selectByKeyNote(String keyword,Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("userEmail", principal.getName());
		return noteService.selectByKeyNote(map);
	}

	// 회원별 노트 검색
	public List<NoteVO> selectByMemNote(String userEmail) throws Exception {
		return noteService.selectByMemNote(userEmail);
	}

	// 회원별 노트 일괄 삭제
	public int deleteMemNote(String userEmail) throws Exception {
		return noteService.deleteMemNote(userEmail);
	}

	// 노트 스크랩
	public int scrapNote(String userEmail) throws Exception {
		return noteService.scrapNote(userEmail);
	}

	// 노트 스크랩해제
	public int removeScrapNote(String userEmail) throws Exception {
		return noteService.removeScrapNote(userEmail);
	}

	// 노트 댓글 조회-비동기
	@RequestMapping(value="selectAllNoteComm.json")
	public @ResponseBody List<NoteCommVO> selectAllNoteComm(int noteNum, Principal principal) throws Exception {
		return noteService.selectAllNoteComm(noteNum);
	}

	// 노트 댓글 작성-비동기
	@RequestMapping(value="insertNoteComm.json")
	public @ResponseBody List<NoteCommVO> insertNoteComm(NoteCommVO note, int noteNum, Principal principal) throws Exception {
		note.setUserEmail(principal.getName());//로그인한 사용자 ID
		noteService.insertNoteComm(note);
		return noteService.selectAllNoteComm(noteNum);
	}

	// 노트 대댓글 작성-비동기
	@RequestMapping(value="insertNoteCommComm.json")
	public @ResponseBody int insertNoteCommComm(NoteCommVO note, int noteNum, Principal principal) throws Exception {
		note.setUserEmail(principal.getName());//로그인한 사용자 ID
		return noteService.insertNoteCommComm(note);
	}
	// 노트 댓글 작성-비동기
		public void insertNoteComm(NoteCommVO note, Principal principal) throws Exception {
			note.setUserEmail(principal.getName());//로그인한 사용자 ID
			noteService.insertNoteComm(note);
		}

	// 노트 댓글 삭제
	public int deleteNoteComm(int noteCommNum) throws Exception {
		return noteService.deleteNoteComm(noteCommNum);
	}

	// 노트 메일 전송
	public NoteVO emailNote(NoteVO note) throws Exception {
		return null;
	}

	// 노트 pdf파일로 다운로드
	public NoteVO pdfDownNote(NoteVO note) throws Exception {
		return null;
	}

	// 노트 xls파일로 다운로드
	public NoteVO xlsDownNote(NoteVO note) throws Exception {
		return null;
	}

	// 노트 hwp파일로 다운로드
	public NoteVO hwpDownNote(NoteVO note) throws Exception {
		return null;
	}

	// 노트의 폴더 이동
	public int moveNoteFolder(NoteVO note) throws Exception {
		return noteService.moveNoteFolder(note);
	}
	
	
}



