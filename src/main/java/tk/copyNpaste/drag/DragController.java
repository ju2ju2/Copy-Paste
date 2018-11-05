/*
* @Class : DragController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 드래그 관련 컨트롤러. (service 사용, 뷰 매핑)
*/
package tk.copyNpaste.drag;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

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

	//드래그 전체목록 보기 (비동기/글작성페이지)
	@RequestMapping(value ="selectAllDrag.json")
	public @ResponseBody List<DragVO> selectAllDrag(Model model, String page,Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("userEmail", principal.getName());	
		List<DragVO> dragList = dragservice.selectAllDrag(map);
		return dragList;
	}

	
	//드래그 페이지
	@RequestMapping(value ="drag.htm")
	public String dragpage(Model model ,Principal principal,DragVO drag) throws Exception {
		drag.setUserEmail(principal.getName());
		
		return "drag.list";
     }

	//드래그 하기(등록)
	@RequestMapping("insertDrag.json")
	public @ResponseBody int insertDrag(DragVO drag,Principal principal) throws Exception {
		drag.setUserEmail(principal.getName());
		return dragservice.insertDrag(drag);
	}


	
	//드래그 상세 보기(+노트 작성)
	@RequestMapping(value="dragDetail.htm")
	public String selectDetail(int dragNum , Model model) throws Exception {
		DragVO dragList = dragservice.selectDetail(dragNum);
		model.addAttribute("dragList", dragList);
		
		return "dragdetail";//(modal/dragdetail.jsp)
	}
		

	//드래그 삭제
	@RequestMapping(value="deleteDrag.json")
	public @ResponseBody int deleteDrag(int dragNum) throws Exception {
		return dragservice.deleteDrag(dragNum);
	}
	
	//드래그 달력 검색
	@RequestMapping(value="selectByCalDrag.json")
	public @ResponseBody List<DragVO> selectByCalDrag(String fromDate, String page,String toDate, Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fromDate", fromDate);
		map.put("toDate", toDate);
		map.put("page", page);
		map.put("userEmail", principal.getName());
		return dragservice.selectByCalDrag(map);
	}

	//드래그 키워드 검색 dragSearch.json
	@RequestMapping(value="selectByKeyDrag.json")
	public @ResponseBody List<DragVO> selectByKeyDrag(String keyword,String page,Principal principal,Model model ) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("userEmail", principal.getName());
		map.put("page", page);

		return dragservice.selectByKeyDrag(map);	
	}
	
	// 드래그 정렬
		@RequestMapping(value="selectOrderbyDrag.json")
		public @ResponseBody List<DragVO> selectOrderbyNote(String sortCategory,String page,Principal principal,Model model ) throws Exception {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sortCategory", sortCategory);
			map.put("page", page);
			map.put("userEmail", principal.getName());
			List<DragVO> dragList = dragservice.selectOrderbyDrag(map);   
			return dragList;
		}
			

	//드래그 중요표시 등록
	@RequestMapping(value="setDragMark.json")
	public  @ResponseBody List<DragVO>  setDragMark(DragVO drag,String page,Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dragNum", drag.getDragNum());
		map.put("userEmail", principal.getName());	
		map.put("page", page);
		dragservice.setDragMark(map);
		return dragservice.selectAllDrag(map);
	}
	
	//드래그 중요표시 삭제
	@RequestMapping(value="removeDragMark.json")
	public @ResponseBody List<DragVO>  removeDragMark(DragVO drag,String page,Principal principal) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dragNum", drag.getDragNum());
		map.put("userEmail", principal.getName());	
		map.put("page", page);
		dragservice.removeDragMark(map);
		return  dragservice.selectAllDrag(map);
	}

}
