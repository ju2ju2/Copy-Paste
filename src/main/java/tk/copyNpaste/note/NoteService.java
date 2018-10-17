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

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.copyNpaste.mapper.NoteMapper;
import tk.copyNpaste.vo.NoteCommVO;
import tk.copyNpaste.vo.NoteVO;

@Service
public class NoteService {

	 @Autowired
	 private SqlSession sqlsession;
	 
	//주제별 상위노트 목록 보기
	public List<NoteVO> selectTopNote() throws Exception{		
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		List<NoteVO> notelist = notedao.selectTopNote();
		return notelist;
	} 
	//노트 목록 보기
	public List<NoteVO> selectAllNote() throws Exception{		
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		List<NoteVO> notelist = notedao.selectAllNote();
		return notelist;
	}
	//노트 상세 보기(+노트 작성)
	public NoteVO selectDetailNote(int noteNum) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		NoteVO note =notedao.selectDetailNote(noteNum);
		return note;
	}
	//노트 상세 보기(+노트 작성)
	public List<NoteCommVO> selectAllNoteComm(int noteNum) throws Exception{
		NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		List<NoteCommVO> noteCommList = notedao.selectAllNoteComm(noteNum);
		return noteCommList;
		
	}
	
	//노트 수정
	public int updateNote(NoteVO note) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.updateNote(note);
	}
	//노트 삭제
	public int deleteNote(int noteNum) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.deleteNote(noteNum);
	}
	//노트 등록
	public int insertNote(NoteVO note) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.insertNote(note);
	}
	//노트 달력 검색 //public List<NoteVO> noteByDate(HashMap<String, Object> map) throws Exception;
	public List<NoteVO> selectByCalNote(Date period) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.selectByCalNote(period);
	}
	//노트 키워드 검색
	public List<NoteVO> selectByKeyNote(String keyword) throws Exception{
		
		List<NoteVO> list= new ArrayList<NoteVO>();
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.selectByKeyNote(keyword);
	}
	//회원별 노트 검색
	public List<NoteVO> selectByMemNote(String userEmail) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.selectByMemNote(userEmail);
	}
	//회원별 노트 일괄 삭제
	public int deleteMemNote(String userEmail) throws Exception{
		
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.deleteMemNote(userEmail);
	}
	//노트 스크랩
	public int scrapNote(String userEmail) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.scrapNote(userEmail);
	}
	//노트 스크랩해제
	public int removeScrapNote(String userEmail) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.removeScrapNote(userEmail);
	}
	//노트 댓글 작성
	public int insertNoteComm(NoteCommVO note) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.insertNoteComm(note);
	}
	//노트 댓글 삭제
	public int deleteNoteComm(int noteCommNum) throws Exception{
		NoteMapper notedao=  sqlsession.getMapper(NoteMapper.class);
		return notedao.deleteNoteComm(noteCommNum);
	}
	
	//노트의 폴더 이동
	public int moveNoteFolder(NoteVO note) throws Exception {
		NoteMapper notedao=sqlsession.getMapper(NoteMapper.class);
			
		 return notedao.moveNoteFolder(note);
	}
	

	/*	for (NoteVO note: notelist ) {
		System.out.println(note.getUserNick());
		}
		
		for (NoteCommVO noteComm: noteCommList ) {
		System.out.println(noteComm.toString());
		}
	
	*/
}