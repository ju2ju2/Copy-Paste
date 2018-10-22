/*
* @Class : DragController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 드래그 관련 컨트롤러. (service 사용, 뷰 매핑)
*/
package tk.copyNpaste.drag;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.copyNpaste.vo.DragVO;

 //동기 컨트롤러. retrun>> ModelAndView or String.
//@RestController //비동기 컨트롤러. retrun>> json.
@Controller
@RequestMapping("/drag/")
public class DragController {
	@Autowired
	DragService dragservice;


	//드래그 페이지
	@RequestMapping("drag.htm")
	public String selectAllDrag(Model model ,Principal principal) throws Exception {
        String userEmail= principal.getName();
		List<DragVO> dragList = dragservice.selectAllDrag(userEmail);
		model.addAttribute("dragList", dragList);
		return "drag.list";
     }

	//드래그 하기(등록)
	@RequestMapping("insertDrag.json")
	public @ResponseBody int insertDrag(DragVO drag,Principal principal) throws Exception {
		drag.setUserEmail(principal.getName());
		return dragservice.insertDrag(drag);
	}

	//드래그 전체목록 보기 (비동기/글작성페이지)
	@RequestMapping("selectAllDrag.json")
	public @ResponseBody List<DragVO> selectAllDrag(DragVO drag,Principal principal) throws Exception {
		String userEmail= principal.getName();
		return dragservice.selectAllDrag(userEmail);
	}
	
	
	//드래그 상세 보기(+노트 작성)
	@RequestMapping(value="dragDetail.htm")
	public String selectDetail(int dragNum , Model model) throws Exception {
		DragVO dragList = dragservice.selectDetail(dragNum);
		model.addAttribute("dragList", dragList);
		return "dragdetail";//(modal/dragdetail.jsp)
	}
		

	//드래그 삭제
	public void deleteDrag(int dragNum) throws Exception {
		dragservice.deleteDrag(dragNum);
	}
	
	//드래그 달력 검색
	public void selectByCalDrag(Date period) throws Exception {
		dragservice.selectByCalDrag(period);
	}
	
	
/*	//드래그 키워드 검색 dragSearch.json
	@RequestMapping(value="dragSearch.json")
	public @ResponseBody List<DragVO>  selectByKeyDrag(String keyword , Model model) throws Exception {
		List<DragVO> dragList = dragservice.selectByKeyDrag(keyword);
		model.addAttribute("dragList", dragList);
		return ;*/
	
	//드래그 중요표시 등록
	public void setDragMark(int dragNum) throws Exception {
		dragservice.setDragMark(dragNum);
	}
	
	//드래그 중요표시 삭제
	public void removeDragMark(int dragNo) throws Exception {
		dragservice.removeDragMark(dragNo);
	}

}
