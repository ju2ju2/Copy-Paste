/*
* @ Class : NoteMapper
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : NoteMapper-DAO
*/
package tk.copyNpaste.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import tk.copyNpaste.vo.NoteCommVO;
import tk.copyNpaste.vo.NoteVO;

public interface NoteMapper {
	
	//주제별 상위노트보기
	public List<NoteVO> selectTopNote(String subjectName) throws Exception;
	
	//노트 목록 보기
	public List<NoteVO> selectAllNote(String userEmail) throws Exception;

	//노트 상세 보기(+노트 작성)
	public NoteVO selectDetailNote(int noteNum) throws Exception;
	
	//노트 댓글 보기
	public List<NoteCommVO> selectAllNoteComm(int noteNum) throws Exception;

	//노트 수정
	public int updateNote(NoteVO note) throws Exception;
	
	//노트 삭제
	public int deleteNote(int noteNum) throws Exception;

	//노트 작성
	public int insertNote(NoteVO note) throws Exception;
	
	//노트 주제 조회
	public List<NoteVO> selectSubjectCode() throws Exception;

	//폴더별 노트 조회
	public List<NoteVO> selectByFolderNote(NoteVO note);
	
	//노트 달력 검색 //public List<NoteVO> noteByDate(HashMap<String, Object> map) throws Exception;
	public List<NoteVO> selectByCalNote(Date period) throws Exception;

	//노트 키워드 검색
	public List<NoteVO> selectByKeyNote(String keyword) throws Exception;

	//회원별 노트 검색
	public List<NoteVO> selectByMemNote(String userEmail) throws Exception;

	//회원별 노트 일괄 삭제
	public int deleteMemNote(String userEmail) throws Exception;

	//스크랩노트 등록
	public int scrapNote(String userEmail) throws Exception;
	
	//스크랩노트 삭제
	public int removeScrapNote(String userEmail) throws Exception;
	
	//노트 댓글 작성
	public int insertNoteComm(NoteCommVO note) throws Exception;
		
	//노트 댓글 삭제
	public int deleteNoteComm(int noteCommNum) throws Exception;
	
	//인기노트 상세보기 
	public List<NoteVO> selectPopNote() throws Exception;
	
	//노트 정렬 
	public List<NoteVO> selectOrderby() throws Exception;
	
	//노트 블라인드 처리
	public List<NoteVO> dd() throws Exception;
	
	//노트의 폴더 이동
	public int moveNoteFolder(NoteVO note) throws Exception;

	


		
}
