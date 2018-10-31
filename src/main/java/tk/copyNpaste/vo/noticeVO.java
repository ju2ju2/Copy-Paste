package tk.copyNpaste.vo;

public class noticeVO {
	String userEmail;
	String notifyCode;
	int notifyTarget;
	int readCheck;
	
	
	
	@Override
	public String toString() {
		return "noticeVO [userEmail=" + userEmail + ", notifyCode=" + notifyCode + ", notifyTarget=" + notifyTarget
				+ ", readCheck=" + readCheck + "]";
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
