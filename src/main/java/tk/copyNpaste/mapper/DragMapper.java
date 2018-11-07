/*
* @ Class : DragMapper
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : DragMapper-DAO
*/
package tk.copyNpaste.mapper;


import java.util.HashMap;
import java.util.List;
import tk.copyNpaste.vo.DragVO;


public interface DragMapper {


	//드래그 하기(등록)
	public int insertDrag(DragVO drag) throws Exception;
	
	//드래그 목록 보기
	public List<DragVO> selectAllDrag(HashMap<String, Object> map) throws Exception;
	
	//드래그 상세 보기(+노트 작성)
	public DragVO selectDetail(int dragNum) throws Exception;
	
	//드래그 삭제
	public int deleteDrag(int dragNum) throws Exception;
	
	//드래그 달력 검색
	public List<DragVO> selectByCalDrag(HashMap<String, Object> map) throws Exception;
		
	//드래그 키워드 검색
	public List<DragVO> selectByKeyDrag(HashMap<String, Object> map) throws Exception;
	
	//드래그 정렬 
	public List<DragVO> selectOrderbyDrag(HashMap<String, Object> map) throws Exception;

	//드래그 중요표시 등록
	public int setDragMark(HashMap<String, Object> map) throws Exception;
	
	//드래그 중요표시 삭제
	public int removeDragMark(HashMap<String, Object> map) throws Exception;

	
}
