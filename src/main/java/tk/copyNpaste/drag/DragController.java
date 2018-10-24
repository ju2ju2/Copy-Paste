/*
* @Class : DragController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 드래그 관련 컨트롤러. (service 사용, 뷰 매핑)
*/
package tk.copyNpaste.drag;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.copyNpaste.vo.DragVO;
import tk.copyNpaste.vo.NoteVO;


 //동기 컨트롤러. retrun>> ModelAndView or String.
//@RestController //비동기 컨트롤러. retrun>> json.
@Controller
@RequestMapping("/drag/")
public class DragController {
	@Autowired
	DragService dragservice;


	//드래그 전체목록 보기 (비동기/글작성페이지)
	@RequestMapping(value ="selectAllDrag.json")
	public @ResponseBody List<DragVO> selectAllDrag(Model model,Principal principal) throws Exception {
		 String userEmail= principal.getName();
	/*	 List<DragVO> dragList =  dragservice.selectAllDrag(userEmail);
		 model.addAttribute("dragList", dragList);*/
		return dragservice.selectAllDrag(userEmail);
	}
	
	
	//드래그 페이지
	@RequestMapping(value ="drag.htm")
	public String dragpage(Model model ,Principal principal) throws Exception {
	  String userEmail= principal.getName();
		List<DragVO> dragList =  dragservice.selectAllDrag(userEmail);
		model.addAttribute("dragList", dragList);
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
	
		System.out.println("삭제 컨트롤러");
		return dragservice.deleteDrag(dragNum);
	}
	
	//드래그 달력 검색
	public void selectByCalDrag(Date period) throws Exception {
		dragservice.selectByCalDrag(period);
	}
	
	
/*	//드래그 키워드 검색 dragSearch.json
	@RequestMapping(value="selectByKeyDrag.json")
	public  String  selectByKeyDrag(String keyword,Principal principal,Model model ) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("userEmail", principal.getName());
		List<DragVO> dragList= dragservice.selectByKeyDrag(map);	
		model.addAttribute("dragList", dragList);
		System.out.println("키워드 검색");
		return "makeDragList";
	}
	*/
	
	//드래그 키워드 검색 dragSearch.json
	@RequestMapping(value="selectByKeyDrag.json")
	public @ResponseBody List<DragVO> selectByKeyDrag(String keyword,Principal principal,Model model ) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("userEmail", principal.getName());
	
		return dragservice.selectByKeyDrag(map);	
	}
	
	// 드래그 정렬
		@RequestMapping(value="selectOrderbyDrag.json")
		public @ResponseBody List<DragVO> selectOrderbyNote(String sortCategory,Principal principal,Model model ) throws Exception {
			
			String sortCategory1 = sortCategory;
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sortCategory", sortCategory);
			map.put("userEmail", principal.getName());
		
			List<DragVO> dragList ;   
			if(sortCategory.trim().equals("dragDateDesc")) {
				dragList= dragservice.selectOrderbyDrag1(map);
				System.out.println("드래그 최신순 정렬");
			}else if(sortCategory.trim().equals("dragDateAsc")){
				dragList= dragservice.selectOrderbyDrag2(map);
				System.out.println("드래그 오래된순 정렬");
			}else if(sortCategory.trim().equals("dragMark")) {
				dragList= dragservice.selectOrderbyDrag3(map);
				System.out.println("드래그 중요표시 정렬");
			}else if(sortCategory.trim().equals("dragText")) {
					dragList= dragservice.selectOrderbyDrag4(map);
					System.out.println("드래그 가나다순 정렬");
			}else {
				dragList= dragservice.selectOrderbyDrag5(map);
				System.out.println("드래그 전체보기");
			}
			return dragList;
		}
			

	//드래그 중요표시 등록
	@RequestMapping(value="setDragMark.json")
	public  @ResponseBody int setDragMark(int dragNum) throws Exception {
			return dragservice.setDragMark(dragNum);
	}
	
	//드래그 중요표시 삭제
	@RequestMapping(value="removeDragMark.json")
	public @ResponseBody int removeDragMark(int dragNum) throws Exception {
		return  dragservice.removeDragMark(dragNum);
	}

}
