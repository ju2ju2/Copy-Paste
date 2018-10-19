/*
* @ Class : FolderVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : FolderVO
*/
package tk.copyNpaste.vo;

public class FolderVO {
	//폴더VO
	//폴더이름,회원이메일,기본폴더여부,삭제가능여부
	private String folderName;
	private String userEmail;
	private String defaultFolder;
	private String canDelete;
	private String beforefolderName;

	public String getFolderName() {
		return folderName;
	}
	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getDefaultFolder() {
		return defaultFolder;
	}
	public void setDefaultFolder(String defaultFolder) {
		this.defaultFolder = defaultFolder;
	}
	public String getCanDelete() {
		return canDelete;
	}
	public void setCanDelete(String canDelete) {
		this.canDelete = canDelete;
	}
	public String getBeforefolderName() {
		return beforefolderName;
	}
	public void setBeforefolderName(String beforefolderName) {
		this.beforefolderName = beforefolderName;
	}



}
