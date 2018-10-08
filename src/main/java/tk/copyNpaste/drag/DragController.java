/*
* @Class : DragController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 드래그 관련 컨트롤러. (service 사용, 뷰 매핑)
*/
package tk.copyNpaste.drag;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;/*

import kr.co.mlec.drag.service.DragService;
import kr.co.mlec.repository.vo.DragVO;
import kr.co.mlec.repository.vo.NoteVO;*/

import tk.copyNpaste.vo.DragVO;

//@Controller //동기 컨트롤러. retrun>> ModelAndView or String.
@RestController //비동기 컨트롤러. retrun>> json.
@RequestMapping("/drag/")
public class DragController {
	
	DragService dragservice = new DragService();

	
	//드래그 하기(등록)
	public void insertDrag(DragVO drag) throws Exception {
		dragservice.insertDrag(drag);
	}

	//드래그 목록 보기
	public void selectAllDrag(DragVO drag) throws Exception {
		dragservice.selectAllDrag(drag);
	}
	
	//드래그 상세 보기(+노트 작성)
	public void selectDetail(int dragNo) throws Exception {
		dragservice.selectDetail(dragNo);
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
