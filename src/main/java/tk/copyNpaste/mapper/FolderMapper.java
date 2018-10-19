/*
* @ Class : FolderMapper
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : FolderMapper-DAO
*/
package tk.copyNpaste.mapper;

import java.util.List;

import tk.copyNpaste.vo.FolderVO;

public interface FolderMapper {

	//폴더 목록 
	public List<FolderVO> selectAllFolder(String userEmail) throws Exception;
	
	//폴더 추가
	public int insertFolder(FolderVO folder) throws Exception;
		
	//폴더 수정
	public int updateFolder(FolderVO folder) throws Exception;
	
	//폴더 삭제
	public int deleteFolder(FolderVO folder) throws Exception;
	
	//기본폴더 지정
	public int setDefaultFolder(String folderName,String userEmail) throws Exception;
	
	//기본폴더 해제
	public int removeDefaultFolder(String folderName,String userEmail) throws Exception;
	
	//회원 가입 시 기본폴더 추가
	public int insertFolderUserDefault(String userEmail) throws Exception;
	
	//회원 가입 시 스크랩 폴더 추가
	public int insertFolderUserScrap(String userEmail) throws Exception;



}
