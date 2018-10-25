/*
* @Class : NoteMailnFileService
* @ Date : 2018.10.05
* @ Author : 이주원
* @ Desc : 노트메일 파일다운로드
*/
package tk.copyNpaste.note;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	public NoteVO emailNote(NoteVO note) throws Exception {
		return null;
	}
	
	
	//노트 pdf파일로 다운로드
	public NoteVO pdfDownNote(NoteVO note, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//파일을 만들어 주세요.
	 	NoteMapper notedao = sqlsession.getMapper(NoteMapper.class);
		note = notedao.selectDetailNote(note.getNoteNum());


		//css
		String maincss = request.getSession().getServletContext().getRealPath("resources/css/main.css");
		//font
		String font = request.getSession().getServletContext().getRealPath("resources/font/NanumGothic.ttf");

	    // Document 생성
	    Document document = new Document(PageSize.A4, 50, 50, 50, 50);
	 
	    // PdfWriter 생성
	   
	    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("C:/Users/bit/Desktop/"+ note.getNoteTitle() + ".pdf")); // 바로 다운로드.
	    writer.setInitialLeading(12.5f);
	 
	    // 파일 다운로드 설정
	    response.setContentType("application/pdf");
	    response.setHeader("Content-Transper-Encoding", "binary");
	    response.setHeader("Content-Disposition", "inline; filename=" + note.getNoteTitle() + ".pdf");
	 
	    
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
		return null;
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
