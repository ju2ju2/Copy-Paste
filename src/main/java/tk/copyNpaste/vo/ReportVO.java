/*
* @ Class : ReportVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : ReportVO
*/
package tk.copyNpaste.vo;

import java.util.Date;

public class ReportVO {
	//ReportVO
	//신고게시판글번호,신고한회원이메일,노트or댓글번호,신고처리상태코드,
	//신고일,처리일,신고사유코드,신고내용,메모,노트댓글여부코드
	
	private int reportNum;
	private int noteNum;
	private int checkCode;
	private int reportCauseCode;
	private int noteOrCommCod;
	private String userEmail;
	private String reportContent;
	private String reportmemo;
	private Date reportInDate;
	private Date reportHandleDate;
	
	public int getReportNum() {
		return reportNum;
	}
	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}
	public int getNoteNum() {
		return noteNum;
	}
	public void setNoteNum(int noteNum) {
		this.noteNum = noteNum;
	}
	public int getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(int checkCode) {
		this.checkCode = checkCode;
	}
	public int getReportCauseCode() {
		return reportCauseCode;
	}
	public void setReportCauseCode(int reportCauseCode) {
		this.reportCauseCode = reportCauseCode;
	}
	public int getNoteOrCommCod() {
		return noteOrCommCod;
	}
	public void setNoteOrCommCod(int noteOrCommCod) {
		this.noteOrCommCod = noteOrCommCod;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportmemo() {
		return reportmemo;
	}
	public void setReportmemo(String reportmemo) {
		this.reportmemo = reportmemo;
	}
	public Date getReportInDate() {
		return reportInDate;
	}
	public void setReportInDate(Date reportInDate) {
		this.reportInDate = reportInDate;
	}
	public Date getReportHandleDate() {
		return reportHandleDate;
	}
	public void setReportHandleDate(Date reportHandleDate) {
		this.reportHandleDate = reportHandleDate;
	}
	
	
	
}
