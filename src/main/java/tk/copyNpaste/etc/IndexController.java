package tk.copyNpaste.etc;

import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import tk.copyNpaste.vo.MemberVO;

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
		
		@RequestMapping("/login.htm")
		public String login() {
			//return "login.jsp";
			return "index.login";
		}
		
		
		
		@RequestMapping("/signup.htm")
		public String signup() {
			//return "login.jsp";
			return "index.login";
		}
	
		
		
		
}
