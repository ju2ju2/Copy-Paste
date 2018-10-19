package tk.copyNpaste.etc;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tk.copyNpaste.note.NoteService;
import tk.copyNpaste.vo.NoteVO;

@Controller
public class IndexController {
		@Autowired
		NoteService noteService;

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
	
		
		
		
}
