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

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
			List<QnaCommVO> qnaCommList = qnaService.selectQnaComm(qnaNum);
			model.addAttribute("qnaCommList",qnaCommList);

			return "qna.selectDetailQna";
		};
	
	//QNA 게시물 검색
	public List<QnaVO> selectSearchQna(String keyword) throws Exception{
		return qnaService.selectSearchQna(keyword);
	};
	
	//QNA 게시물 작성
	@RequestMapping(value="/insertQnaboard.htm",method = RequestMethod.GET)
	public String insertQna() throws Exception{

		return "qna.insertQnaboard";
	}
	@RequestMapping(value="/insertQnaboard.htm", method = RequestMethod.POST)
	public String insertQna(HttpServletRequest request,HttpServletResponse response,QnaVO qna, Principal principal) throws Exception{
		System.out.println("작성 컨트롤러 진입");
		System.out.println("qnaSecret>>"+qna.getQnaSecret());
		System.out.println("qnaNotice>>"+qna.getQnaNotice());
		qna.setUserEmail(principal.getName());
		qnaService.insertQna(qna);
		System.out.println("작성 리턴받음");
		return "redirect:/qna/selectQnaboard.htm";
	}


	//QNA 게시글 수정
	public int updateQna(int qnaNum) throws Exception{
		return qnaService.updateQna(qnaNum);
	};
	
	//QNA 게시글 삭제
	public int deleteQna(int qnaNum) throws Exception{
		return qnaService.deleteQna(qnaNum);
	};
	
	
	/*비동기관련 컨트롤러*/
	//QNA댓글 작성
	@RequestMapping(value="/insertQnaComm.json")
	public @ResponseBody List<QnaCommVO> insertQnaComm(QnaCommVO qnaComm,Principal principal) throws Exception{
		List<QnaCommVO> qnaCommList = new ArrayList<>();
		qnaComm.setUserEmail(principal.getName());
		qnaCommList = qnaService.insertQnaComm(qnaComm);


		return qnaCommList;
	};
	//QNA대댓글 작성
	@RequestMapping(value="/insertQnaCommComm.json")
	public @ResponseBody List<QnaCommVO> insertQnaCommComm(QnaCommVO qnaComm,Principal principal) throws Exception{
		List<QnaCommVO> qnaCommList = new ArrayList<>();
		qnaComm.setUserEmail(principal.getName());
		qnaCommList = qnaService.insertQnaCommComm(qnaComm);
			
		return qnaCommList;
	};
	
	//QNA 댓글 삭제
	@RequestMapping(value="/deleteQnaComm.json")
	public @ResponseBody void deleteQnaComm(QnaCommVO qnaComm) throws Exception{
		qnaService.deleteQnaComm(qnaComm);
	};

}
