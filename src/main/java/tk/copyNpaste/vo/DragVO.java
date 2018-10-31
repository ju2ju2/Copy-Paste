/*
* @ Class : DragVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : DragVO
*/
package tk.copyNpaste.vo;

import java.sql.Date;

public class DragVO {
	//드래그VO
	//드래그번호, 중요표시, 회원이메일, 드래그내용,드래그출처,드래그일자
	private int dragNum;
	private int dragMark;
	private String userEmail;
	private String dragText;
	private String dragOrigin;
	private Date dragDate;
	private String dragOriginLink;
	private int page;
	private int endpage;
	private int minNum;

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	
	public String getDragOriginLink() {
		return dragOriginLink;
	}
	public void setDragOriginLink(String dragOriginLink) {
		this.dragOriginLink = dragOriginLink;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getDragNum() {
		return dragNum;
	}
	public void setDragNum(int dragNum) {
		this.dragNum = dragNum;
	}
	public String getDragText() {
		return dragText;
	}
	public void setDragText(String dragText) {
		this.dragText = dragText;
	}
	public String getDragOrigin() {
		return dragOrigin;
	}
	public void setDragOrigin(String dragOrigin) {
		this.dragOrigin = dragOrigin;
	}
	public Date getDragDate() {
		return dragDate;
	}
	public void setDragDate(Date dragDate) {
		this.dragDate = dragDate;
	}
	public int getDragMark() {
		return dragMark;
	}
	public void setDragMark(int dragMark) {
		this.dragMark = dragMark;
	}
	public int getMinNum() {
		return minNum;
	}
	public void setMinNum(int minNum) {
		this.minNum = minNum;
	}
	@Override
	public String toString() {
		return "DragVO [dragNum=" + dragNum + ", dragMark=" + dragMark + ", userEmail=" + userEmail + ", dragText="
				+ dragText + ", dragOrigin=" + dragOrigin + ", dragDate=" + dragDate + ", dragOriginLink="
				+ dragOriginLink + ", page=" + page + ", endpage=" + endpage + ", minNum=" + minNum + "]";
	}

	

}
