/*
* @ Class : QnaMapper
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : QnaMapper-DAO
*/
package tk.copyNpaste.mapper;

import java.util.List;

import tk.copyNpaste.vo.NoteVO;
import tk.copyNpaste.vo.QnaCommVO;
import tk.copyNpaste.vo.QnaVO;

public interface QnaMapper {
	//QNA 게시물 조회
	public List<QnaVO> selectAllQna() throws Exception;
	
	//QNA 게시물 상세보기
	public QnaVO selectDetailQna(int qnaNum) throws Exception;
	
	//QNA 게시물 댓글 조회
	public List<QnaCommVO> selectQnaComm(int qnaNum) throws Exception;
	
	//QNA 게시물 검색
	public List<QnaVO> selectSearchQna(String keyword) throws Exception;
	
	//QNA 게시물 작성
	public int insertQna(QnaVO qna) throws Exception;
	
	//QNA 게시글 수정
	public int updateQna(int qnaNum) throws Exception;
	
	//QNA 게시글 삭제
	public int deleteQna(int qnaNum) throws Exception;
	
	//QNA 댓글 작성
	public int insertQnaComm(QnaCommVO qnaComm) throws Exception;
	
	//QNA 댓글 삭제
	public int deleteQnaComm(int qnaCommNum) throws Exception;

}
