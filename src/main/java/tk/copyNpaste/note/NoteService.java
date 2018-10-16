/*
* @Class : NoteService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : MemberMapper 사용, 서비스처리.
*/
package tk.copyNpaste.note;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import tk.copyNpaste.mapper.NoteMapper;
import tk.copyNpaste.vo.NoteCommVO;
import tk.copyNpaste.vo.NoteVO;

@Service
public class NoteService {
	
	NoteMapper notedao;

	//노트의 폴더 이동
	public int moveNoteFolder(NoteVO note) throws Exception {
		return notedao.moveNoteFolder(note);
	}
	
	//노트 목록 보기
	public List<NoteVO> selectAllNote() throws Exception{
		return notedao.selectAllNote();
	}
	//노트 상세 보기(+노트 작성)
	public NoteVO selectDetailNote(int noteNum) throws Exception{
		return notedao.selectDetailNote(noteNum);
	}
	//노트 수정
	public int updateNote(NoteVO note) throws Exception{
		return notedao.updateNote(note);
	}
	//노트 삭제
	public int deleteNote(int noteNum) throws Exception{
		return notedao.deleteNote(noteNum);
	}
	//노트 등록
	public int insertNote(NoteVO note) throws Exception{
		return notedao.insertNote(note);
	}
	//노트 달력 검색 //public List<NoteVO> noteByDate(HashMap<String, Object> map) throws Exception;
	public List<NoteVO> selectByCalNote(Date period) throws Exception{
		return notedao.selectByCalNote(period);
	}
	//노트 키워드 검색
	public List<NoteVO> selectByKeyNote(String keyword) throws Exception{
		List<NoteVO> list= new ArrayList<NoteVO>();
		
		return notedao.selectByKeyNote(keyword);
	}
	//회원별 노트 검색
	public List<NoteVO> selectByMemNote(String userEmail) throws Exception{
		return notedao.selectByMemNote(userEmail);
	}
	//회원별 노트 일괄 삭제
	public int deleteMemNote(String userEmail) throws Exception{
		return notedao.deleteMemNote(userEmail);
	}
	//노트 스크랩
	public int scrapNote(String userEmail) throws Exception{
		return notedao.scrapNote(userEmail);
	}
	//노트 스크랩해제
	public int removeScrapNote(String userEmail) throws Exception{
		return notedao.removeScrapNote(userEmail);
	}
	//노트 댓글 작성
	public int insertNoteComm(NoteCommVO note) throws Exception{
		return notedao.insertNoteComm(note);
	}
	//노트 댓글 삭제
	public int deleteNoteComm(int noteCommNum) throws Exception{
		return notedao.deleteNoteComm(noteCommNum);
	}
	



	
}
