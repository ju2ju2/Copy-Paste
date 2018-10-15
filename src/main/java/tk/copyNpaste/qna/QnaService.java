/*
* @Class : QnaService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : QnaMapper 사용, 서비스처리.
*/
package tk.copyNpaste.qna;

import java.util.List;

import org.springframework.stereotype.Service;

import tk.copyNpaste.mapper.QnaMapper;
import tk.copyNpaste.vo.QnaCommVO;
import tk.copyNpaste.vo.QnaVO;

@Service
public class QnaService {
	
	QnaMapper qnadao;
	
	//QNA 게시물 조회
	public List<QnaVO> selectAllQna() throws Exception{
		return qnadao.selectAllQna();
	};
	
	//QNA 게시물 검색
	public List<QnaVO> selectSearchQna(String keyword) throws Exception{
		return qnadao.selectSearchQna(keyword);
	};
	
	//QNA 게시물 작성
	public int insertQna(QnaVO qna) throws Exception{
		return qnadao.insertQna(qna);
	};

	//QNA 게시물 상세보기
	public QnaVO selectDetailQna(int qnaNum) throws Exception{
		
		return qnadao.selectDetailQna(qnaNum);
	};
	
	//QNA 게시글 수정
	public int updateQna(int qnaNum) throws Exception{
		return qnadao.updateQna(qnaNum);
	};
	
	//QNA 게시글 삭제
	public int deleteQna(int qnaNum) throws Exception{
		return qnadao.deleteQna(qnaNum);
	};
	
	//QNA 댓글 작성
	public int insertQnaComm(QnaCommVO qnaComm) throws Exception{
		return qnadao.insertQnaComm(qnaComm);
	};
	
	//QNA 댓글 삭제
	public int deleteQnaComm(int qnaCommNum) throws Exception{
		return qnadao.deleteQnaComm(qnaCommNum);
	};


	
}
