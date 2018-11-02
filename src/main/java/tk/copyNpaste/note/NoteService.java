/*
* @Class : NoteService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : MemberMapper 사용, 서비스처리.
*/
package tk.copyNpaste.note;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.mapper.DragMapper;
import tk.copyNpaste.mapper.NoteMapper;
import tk.copyNpaste.vo.DragVO;
import tk.copyNpaste.vo.NoteCommVO;
import tk.copyNpaste.vo.NoteVO;

@Service
public class NoteService {

	 @Autowired
	 private SqlSession sqlsession;
	 
	//주제별 상위노트 목록 보기
	public List<NoteVO> selectTopNote(String subjectName) throws Exception{		
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		List<NoteVO> notelist = notedao.selectTopNote(subjectName);
		return notelist;
	} 
	//노트 목록 보기
	public List<NoteVO> selectAllNote(NoteVO note) throws Exception{		
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		List<NoteVO> notelist = notedao.selectAllNote(note);
		return notelist;
	}
	//노트 상세 보기(+노트 작성)
	public NoteVO selectDetailNote(int noteNum) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		NoteVO note =notedao.selectDetailNote(noteNum);
		return note;
	}
	//노트 댓글 보기
	public List<NoteCommVO> selectAllNoteComm(int noteNum) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		List<NoteCommVO> noteCommList = notedao.selectAllNoteComm(noteNum);
		return noteCommList;
	}
	//노트 댓글 작성
	public int insertNoteComm(NoteCommVO noteComm) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		notedao.insertNoteComm(noteComm);
		notedao.updateInsertNoteComm(noteComm.getNum());
		return 0;
	}
	
	//노트 대댓글 작성
	public int insertNoteCommComm(NoteCommVO note) throws Exception {
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		return notedao.insertNoteCommComm(note);
	}
	
	//노트 댓글 삭제
	public int deleteNoteComm(int noteCommNum) throws Exception {
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
			int result=notedao.blindNoteComm(noteCommNum);//부모댓글 블라인드 시도
			if (result>0) {	}
			else {
				notedao.deleteNoteComm(noteCommNum);
			}
		return result;
	}

	//노트 수정
	public int updateNote(NoteVO note) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		return notedao.updateNote(note);
	}
	//노트 삭제
	public int deleteNote(int noteNum) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		return notedao.deleteNote(noteNum);
	}
	//노트 등록
	public int insertNote(NoteVO note) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		return notedao.insertNote(note);
	}
	//노트 주제 조회
	public List<NoteVO> selectSubjectCode() throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		List<NoteVO> notelist = notedao.selectSubjectCode();
		return notelist;
	}
	
	//노트 폴더조회
	public List<NoteVO> selectByFolderNote(NoteVO note) {
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		List<NoteVO> notelist = notedao.selectByFolderNote(note);
		return notelist;
	}
	
	//노트 정렬
	public List<NoteVO> selectOrderbyNote(HashMap map) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		return notedao.selectOrderbyNote(map);
	}
	
	//노트 달력 검색 //public List<NoteVO> noteByDate(HashMap<String, Object> map) throws Exception;
	public List<NoteVO> selectByCalNote(HashMap map) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		return notedao.selectByCalNote(map);
	}
	
	//노트 키워드 검색
	public List<NoteVO> selectByKeyNote(HashMap map) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		return notedao.selectByKeyNote(map);
	}

	//노트 스크랩
	public int scrapNote(NoteVO note) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.scrapNote(note);
	}

	//노트 전체보기 - 관리자
	public List<NoteVO> selectAllNoteAdmin() throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.selectAllNoteAdmin();
	}
	
	//회원별 노트 검색-관리자
	public List<NoteVO> selectByMemNote(String userEmail) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.selectByMemNote(userEmail);
	}
	
	// 노트 개별 삭제-관리자-노트관리
	public int deleteNoteNumAdmin(int noteNum) throws Exception {
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		int result = notedao.deleteNoteNumAdmin(noteNum);
		return result;
		}	
	
	//회원별 작성 노트 개수-관리자
	public int selectNoteCount(String userEmail) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		int result = notedao.selectNoteCount(userEmail);
		return result;
	}
	
	//회원별 노트 일괄 삭제-관리자
	public int deleteMemNote(String userEmail) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		int result = notedao.deleteMemNote(userEmail);
		return result;
	}
	//회원별 노트 일괄 삭제-관리자
	public int blindNote(int noteNum) throws Exception{	
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.blindNote(noteNum);
	}
	//회원 목록 전체보기 무한스크롤
	public List<NoteVO> infiniteScrollNote(NoteVO note) throws Exception  {
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		List<NoteVO>  noteList = notedao.infiniteScrollNote(note);
		return noteList;
	}


	
	
	
	/*	for (NoteVO note: notelist ) {
		System.out.println(note.getUserNick());
		}
		
		for (NoteCommVO noteComm: noteCommList ) {
		System.out.println(noteComm.toString());
		}
	
	*/
}
