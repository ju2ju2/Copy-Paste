package tk.copyNpaste.vo;

public class noticeVO {
	String userEmail;
	String notifyCode;
	int notifyTarget;
	int readCheck;
	String notifyTitle;
	
	
	
	
	public String getNotifyTitle() {
		return notifyTitle;
	}
	public void setNotifyTitle(String notifyTitle) {
		this.notifyTitle = notifyTitle;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getNotifyCode() {
		return notifyCode;
	}
	public void setNotifyCode(String notifyCode) {
		this.notifyCode = notifyCode;
	}
	public int getNotifyTarget() {
		return notifyTarget;
	}
	public void setNotifyTarget(int notifyTarget) {
		this.notifyTarget = notifyTarget;
	}
	public int getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(int readCheck) {
		this.readCheck = readCheck;
	}
	
	

}
