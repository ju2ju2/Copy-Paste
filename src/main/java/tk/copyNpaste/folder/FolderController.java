/*
* @Class : FolderController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 폴더 관련 컨트롤러. (service 사용, 뷰 매핑)
* 
* @Class : FolderService
* @ Date : 2018.10.23
* @ Author : 이주원
* @ Desc : 폴더 북마크 설정 시 토글기능 제공
*/

package tk.copyNpaste.folder;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tk.copyNpaste.vo.FolderVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/folder")
public class FolderController {
	@Autowired
	private SqlSession sqlsession; 
	
	@Autowired
	FolderService folderService; 

	//비동기 폴더 목록 조회
	@RequestMapping(value="/selectAllFolder.json")
	public @ResponseBody List<FolderVO> selectAllFolder(Model model,Principal principal) throws Exception {
		List<FolderVO> folderList = folderService.selectAllFolder(principal.getName());
		model.addAttribute("folderList", folderList);
		return folderList;
	};
	
	//폴더 추가
	@RequestMapping(value="/insertfolder.json")
	public @ResponseBody void insertFolder(FolderVO folder, Principal principal) throws Exception {
		folder.setUserEmail(principal.getName());
		folderService.insertFolder(folder);
	};
		
	//폴더 수정
	@RequestMapping(value="/updatefolder.json")
	public @ResponseBody void updateFolder(FolderVO folder, Principal principal) throws Exception {
		folder.setUserEmail(principal.getName());
		int count = folder.getCount();
		if(count > 0) {
			folderService.updateFolder(folder);
		}else {
			folderService.updateFolder2(folder);
		}
		
	};
	
	//폴더 삭제
	@RequestMapping(value="/deletefolder.json")
	public @ResponseBody void deleteFolder(FolderVO folder, Principal principal) throws Exception {
		folder.setUserEmail(principal.getName());
		int count = folder.getCount();
		if(count > 0) {
			folderService.deleteFolder(folder);
		}else{
			folderService.deleteFolder2(folder);
		}
		
		folderService.deleteFolder(folder);
	};
	
	//기본폴더 지정
	@RequestMapping(value="/setDefaultFolder.json")
	public @ResponseBody void setDefaultFolder(FolderVO folder, Principal principal) throws Exception {
		folder.setUserEmail(principal.getName());
		folderService.setDefaultFolder(folder);
	};
	
	
	
	//기본폴더 해제
	@RequestMapping(value="/removeDefaultFolder.json")
	public void removeDefaultFolder(FolderVO folder, Principal principal) throws Exception {
		folder.setUserEmail(principal.getName());
		folderService.removeDefaultFolder(folder);
	};

	
	// 폴더이름 중복 확인
	@RequestMapping(value="/checkFolderName.json", method = RequestMethod.POST)
	public @ResponseBody int checkFolderName(FolderVO folder, Principal principal) throws Exception {
		folder.setUserEmail(principal.getName());
		int result = folderService.checkFolderName(folder);
		return result;
	}
	
}
