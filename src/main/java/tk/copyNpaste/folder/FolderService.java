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
* 
* @Class : FolderService
* @ Date : 2018.10.23
* @ Author : 이주원
* @ Desc : 폴더 북마크 설정 시 토글기능 제공
*/
package tk.copyNpaste.folder;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		try {
			return folderdao.insertFolder(folder);
		}catch (Exception e) {
			System.out.println("에러" + e.getMessage());
			throw e;
		}
	}
	
	//폴더 수정 : 컨텐츠 有
	public int updateFolder(FolderVO folder) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		try {
			return folderdao.updateFolder(folder);
		}catch (Exception e) {
			System.out.println("에러" + e.getMessage());
			throw e;
		}
	}
	
	//폴더 수정 : 컨텐츠 無
	public int updateFolder2(FolderVO folder) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		try {
			return folderdao.updateFolder2(folder);
		}catch (Exception e) {
			System.out.println("에러" + e.getMessage());
			throw e;
		}
	}
	
	//폴더 삭제 : 컨텐츠 有
	public int deleteFolder(FolderVO folder) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.deleteFolder(folder);
	}
	
	//폴더 삭제 : 컨텐츠 無
	public int deleteFolder2(FolderVO folder) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.deleteFolder2(folder);
	}
	
	//기본폴더 지정
		@Transactional
		public void setDefaultFolder(FolderVO folder) throws Exception {
			FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
			try {
				folderdao.setDefaultFolder(folder); 
				folderdao.removeDefaultFolder(folder);
			}catch (Exception e) {
				System.out.println("에러" + e.getMessage());
				throw e;
			}
		}
	
	//기본폴더 해제
	public int removeDefaultFolder(FolderVO folder) throws Exception {
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		return folderdao.removeDefaultFolder(folder);
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
		return folderdao.insertFolderUserDefault(userEmail);
	}


	//폴더명 중복 검사
	public int checkFolderName(FolderVO folder) throws Exception{
		FolderMapper folderdao= sqlsession.getMapper(FolderMapper.class);
		int result = folderdao.checkFolderName(folder);
		return result;
	}
}
