/*
* @Class : NoteController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 노트 관련 컨트롤러. (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.note;

import java.security.Principal;
import java.util.Date;
import java.util.List;

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



	// 회원의 노트 목록 보기+폴더 목록 조회
	@RequestMapping(value = "note.htm")
	public String selectAllNote(Model model, Principal principal) throws Exception {
		List<NoteVO> noteList = noteService.selectAllNote(principal.getName());
		List<FolderVO> folderList = folderService.selectAllFolder(principal.getName());
		model.addAttribute("noteList", noteList);
		model.addAttribute("folderList", folderList);
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

	
	// 노트 작성페이지로 이동
	@RequestMapping(value="write.htm",method = RequestMethod.GET)
	public String writeNotePage() throws Exception {
		return "write.insertNote";
	}
	
	// 노트 작성 
	@RequestMapping(value="write.htm",method = RequestMethod.POST)
	public String insertNote(Model model, NoteVO note,Principal principal) throws Exception {
		note.setUserEmail(principal.getName());
		note.setSubjectCode(note.getSubjectCode());
		note.setFolderName(note.getFolderName());
		int result =noteService.insertNote(note);
		model.addAttribute("result", result);//1일때 등록성공, 0일때 등록실패
		return "note.list"; //노트 작성 후 노트 리스트로 이동.
	}
	
	// 노트 주제 검색 
	@RequestMapping(value="selectSubjectCode.json")
	public @ResponseBody List<NoteVO> selectSubjectCode() throws Exception {
		List<NoteVO> note = noteService.selectSubjectCode();
		return note;
	}
	
	
	// 노트 수정
	public int updateNote(NoteVO note) throws Exception {
		return noteService.updateNote(note);
	}

	// 노트 삭제
	public int deleteNote(int noteNum) throws Exception {
		return noteService.deleteNote(noteNum);
	}

	// 노트 달력 검색 //public List<NoteVO> noteByDate(HashMap<String, Object> map) throws
	// Exception;
	public List<NoteVO> selectByCalNote(Date period) throws Exception {
		return noteService.selectByCalNote(period);
	}

	// 노트 키워드 검색
	public List<NoteVO> selectByKeyNote(String keyword) throws Exception {
		return noteService.selectByKeyNote(keyword);
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
