/*
* @Class : FolderService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : FolderMapper 사용, 서비스처리.
* 
* @Class : FolderService
* @ Date : 2018.10.18
* @ Author : 임효진
* @ Desc : 회원가입 시 미분류/스크랩 폴더 생성 
*/
package tk.copyNpaste.folder;

import java.io.IOException;
import java.sql.SQLException;
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
	public List<FolderVO> selectAllFolder(String userEmail) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.selectAllFolder(userEmail);
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
	
	//회원 가입 시 기본폴더 추가
	public int insertFolderUserDefault(String userEmail) 
			throws IOException, ClassNotFoundException, SQLException {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.insertFolderUserDefault(userEmail);
	}
	
	
	//회원 가입 시 스크랩 폴더 추가
	public int insertFolderUserScrap(String userEmail) 
			throws IOException, ClassNotFoundException, SQLException {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.insertFolderUserScrap(userEmail);
	}
	
}
