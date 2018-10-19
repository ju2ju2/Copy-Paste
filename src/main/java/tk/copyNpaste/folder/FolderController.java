/*
* @Class : FolderController
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 폴더 관련 컨트롤러. (service 사용, 뷰 매핑)
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
		List<FolderVO> folderList= new ArrayList<FolderVO>(); 
		folderList = folderService.selectAllFolder(principal.getName());
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
	public void updateFolder(FolderVO folder) throws Exception {
		folderService.updateFolder(folder);
	};
	
	//폴더 삭제
	@RequestMapping(value="/deletefolder.json")
	public @ResponseBody void deleteFolder(FolderVO folder, Principal principal) throws Exception {
		folder.setUserEmail(principal.getName());
		folderService.deleteFolder(folder);
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
