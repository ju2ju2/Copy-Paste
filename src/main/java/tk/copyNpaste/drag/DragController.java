/*
* @Class : DragController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 드래그 관련 컨트롤러. (service 사용, 뷰 매핑)
*/
package tk.copyNpaste.drag;

import java.util.Date;
import java.util.List;

import javax.swing.text.View;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.vo.DragVO;
import tk.copyNpaste.vo.NoteVO;

 //동기 컨트롤러. retrun>> ModelAndView or String.
//@RestController //비동기 컨트롤러. retrun>> json.
@Controller
@RequestMapping("/drag/")
public class DragController {
	@Autowired
	DragService dragservice;
	private Object dregdetail;

	//드래그 페이지
	@RequestMapping("drag.htm")
	public String selectAllDrag(Model model) throws Exception {
		List<DragVO> dragList = dragservice.selectAllDrag();
		model.addAttribute("dragList", dragList);
		return "drag.list";
     }

	//드래그 하기(등록)
	public void insertDrag(DragVO drag) throws Exception {
		dragservice.insertDrag(drag);
	}

	//드래그 전체목록 보기
	public void selectAllDrag(DragVO drag) throws Exception {
		
		dragservice.selectAllDrag();
	}
	
	//드래그 상세 보기(+노트 작성)
	public String selectDetail(int dragNum , Model model) throws Exception {
	    DragVO dregdetail = dragservice.selectDetail(dragNum);
		model.addAttribute("dregdetail", dregdetail);
		return "drag.list";
       
	}
	
	//드래그 삭제
	public void deleteDrag(int dragNo) throws Exception {
		dragservice.deleteDrag(dragNo);
	}
	
	//드래그 달력 검색
	public void selectByCalDrag(Date period) throws Exception {
		dragservice.selectByCalDrag(period);
	}
	
	//드래그 키워드 검색
	public void selectByKeyDrag(String keyword) throws Exception {
		dragservice.selectByKeyDrag(keyword);	
	}
	
	//드래그 중요표시 등록
	public void setDragMark(int dragNo) throws Exception {
		dragservice.setDragMark(dragNo);
	}
	
	//드래그 중요표시 삭제
	public void removeDragMark(int dragNo) throws Exception {
		dragservice.removeDragMark(dragNo);
	}

}
