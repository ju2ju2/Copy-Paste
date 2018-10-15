/*
* @ Class : MemberVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : MemberVO
*/
package tk.copyNpaste.vo;

public class MemberVO {
	//회원VO
	//이메일, 닉네임, 패스워드, 프로필사진파일명, 가입일자, 회원활성여부
	private String userEmail;
	private String userNick;
	private String userPwd;
	private String userPhoto;
	private String userDate;
	private String userEnabled;
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public String getUserEnabled() {
		return userEnabled;
	}
	public void setUserEnabled(String userEnabled) {
		this.userEnabled = userEnabled;
	}
	

}
