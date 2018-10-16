/*
* @Class : NoteController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 노트 관련 컨트롤러. (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.note;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.vo.NoteCommVO;
import tk.copyNpaste.vo.NoteVO;

@Controller
@RequestMapping(value = "/note/")
public class NoteController {
	
	NoteMailnFileService  noteMailnFileService = new NoteMailnFileService();
	NoteService noteService = new NoteService();
	
	// 노트 페이지로 이동(2018.10.10. 고은아 추가)
	@RequestMapping("write.htm")
	public String insertNotePage() throws Exception {
		
		return "write.insertNote";
	}
	
	
	//노트의 폴더 이동
	public int moveNoteFolder(NoteVO note) throws Exception {
		return noteService.moveNoteFolder(note);
	}
	
	//노트 목록 보기
	@RequestMapping(value = "note.htm")
	public String selectAllNote(Model model) throws Exception{
		List<NoteVO> list=noteService.selectAllNote();
		model.addAttribute("list",list);
		System.out.println("notecontroller");
		return "note.list";
	}
	//노트 상세 보기(+노트 작성)
	@RequestMapping(value = "noteDetail.htm")
	public String selectDetailNote(/*int noteNum*/) throws Exception{
	/*	NoteVO note= noteService.selectDetailNote(noteNum);*/
		return "notedetail";
	}
	
	//노트 수정
	public int updateNote(NoteVO note) throws Exception{
		return noteService.updateNote(note);
	}
	//노트 삭제
	public int deleteNote(int noteNum) throws Exception{
		return noteService.deleteNote(noteNum);
	}
	//노트 등록
	public int insertNote(NoteVO note) throws Exception{
		return noteService.insertNote(note);
	}
	//노트 달력 검색 //public List<NoteVO> noteByDate(HashMap<String, Object> map) throws Exception;
	public List<NoteVO> selectByCalNote(Date period) throws Exception{
		return noteService.selectByCalNote(period);
	}
	//노트 키워드 검색
	public List<NoteVO> selectByKeyNote(String keyword) throws Exception{
		return noteService.selectByKeyNote(keyword);
	}
	//회원별 노트 검색
	public List<NoteVO> selectByMemNote(String userEmail) throws Exception{
		return noteService.selectByMemNote(userEmail);
	}
	//회원별 노트 일괄 삭제
	public int deleteMemNote(String userEmail) throws Exception{
		return noteService.deleteMemNote(userEmail);
	}
	//노트 스크랩
	public int scrapNote(String userEmail) throws Exception{
		return noteService.scrapNote(userEmail);
	}
	//노트 스크랩해제
	public int removeScrapNote(String userEmail) throws Exception{
		return noteService.removeScrapNote(userEmail);
	}
	//노트 댓글 작성
	public int insertNoteComm(NoteCommVO note) throws Exception{
		return noteService.insertNoteComm(note);
	}
	//노트 댓글 삭제
	public int deleteNoteComm(int noteCommNum) throws Exception{
		return noteService.deleteNoteComm(noteCommNum);
	}
	
	//노트 메일 전송
	public NoteVO emailNote(NoteVO note) throws Exception {
		return null;
	}
	
	//노트 pdf파일로 다운로드
	public NoteVO pdfDownNote(NoteVO note) throws Exception {
		return null;
	}
	
	//노트 xls파일로 다운로드
	public NoteVO xlsDownNote(NoteVO note) throws Exception {
		return null;
	}
	
	//노트 hwp파일로 다운로드
	public NoteVO hwpDownNote(NoteVO note) throws Exception {
		return null;
	}



}
