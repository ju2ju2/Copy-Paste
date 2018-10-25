/*
* @ Class : NoteVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : NoteVO
*/
package tk.copyNpaste.vo;

import java.sql.Date;

/**
 * @author bit
 *
 */
public class NoteVO {
	//NoteVO
	
	//노트
	//노트번호,폴더명,회원이메일,노트제목,노트내용,작성일,주제코드,참조카운트,
	//글공개여부,스크랩,부모노트번호,신고카운트
	private int noteNum;
	private String folderName;
	private String userEmail;
	private String userNick;
	private String noteTitle;
	private String noteContent;	
	private Date noteDate;
	private String subjectCode;
	private String subjectName;
	private int noteCount;
	private int notePublic;
	private int noteScrap;
	private int notePNum;
	private String noteThumnail;
	private int noteCommBlind;
	private int newNoteNum;
	private Date fromDate;
	private Date toDate;

	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public int getNoteNum() {
		return noteNum;
	}
	public void setNoteNum(int noteNum) {
		this.noteNum = noteNum;
	}
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
	public String getNoteTitle() {
		return noteTitle;
	}
	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}
	public String getNoteContent() {
		return noteContent;
	}
	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	public Date getNoteDate() {
		return noteDate;
	}
	public void setNoteDate(Date noteDate) {
		this.noteDate = noteDate;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public int getNoteCount() {
		return noteCount;
	}
	public void setNoteCount(int noteCount) {
		this.noteCount = noteCount;
	}
	public int getNotePublic() {
		return notePublic;
	}
	public void setNotePublic(int notePublic) {
		this.notePublic = notePublic;
	}
	public int getNoteScrap() {
		return noteScrap;
	}
	public void setNoteScrap(int notescrap) {
		this.noteScrap = notescrap;
	}
	public int getNotePNum() {
		return notePNum;
	}
	public void setNotePNum(int notePNum) {
		this.notePNum = notePNum;
	}
	
	public String getNoteThumnail() {
		return noteThumnail;
	}
	public void setNoteThumnail(String noteThumnail) {
		this.noteThumnail = noteThumnail;
	}
	
	public int getNoteCommBlind() {
		return noteCommBlind;
	}
	public void setNoteCommBlind(int noteCommBlind) {
		this.noteCommBlind = noteCommBlind;
		}
		
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	
	public int getNewNoteNum() {
		return newNoteNum;
	}
	public void setNewNoteNum(int newNoteNum) {
		this.newNoteNum = newNoteNum;
	}
	@Override
	public String toString() {
		return "NoteVO [noteNum=" + noteNum + ", folderName=" + folderName + ", userEmail=" + userEmail + ", userNick="
				+ userNick + ", noteTitle=" + noteTitle + ", noteContent=" + noteContent + ", noteDate=" + noteDate
				+ ", subjectCode=" + subjectCode + ", subjectName=" + subjectName + ", noteCount=" + noteCount
				+ ", notePublic=" + notePublic + ", noteScrap=" + noteScrap + ", notePNum=" + notePNum
				+ ", noteThumnail=" + noteThumnail + ", noteCommBlind=" + noteCommBlind + ", newNoteNum=" + newNoteNum
				+ "]";
	}




}
