/*
* @Class : FolderService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : FolderMapper 사용, 서비스처리.
*/
package tk.copyNpaste.folder;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.copyNpaste.mapper.EtcMapper;
import tk.copyNpaste.mapper.FolderMapper;
import tk.copyNpaste.vo.FolderVO;

@Service
public class FolderService {
	 @Autowired
	 private SqlSession sqlsession;
	
	//폴더 목록 
	public List<FolderVO> selectAllFolder() throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.selectAllFolder();
	}
	
	//폴더 추가
	public int insertFolder(FolderVO folder) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.insertFolder(folder);
	}
	
	//폴더 수정
	public int updateFolder(FolderVO folder) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.updateFolder(folder);
	}
	
	//폴더 삭제
	public int deleteFolder(String folderName,String userEmail) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.deleteFolder(folderName, userEmail);
		
	}
	
	//기본폴더 지정
	public int setDefaultFolder(String folderName,String userEmail) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.setDefaultFolder(folderName, userEmail);
		
	}
	
	//기본폴더 해제
	public int removeDefaultFolder(String folderName,String userEmail) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.removeDefaultFolder(folderName, userEmail);
	}



	
}