package tk.copyNpaste.etc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
		@RequestMapping("/index.htm")
		public String index() {
			//return "index.jsp";
			return "index.main";
		}
		
		
		@RequestMapping("/about.htm")
		public String about() {
			//return "about.jsp";
			
			return "index.about";
		}

		@RequestMapping(value ="/login.htm")
		public String login() {
			//return "login.jsp";
			return "index.login";
		}
		
		
		
		@RequestMapping("/signup.htm")
		public String signup() {
			//return "login.jsp";
			return "index.signup";
		}
		

		
		
		
}
