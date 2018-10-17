/*
* @ Class : NoteVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : NoteVO
*/
package tk.copyNpaste.vo;

import java.sql.Date;

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
	private int noteCount;
	private int notePublic;
	private int noteScrap;
	private int notePNum;

	
	//List<String> FileName; tinymce에서 이미지를 같이 포함해서 컨텐츠로 넘김.
	
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


	
	
}