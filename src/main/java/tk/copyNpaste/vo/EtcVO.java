package tk.copyNpaste.vo;

import java.sql.Date;

/*
* @ Class : etcVO
* @ Date : 2018.10.18
* @ Author : 고은아
* @ Desc : 통계 처리를 위한 vo
*/
public class EtcVO {
	private String subjectxAxis;
	private int subjectyAxis;
	private String memberxAxis;
	private int memberyAxis;
	private String joinMemberxAxis;
	private int joinMemberyAxis;
	private String boundary;
	
	
	
	
	
	
	
	public String getBoundary() {
		return boundary;
	}
	public void setBoundary(String boundary) {
		this.boundary = boundary;
	}
	public String getSubjectxAxis() {
		return subjectxAxis;
	}
	public void setSubjectxAxis(String subjectxAxis) {
		this.subjectxAxis = subjectxAxis;
	}
	public int getSubjectyAxis() {
		return subjectyAxis;
	}
	public void setSubjectyAxis(int subjectyAxis) {
		this.subjectyAxis = subjectyAxis;
	}
	public String getMemberxAxis() {
		return memberxAxis;
	}
	public void setMemberxAxis(String memberxAxis) {
		this.memberxAxis = memberxAxis;
	}
	public int getMemberyAxis() {
		return memberyAxis;
	}
	public void setMemberyAxis(int memberyAxis) {
		this.memberyAxis = memberyAxis;
	}
	public String getJoinMemberxAxis() {
		return joinMemberxAxis;
	}
	public void setJoinMemberxAxis(String joinMemberxAxis) {
		this.joinMemberxAxis = joinMemberxAxis;
	}
	public int getJoinMemberyAxis() {
		return joinMemberyAxis;
	}
	public void setJoinMemberyAxis(int joinMemberyAxis) {
		this.joinMemberyAxis = joinMemberyAxis;
	} 
	
}
