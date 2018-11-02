/*
* @Class : DragService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : dao 사용, 업무수행.
* 
*  @Class : DragService
* @ Date : 2018.10.24
* @ Author : 문지은
* @ Desc : 드래그 목록, 상세보기, 삭제, 키워드 검색
*/
package tk.copyNpaste.drag;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.copyNpaste.mapper.DragMapper;
import tk.copyNpaste.vo.DragVO;


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
	public List<DragVO> selectAllDrag(DragVO drag) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		List<DragVO> dragList = dragdao.selectAllDrag(drag);
		return dragList;
	}
	
/*	//드래그 스크롤 목록 더 보기
		public List<DragVO> infiniteScrollDrag(DragVO drag) throws Exception {
			DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
			List<DragVO> dragList = dragdao.infiniteScrollDrag(drag);
			return dragList;
		}*/
	
	
	//드래그 상세 보기(+노트 작성)
	public DragVO selectDetail(int dragNum) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		DragVO dragList = dragdao.selectDetail(dragNum);
		return dragList;
	}
	
	//드래그 삭제
	public int deleteDrag(int dragNum) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.deleteDrag(dragNum);
	}

	//드래그 달력 검색
	public List<DragVO> selectByCalDrag(HashMap<String, Object> map) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		List<DragVO> dragList = dragdao.selectByCalDrag(map);
		return  dragList;
	}
	
	//드래그 키워드 검색
	public List<DragVO> selectByKeyDrag(HashMap<String, Object> map) throws Exception {
		List<DragVO> list = new ArrayList<DragVO>();
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.selectByKeyDrag(map);
	}
	
	//드래그 정렬
	public List<DragVO> selectOrderbyDrag(HashMap<String, Object> map) throws Exception{
		DragMapper dragdao = sqlsession.getMapper(DragMapper.class);
		return dragdao.selectOrderbyDrag(map);
		}
	//드래그 중요표시 등록
	public int setDragMark(int dragNum) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.setDragMark(dragNum);
	}
	
	//드래그 중요표시 삭제
	public int removeDragMark(int dragNum) throws Exception {
		DragMapper dragdao= sqlsession.getMapper(DragMapper.class);
		return dragdao.removeDragMark(dragNum);
	}


}
