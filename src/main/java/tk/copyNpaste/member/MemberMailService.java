/*
* @Class : MemberMailService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 인증, 임시비밀번호 전송
*/
package tk.copyNpaste.member;

import java.io.StringWriter;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import tk.copyNpaste.vo.MemberVO;

@Service
public class MemberMailService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private VelocityEngine velocityEngine;

	private MemberVO member;
	HttpServletRequest request;

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	public String sendMail(String mailto,String command) {
		Template template;
		String randomNum = this.randomNum();

		// SimpleMailMessage message = new SimpleMailMessage();
		MimeMessage message = mailSender.createMimeMessage();
		
		MimeMessageHelper helper;
		try {
			// 멀티파트 메시지가 필요하다는 의미로 true 플래그를 사용한다
			helper = new MimeMessageHelper(message, true, "utf-8");
			helper.getEncoding();
			helper.setFrom("bitcamp109@gmail.com");
			helper.setTo(mailto);
			if (command == "singupEmail.do") {
				helper.setSubject("copyNpaste-회원가입 인증 이메일");// 메일제목
				template = velocityEngine
						.getTemplate("jointemplate.vm");// 메일내용
			} else {
				helper.setSubject("copyNpaste-로그인실패 이메일");// 메일제목
				template = velocityEngine
						.getTemplate("logintemplate.vm");// 메일내용		
				//"./src/main/resources/templates/"
										
			}
			
			VelocityContext velocityContext = new VelocityContext();
			velocityContext.put("userEmail", mailto);
			velocityContext.put("company", "copyNpaste");
			velocityContext.put("mailFrom", "copyNpaste");
			velocityContext.put("randomNum", randomNum);
			velocityContext.put("randomPwd", this.randomPwd());
			

			StringWriter stringWriter = new StringWriter();
			template.merge(velocityContext, stringWriter);
			
			helper.setText(stringWriter.toString(), true);
			
			
		} catch (MessagingException e) {

		}
		mailSender.send(message);
		return randomNum;
		
	}

	public  String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 5; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	
	public  String randomPwd() { 
		char[] charSet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
				'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'!','@','#','$','%','^','&','*'};
		
		int idx = 0; 
		StringBuffer buffer = new StringBuffer(); 		
		for (int i = 0; i < 10; i++) { 
		idx = (int) (charSet.length * Math.random());
		// 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
		buffer.append(charSet[idx]); 
		
		} 
		return buffer.toString(); 
	}
	


	
}