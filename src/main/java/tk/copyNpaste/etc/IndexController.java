package tk.copyNpaste.etc;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import tk.copyNpaste.note.NoteService;
import tk.copyNpaste.vo.NoteVO;

@Controller
public class IndexController {
		@Autowired
		NoteService noteService;
		@Autowired
		private LocaleResolver localeResolver;

		//인덱스-주제별 노트 상위목록
		@RequestMapping("/index.htm")
		public String index(Model model) throws Exception {
			List<NoteVO> notelist = noteService.selectSubjectCode();
			String[] subjectNames = new String[notelist.size()];
			int i = 0;
			for (NoteVO note: notelist ) {
				subjectNames[i] = note.getSubjectName();
				i++;
			}
			List<NoteVO> etcNoteList = noteService.selectTopNote(subjectNames[0]);
			model.addAttribute("etcNoteList", etcNoteList);
			List<NoteVO> bizNoteList = noteService.selectTopNote(subjectNames[1]);
			model.addAttribute("bizNoteList", bizNoteList);
			List<NoteVO> lifeNoteList = noteService.selectTopNote(subjectNames[2]);
			model.addAttribute("lifeNoteList", lifeNoteList);
			List<NoteVO> eduNoteList = noteService.selectTopNote(subjectNames[3]);
			model.addAttribute("eduNoteList", eduNoteList);
			return "index.main";//return "index.jsp";
		}
		
		//소개페이지
		@RequestMapping("/about.htm")
		public String about() {
			//return "about.jsp";
			return "index.about";
		}
		//소개페이지 로케일 적용
		@RequestMapping("/aboutChangeLanguage.htm")
		public String aboutChangeLanguage(@RequestParam("lang") String language,
				HttpServletRequest request, HttpServletResponse response) {
			Locale locale = new Locale(language);
			localeResolver.setLocale(request, response, locale);
			//return "about.jsp";
			return "redirect:/about.htm";
		}
		
		//로그인 페이지
		@RequestMapping(value ="/login.htm")
		public String login() {
			//return "login.jsp";
			return "index.login";
		}
		
		//회원가입 페이지
		@RequestMapping("/signup.htm")
		public String signup() {
			//return "login.jsp";
			return "index.signup";
		}
	
		//썸네일 비동기
		@RequestMapping("/thumnail.json")
		public String jsouptest() throws Exception {
			int noteNum=19;
			NoteVO note = noteService.selectDetailNote(noteNum);
			String NoteContent = note.getNoteContent();
			Document doc = Jsoup.parseBodyFragment(NoteContent);
			Elements imgs = doc.getElementsByTag("img");
			if(imgs.size() > 0) { 
				String src = imgs.get(0).attr("src"); 
				System.out.println(src);
			}
			//첫번째 소스
			/*Element img = doc.getElementByTag("img").first();
			if(img != null) {
			    String src = img.attr("src");
			}
			배열 소스 */
			return "index.main";
		}
		
		
		
		
}
