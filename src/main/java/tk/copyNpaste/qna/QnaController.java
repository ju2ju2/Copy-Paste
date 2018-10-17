/*
* @Class : QnaController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : QNA 게시판 관련 컨트롤러. (service 사용, 뷰 매핑)
* @Class : QnaController
* @ Date : 2018.10.16
* @ Author : 임지현
* @ Desc : Back단 코딩
*/

package tk.copyNpaste.qna;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tk.copyNpaste.mapper.QnaMapper;
import tk.copyNpaste.vo.QnaCommVO;
import tk.copyNpaste.vo.QnaVO;

@Controller
@RequestMapping(value = "/qna")
public class QnaController {
	
	@Autowired
	QnaService qnaService;

	//QNA 게시물 조회
	@RequestMapping(value="/selectQnaboard.htm",method = RequestMethod.GET)
	public String selectAllQnaboard(Model model) throws Exception {
		List<QnaVO> qnaList= new ArrayList<QnaVO>(); 
		qnaList = qnaService.selectAllQna();
		model.addAttribute("qnaList",qnaList);

		return "qna.selectQnaboard";
	}
	
	//QNA 게시물 상세보기
		@RequestMapping(value="/selectDetailQna.htm",method = RequestMethod.GET)
		public String selectDetailQna(int qnaNum, Model model) throws Exception{
			QnaVO qna = qnaService.selectDetailQna(qnaNum);
			model.addAttribute("qna",qna);

			return "qna.selectDetailQna";
		};
	
	//QNA 게시물 검색
	public List<QnaVO> selectSearchQna(String keyword) throws Exception{
		return qnaService.selectSearchQna(keyword);
	};
	
	//QNA 게시물 작성
	@RequestMapping(value="/insertQnaboard.htm",method = RequestMethod.GET)
	public String insertQnaboard() {
		return "qna.insertQnaboard";
	}
	public int insertQna(QnaVO qna) throws Exception{
		return qnaService.insertQna(qna);
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