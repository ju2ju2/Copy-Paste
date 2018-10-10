/*
* @Class : EtcController
* @ Date : 2018.10.05
* @ Author : �씠二쇱썝
* @ Desc : 湲고� 愿��젴 而⑦듃濡ㅻ윭. (service �궗�슜, 酉� 留ㅽ븨)
*/



package tk.copyNpaste.etc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tk.copyNpaste.vo.ReportVO;

@Controller //�룞湲� 而⑦듃濡ㅻ윭. retrun>> ModelAndView or String.
@RequestMapping("/etc/")
public class EtcController {
	EtcService etcService = new EtcService(); 
	
	//�떊怨� �븯湲�
	public void insertReport(int noteNum) throws Exception {
		etcService.insertReport(noteNum);
	};
	
	//�떊怨� 紐⑸줉 蹂닿린
	public  void selectAllReport() throws Exception {
		etcService.selectAllReport();
	};
	
	//�떊怨� 泥섎━ �븯湲�
	public void updateReport(int reportNum) throws Exception {
		etcService.updateReport(reportNum);
	};
	

	
	//�뙎湲��븣由�
	public void commAlarm() throws Exception {
		etcService.commAlarm();
	};
	
	//�끂�듃�떊怨좎븣由�
	public void noteReportAlarm() throws Exception {
		etcService.noteReportAlarm();
	};
	
	//�뙎湲��떊怨좎븣由�
	public void commReportAlarm() throws Exception {
		etcService.commReportAlarm();
	} ;
	
	//�긽�쐞�옲�겕�븣由�
	public void topRankAlarm() throws Exception {
		etcService.topRankAlarm();
	};
	

	
	//�넻怨� �쉶�썝 媛��엯
	public void stateMember() throws Exception {
		etcService.stateMember();
	};
	
	//�넻怨� �긽�쐞�끂�듃 李몄“�닔
	public void stateTopRank() throws Exception {
		etcService.stateTopRank();
	};
	
	
	
	/*qna 게시판에 관련된 내용. 
	 * [작성자 : 이주원] [작성날짜 : 2018-10-10]*/
	
	@RequestMapping("/selectQnaboard.htm")
	public String selectAllQnaboard() {
		return "qna.selectQnaboard";
	}

	@RequestMapping("/insertQnaboard.htm")
	public String insertQnaboard() {
		return "qna.insertQnaboard";
	}
	
	@RequestMapping("/selectDetailQna.htm")
	public String selectDetailQnaboard() {
		return "qna.selectDetailQna";
	}
	
	

}
