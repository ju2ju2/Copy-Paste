package tk.copyNpaste.etc;

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
			List<NoteVO> noteList = noteService.selectTopNote();
			model.addAttribute("noteList", noteList);
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
