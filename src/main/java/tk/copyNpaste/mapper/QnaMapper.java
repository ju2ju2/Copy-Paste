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
	/* 진행한 애들*/
	//QNA 게시물 조회
	public List<QnaVO> selectAllQna() throws Exception;
	
	//QNA 게시물 상세보기
	public QnaVO selectDetailQna(int qnaNum) throws Exception;
	
	//QNA 게시물 댓글 조회
	public List<QnaCommVO> selectQnaComm(int qnaNum) throws Exception;
	
	//댓글 작성
	public int insertQnaComm(QnaCommVO qnaComm) throws Exception;
	//QNA 댓글 부모글 업데이트
	public int updateInsertQnaComm(int num) throws Exception;
		
	//대댓글 작성
	public int insertQnaCommComm(QnaCommVO qnaComm) throws Exception;
	//대댓글 Pos수정
	public int updateQnaCommComm(QnaCommVO qnaComm) throws Exception;
	
	//QNA 댓글 삭제
	public int deleteQnaComm(int qnaCommNum) throws Exception;
	//QNA 댓글 삭제시 자식 댓글들 삭제
	public int deleteQnaCommChild(int qnaCommPNum) throws Exception;
	
	//QNA 게시물 작성
	public int insertQna(QnaVO qna) throws Exception;
	//QNA 게시물 부모글 업데이트
	public int updateInsertQna(int num) throws Exception;
	//QNA 게시물 답글 작성
	public int insertQnaReply(QnaVO qna)throws Exception;
	
	/* 아직 안돼*/
	
	//QNA 게시글 수정
	public int updateQna(int qnaNum) throws Exception;
	
	//QNA 게시글 삭제
	public int deleteQna(int qnaNum) throws Exception;
	
	
	

}
