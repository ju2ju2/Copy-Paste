/*
* @Class : NoteMailnFileService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 노트메일 파일다운로드
* */

package tk.copyNpaste.note;

import java.io.FileInputStream;
import java.io.StringReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.security.Principal;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import tk.copyNpaste.mapper.NoteMapper;
import tk.copyNpaste.vo.NoteVO;

@Service
public class NoteMailnFileService {
	
	@Autowired
	private SqlSession sqlsession;
	 
	//노트 메일 전송
	public Object emailNote(NoteVO note, String noteEmailTo, Principal principal) throws Exception {
		 	//노트 조회
			NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
			note = notedao.selectDetailNote(note.getNoteNum());
			
		    String email = principal.getName();	//전송될 이메일
		    String title = note.getNoteTitle();		//노트 제목
		    String content = note.getNoteContent(); //노트 내용
		    
	        Properties props = new Properties();
	        props.setProperty("mail.transport.protocol", "smtp");
	        props.setProperty("mail.host", "smtp.gmail.com");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.port", "465");
	        props.put("mail.smtp.socketFactory.port", "465");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.socketFactory.fallback", "false");
	        props.setProperty("mail.smtp.quitwait", "false");
	         
	        Authenticator auth = new Authenticator(){
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("bitcamp109@gmail.com", "room404404");
	            }
	        };
	    
	        Session session = Session.getDefaultInstance(props,auth);
	         
	        MimeMessage message = new MimeMessage(session);
	        message.setSender(new InternetAddress(email));
	        message.setSubject("[copyNpaste] " + title);
	 
	        message.setRecipient(Message.RecipientType.TO, new InternetAddress(noteEmailTo));
	         
	        Multipart mp = new MimeMultipart();
	        MimeBodyPart mbp1 = new MimeBodyPart();
	        mbp1.setContent(title+"<br>"+content, "text/html; charset=UTF-8");
	        mp.addBodyPart(mbp1);
	 
	         
	        MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	        mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	        mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	        mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	        mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	        mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	        CommandMap.setDefaultCommandMap(mc);
	         
	        message.setContent(mp);
	         
	        Transport.send(message);
	        
		return note.getNoteNum();
	}
	
	
	//노트 pdf파일로 다운로드
	public Object pdfDownNote(NoteVO note, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//노트 조회
	 	NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		note = notedao.selectDetailNote(note.getNoteNum());

		//css
		String maincss = request.getSession().getServletContext().getRealPath("resources/css/main.css");
		//font
		String font = request.getSession().getServletContext().getRealPath("resources/font/NanumGothic.ttf");

	    // Document 생성
	    Document document = new Document(PageSize.A4, 50, 50, 50, 50);
	    
	    // 멀티헤더가 있으면 에러가 발생됨 ,>>"_" or +"//" 해줌
	    String noteTitle  = note.getNoteTitle().replaceAll(",", "_");
	    String encodedNoteTitie = URLEncoder.encode(noteTitle,"UTF-8");// 파일 다운로드 설정

	    // PdfWriter 생성
	    //PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/temp/"+encodedNoteTitie+".pdf")); // 바로 다운로드.
	    PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
		writer.setInitialLeading(12.5f);
	    response.setContentType("application/pdf");
	    response.setHeader("Content-Transper-Encoding", "binary");
	 	response.setHeader("Content-Disposition", "attachment; filename="+encodedNoteTitie+".pdf"); 
	    
	    // Document 오픈
	    document.open();
        document.add(new Chunk(""));
	    XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
	 
	    // CSS
	    CSSResolver cssResolver = new StyleAttrCSSResolver();
	    CssFile cssFile = helper.getCSS(new FileInputStream(maincss));
	    cssResolver.addCss(cssFile);

	    // HTML, 폰트 설정
	    XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
	    fontProvider.register(font, "MalgunGothic"); // MalgunGothic은
	 
	    CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
	 
	    HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
	    htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
	 
	    // Pipelines
	    PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
	    HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
	    CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
	 
	    XMLWorker worker = new XMLWorker(css, true);
	    XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
	 
	    // 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
	    String sHtml = "<html><head></head><body style='font-family:MalgunGothic; text-align:center;'>" ;
	    	   sHtml +="<div class='noteTitle'>"+note.getNoteTitle()+"</div><br/><br/>";
	    	   sHtml +="<div class='noteContent text-center'>"+ note.getNoteContent().toString() + "</div></body></html>";
	    //이미지 태그 안닫힌 태그들 찾아서 닫는 작업 진행
	    Pattern pattern  =  Pattern.compile("</p><img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
        Matcher match = pattern.matcher(sHtml);
        while(match.find()){
            String imgTag   = match.group();
            String imgTag2  = imgTag.replaceAll(">", "/>");
            sHtml  = sHtml.replaceAll(imgTag, imgTag2);
        }
                Pattern pattern2  =  Pattern.compile("<col[^>]*style=[\"']?([^>\"']+)[\"']?[^>]*>");
                Matcher match2 = pattern2.matcher(sHtml);
                while(match2.find()){
                    String colTag       = match2.group();
                    String colTag2  = colTag.replaceAll(">", "/>");
                    sHtml         = sHtml.replaceAll(colTag, colTag2);
                }
      
        xmlParser.parse(new StringReader(sHtml));
        document.close();
	    writer.close();

		return note.getNoteNum();
	}
	
	//노트 xls파일로 다운로드
	public NoteVO xlsDownNote(NoteVO note) throws Exception {
		return null;
	}
	
	//노트 hwp파일로 다운로드
	public NoteVO hwpDownNote(NoteVO note) throws Exception {
		return null;
	}


	

}



