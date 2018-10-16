/*
* @Class : FolderController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 폴더 관련 컨트롤러. (service 사용, 뷰 매핑)
*/

package tk.copyNpaste.folder;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.vo.FolderVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/folder")
public class FolderController {
	 @Autowired
	FolderService folderService; 

	//폴더 목록 
	public void selectAllFolder() throws Exception {
		folderService.selectAllFolder();
	};
	
	//폴더 추가
	public void insertFolder(FolderVO folder) throws Exception {
		folderService.insertFolder(folder);
	};
		
	//폴더 수정
	public void updateFolder(FolderVO folder) throws Exception {
		folderService.updateFolder(folder);
	};
	
	//폴더 삭제
	public void deleteFolder(String folderName, String userEmail) throws Exception {
		folderService.deleteFolder(folderName, userEmail);
	};
	
	//기본폴더 지정
	public void setDefaultFolder(String folderName,String userEmail) throws Exception {
		folderService.setDefaultFolder(folderName, userEmail);
	};
	
	//기본폴더 해제
	public void removeDefaultFolder(String folderName,String userEmail) throws Exception {
		folderService.removeDefaultFolder(folderName, userEmail);
	};

	
	
}
