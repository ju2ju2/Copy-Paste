/*
* @Class : QnaService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : QnaMapper 사용, 서비스처리.
*/
package tk.copyNpaste.qna;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.copyNpaste.mapper.QnaMapper;
import tk.copyNpaste.vo.QnaCommVO;
import tk.copyNpaste.vo.QnaVO;

@Service
public class QnaService {
	@Autowired
	private SqlSession sqlsession;
	
	//QNA 게시물 조회
	public List<QnaVO> selectAllQna() throws Exception {
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		List<QnaVO> qnalist = qnadao.selectAllQna();
		return qnalist;
	};
	
	//QNA 게시물 상세보기
		public QnaVO selectDetailQna(int qnaNum) throws Exception{
			QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);

			return qnadao.selectDetailQna(qnaNum);
		};
		
	//QNA 댓글 조회
		public List<QnaCommVO> selectQnaComm(int qnaNum) throws Exception{
			QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
			
			return qnadao.selectQnaComm(qnaNum);
		}
	
	//QNA 게시물 검색
	public List<QnaVO> selectSearchQna(String keyword) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		return qnadao.selectSearchQna(keyword);
	};
	
	//QNA 게시물 작성
	public int insertQna(QnaVO qna) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		return qnadao.insertQna(qna);
	};

	
	
	//QNA 게시글 수정
	public int updateQna(int qnaNum) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		return qnadao.updateQna(qnaNum);
	};
	
	//QNA 게시글 삭제
	public int deleteQna(int qnaNum) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		return qnadao.deleteQna(qnaNum);
	};
	
	//QNA 댓글 작성
	@Transactional
	public List<QnaCommVO> insertQnaComm(QnaCommVO qnaComm) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		List<QnaCommVO> qnaCommList = new ArrayList<>();
		try {
		qnadao.insertQnaComm(qnaComm);
		qnaCommList = qnadao.selectQnaComm(qnaComm.getQnaNum());
		}catch(Exception e){
			throw e;			
		}
		return qnaCommList;
	};
	//QNA 대댓글 작성
	@Transactional
	public List<QnaCommVO> insertQnaCommComm(QnaCommVO qnaComm) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		List<QnaCommVO> qnaCommList = new ArrayList<>();
		try {
			qnadao.updateQnaCommComm(qnaComm);
			qnadao.insertQnaCommComm(qnaComm);
			qnaCommList = qnadao.selectQnaComm(qnaComm.getQnaNum());
		}catch(Exception e){
			throw e;			
		}
		return qnaCommList;
	};
	
	//QNA 댓글 삭제
	public int deleteQnaComm(int qnaCommNum) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		
		return qnadao.deleteQnaComm(qnaCommNum);
	};

}
