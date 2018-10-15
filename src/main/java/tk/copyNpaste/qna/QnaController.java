/*
* @Class : QnaController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : QNA 게시판 관련 컨트롤러. (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.qna;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.vo.QnaCommVO;
import tk.copyNpaste.vo.QnaVO;

@Controller
@RequestMapping(value = "/qna")
public class QnaController {
	QnaService qnaService = new QnaService();
	
	
	//QNA 게시물 조회
	public List<QnaVO> selectAllQna() throws Exception{
		return qnaService.selectAllQna();
	};
	
	//QNA 게시물 검색
	public List<QnaVO> selectSearchQna(String keyword) throws Exception{
		return qnaService.selectSearchQna(keyword);
	};
	
	//QNA 게시물 작성
	public int insertQna(QnaVO qna) throws Exception{
		return qnaService.insertQna(qna);
	};

	//QNA 게시물 상세보기
	public QnaVO selectDetailQna(int qnaNum) throws Exception{
		
		return qnaService.selectDetailQna(qnaNum);
	};
	
	//QNA 게시글 수정
	public int updateQna(int qnaNum) throws Exception{
		return qnaService.updateQna(qnaNum);
	};
	
	//QNA 게시글 삭제
	public int deleteQna(int qnaNum) throws Exception{
		return qnaService.deleteQna(qnaNum);
	};
	
	//QNA 댓글 작성
	public int insertQnaComm(QnaCommVO qnaComm) throws Exception{
		return qnaService.insertQnaComm(qnaComm);
	};
	
	//QNA 댓글 삭제
	public int deleteQnaComm(int qnaCommNum) throws Exception{
		return qnaService.deleteQnaComm(qnaCommNum);
	};

}
