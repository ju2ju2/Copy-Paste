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
	/* 게시물 관련 */
	
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
	
	//QNA 게시물 작성
	@Transactional
	public int insertQna(QnaVO qna) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		int resulte = 0;
		try {
			qnadao.insertQna(qna);
			resulte = qnadao.updateInsertQna(qna.getNum());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resulte;
	};
	//QNA 게시물 답글
	@Transactional
	public int insertQnaReply(QnaVO qna) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		int resulte = 0;
		try {
			resulte = qnadao.insertQnaReply(qna);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resulte;
	};
	
	//QNA 게시글 수정
	public int updateQna(QnaVO qna) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		return qnadao.updateQna(qna);
	};
	
	//QNA 게시글 삭제
	@Transactional
	public int deleteQna(int qnaNum) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		int result=0;
		try {
			result=qnadao.deleteQna(qnaNum);
			qnadao.deleteQnaChild(qnaNum);
		}catch(Exception e){
			throw e;			
		}
		return result;
	};
	
	/* 댓글 관련 */

	//QNA 댓글 조회
	public List<QnaCommVO> selectQnaComm(int qnaNum) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		return qnadao.selectQnaComm(qnaNum);
	}
	
	//QNA 댓글 작성
	@Transactional
	public List<QnaCommVO> insertQnaComm(QnaCommVO qnaComm) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		List<QnaCommVO> qnaCommList = new ArrayList<>();
		try {
		qnadao.insertQnaComm(qnaComm);
		qnadao.updateInsertQnaComm(qnaComm.getNum());
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
			qnadao.insertQnaCommComm(qnaComm);
			qnaCommList = qnadao.selectQnaComm(qnaComm.getQnaNum());
		}catch(Exception e){
			throw e;			
		}
		return qnaCommList;
	};
	
	//QNA 댓글 삭제
	@Transactional
	public int deleteQnaComm(QnaCommVO qnaComm) throws Exception{
		QnaMapper qnadao = sqlsession.getMapper(QnaMapper.class);
		int result=0;
		try {
			result=qnadao.deleteQnaComm(qnaComm.getQnaCommNum());
			qnadao.deleteQnaCommChild(qnaComm.getQnaCommNum());
		}catch(Exception e){
			throw e;			
		}
		return result;
	};

}
