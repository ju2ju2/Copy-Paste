/*
* @ Class : NoteCommVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : NoteCommVO
*/
package tk.copyNpaste.vo;

import java.util.Date;

public class NoteCommVO {
	//NoteCommVO
	//노트 댓글
	//회원이메일,댓글번호,부모댓글번호,댓글작성일,댓글내용,댓글깊이,노트번호,
	private int noteCommNum;
	private String userEmail;
	private int noteNum;
	private int commDept;
	private int commContent;
	private Date commDate;
	private int noteCommPNum;
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
	public int getCommContent() {
		return commContent;
	}
	public void setCommContent(int commContent) {
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


	
}
