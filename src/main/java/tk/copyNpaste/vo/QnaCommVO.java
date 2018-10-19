/*
* @ Class : QnaCommVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : QnaCommVO
*/
package tk.copyNpaste.vo;

public class QnaCommVO {
	//댓글 
		//QnA댓글번호,댓글내용,댓글작성일,댓글깊이,부모댓글번호,회원이메일,QnA번호
		private int qnaCommNum;
		private int qnaNum;
		private String userEmail;
		private String qnaCommContent;
		private String qnaCommDate;
		private int qnaCommDept;
		private int qnaCommPNum;
		private String userNick;
		
		
		public String getUserNick() {
			return userNick;
		}
		public void setUserNick(String userNick) {
			this.userNick = userNick;
		}
		public int getQnaCommNum() {
			return qnaCommNum;
		}
		public void setQnaCommNum(int qnaCommNum) {
			this.qnaCommNum = qnaCommNum;
		}
		public int getQnaNum() {
			return qnaNum;
		}
		public void setQnaNum(int qnaNum) {
			this.qnaNum = qnaNum;
		}
		public String getUserEmail() {
			return userEmail;
		}
		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}
		public String getQnaCommContent() {
			return qnaCommContent;
		}
		public void setQnaCommContent(String qnaCommContent) {
			this.qnaCommContent = qnaCommContent;
		}
		public String getQnaCommDate() {
			return qnaCommDate;
		}
		public void setQnaCommDate(String qnaCommDate) {
			this.qnaCommDate = qnaCommDate;
		}
		public int getQnaCommDept() {
			return qnaCommDept;
		}
		public void setQnaCommDept(int qnaCommDept) {
			this.qnaCommDept = qnaCommDept;
		}
		public int getQnaCommPNum() {
			return qnaCommPNum;
		}
		public void setQnaCommPNum(int qnaCommPNum) {
			this.qnaCommPNum = qnaCommPNum;
		}


}
