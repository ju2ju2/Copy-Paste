/*
* @Class : DragService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : dao 사용, 업무수행.
*/
package tk.copyNpaste.drag;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.copyNpaste.mapper.DragMapper;
import tk.copyNpaste.vo.DragVO;
import tk.copyNpaste.vo.NoteVO;

@Service
public class DragService {
	 @Autowired
	 private SqlSession sqlsession;
	 
	//드래그 하기(등록)
	public int insertDrag(DragVO drag) throws Exception {	
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.insertDrag(drag);
	}

	//드래그 목록 보기
	public List<DragVO> selectAllDrag() throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		List<DragVO> dragList = dragdao.selectAllDrag();
		return dragList;
	}
	
	//드래그 상세 보기(+노트 작성)
	public DragVO selectDetail(int dragNum) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		DragVO dregdetail = dragdao.selectDetail(dragNum);
		return dregdetail;
	}
	
	//드래그 삭제
	public int deleteDrag(int dragNo) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.deleteDrag(dragNo);
	}
	
	//드래그 달력 검색
	public List<DragVO> selectByCalDrag(Date period) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return  dragdao.selectByCalDrag(period);
	}
	
	//드래그 키워드 검색
	public List<DragVO> selectByKeyDrag(String keyword) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.selectByKeyDrag(keyword);
	}
	
	//드래그 중요표시 등록
	public int setDragMark(int dragNo) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.setDragMark(dragNo);
	}
	
	//드래그 중요표시 삭제
	public int removeDragMark(int dragNo) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.removeDragMark(dragNo);
	}

}
