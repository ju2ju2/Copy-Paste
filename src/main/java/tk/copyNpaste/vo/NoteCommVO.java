/*
* @ Class : NoteCommVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : NoteCommVO
*/
package tk.copyNpaste.vo;

import java.sql.Date;

public class NoteCommVO {
	//NoteCommVO
	//노트 댓글
	//회원이메일,댓글번호,부모댓글번호,댓글작성일,댓글내용,댓글깊이,노트번호,
	private int noteCommNum;
	private String userEmail;
	private String userNick;
	private int noteNum;
	private int commDept;
	private String commContent;
	private Date commDate;
	private int noteCommPNum;
	private String userPhoto;
	private int noteCommPos;
	private String sortCategory;
	private int num;
	private int noteCommBlind;
	
	
	public int getNoteCommNum() {
		return noteCommNum;
	}
	public void setNoteCommNum(int noteCommNum) {
		this.noteCommNum = noteCommNum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getNoteNum() {
		return noteNum;
	}
	public void setNoteNum(int noteNum) {
		this.noteNum = noteNum;
	}
	public int getCommDept() {
		return commDept;
	}
	public void setCommDept(int commDept) {
		this.commDept = commDept;
	}
	public String getCommContent() {
		return commContent;
	}
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}
	public Date getCommDate() {
		return commDate;
	}
	public void setCommDate(Date commDate) {
		this.commDate = commDate;
	}
	public int getNoteCommPNum() {
		return noteCommPNum;
	}
	public void setNoteCommPNum(int noteCommPNum) {
		this.noteCommPNum = noteCommPNum;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	
	public int getNoteCommPos() {
		return noteCommPos;
	}
	public void setNoteCommPos(int noteCommPos) {
		this.noteCommPos = noteCommPos;
	}
	
	public String getSortCategory() {
		return sortCategory;
	}
	public void setSortCategory(String sortCategory) {
		this.sortCategory = sortCategory;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	public int getNoteCommBlind() {
		return noteCommBlind;
	}
	public void setNoteCommBlind(int noteCommBlind) {
		this.noteCommBlind = noteCommBlind;
	}
	@Override
	public String toString() {
		return "NoteCommVO [noteCommNum=" + noteCommNum + ", userEmail=" + userEmail + ", userNick=" + userNick
				+ ", noteNum=" + noteNum + ", commDept=" + commDept + ", commContent=" + commContent + ", commDate="
				+ commDate + ", noteCommPNum=" + noteCommPNum + ", userPhoto=" + userPhoto + ", noteCommPos="
				+ noteCommPos + ", sortCategory=" + sortCategory + ", num=" + num + ", noteCommBlind=" + noteCommBlind
				+ "]";
	}




	
}
