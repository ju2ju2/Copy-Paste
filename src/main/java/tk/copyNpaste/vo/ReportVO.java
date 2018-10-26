/*
* @ Class : ReportVO
* @ Date : 2018.10.19
* @ Author : 고은아
* @ Desc : ReportVO
*/
package tk.copyNpaste.vo;

import java.sql.Date;

public class ReportVO {

	private int reportNum;
	private String userEmail;
	private int noteNum;
	private String checkCode;
	private Date reportInDate;
	private String reportCauseCode;
	private String reportContent;
	private String reportmemo;
	private String noteOrCommCode;
	
	
	
	@Override
	public String toString() {
		return "ReportVO [reportNum=" + reportNum + ", userEmail=" + userEmail + ", noteNum=" + noteNum + ", checkCode="
				+ checkCode + ", reportInDate=" + reportInDate + ", reportCauseCode=" + reportCauseCode
				+ ", reportContent=" + reportContent + ", reportmemo=" + reportmemo + ", noteOrCommCode="
				+ noteOrCommCode + "]";
	}
	public int getReportNum() {
		return reportNum;
	}
	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
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
	public String getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public Date getReportInDate() {
		return reportInDate;
	}
	public void setReportInDate(Date reportInDate) {
		this.reportInDate = reportInDate;
	}
	public String getReportCauseCode() {
		return reportCauseCode;
	}
	public void setReportCauseCode(String reportCauseCode) {
		this.reportCauseCode = reportCauseCode;
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
	public String getNoteOrCommCode() {
		return noteOrCommCode;
	}
	public void setNoteOrCommCode(String noteOrCommCode) {
		this.noteOrCommCode = noteOrCommCode;
	}
	
	
}
