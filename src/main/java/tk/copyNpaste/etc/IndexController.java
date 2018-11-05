package tk.copyNpaste.etc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import tk.copyNpaste.member.NaverLogin;
import tk.copyNpaste.note.NoteService;
import tk.copyNpaste.vo.MelonVO;
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
		public String login(Model model, HttpSession session) {
			//return "login.jsp";
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	        String naverAuthUrl = NaverLogin.getAuthorizationUrl(session);
	        model.addAttribute("naverAuthUrl", naverAuthUrl);
			//return "login.jsp";
			return "index.login";
		}
		
		//회원가입 페이지
		@RequestMapping("/signup.htm")
		public String signup(Model model, HttpSession session) {
			//return "login.jsp";
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	        String naverAuthUrl = NaverLogin.getAuthorizationUrl(session);
	        model.addAttribute("naverAuthUrl", naverAuthUrl);
			return "index.signup";
		}
	
		
		//멜론 차트
		@RequestMapping("/jsoupMelon.json")
		public @ResponseBody List<MelonVO>  jsoupMelon() throws Exception {
			  String url = "https://www.melon.com/";
		      Document doc = null;
		      doc = Jsoup.connect(url).get();
		      List<MelonVO> melonList = new ArrayList<MelonVO>();
		      
		      // 태그를 찾아서 가져오도록 한다.
		      Elements element = doc.select("div.typeRealtime");

		      for(Element el : element.select("li.rank_item")) {    // 하위 순위들 for문 돌면서 출력
		    	 
		    	  MelonVO mVO= new MelonVO();
		    	  mVO.setSongNo(el.select(".rank_info>.song").attr("data-song-no"));
		    	  mVO.setTextIntro( element.select(".txt_intro").html());
		    	  mVO.setImgT(el.select(".rank_cntt>.thumb>a>img").attr("src"));
		    	  mVO.setRank(el.select(".rank_number>.rank").text());
		    	  mVO.setSong(el.select(".rank_info>.song>a").text());
		    	  mVO.setArtist(el.select(".rank_info>.artist>.ellipsis>a").text());
		    	  melonList.add(mVO);
		      }

			return melonList;
		}
		// 선택한 곡 가사보기
		@RequestMapping(value = "/melonLyrics.json")
		public @ResponseBody Map<String,String> selectDetailNote(String songNo) throws Exception {
			String url = "https://www.melon.com/song/detail.htm?songId="+songNo;
		    Document doc = null;
		    doc = Jsoup.connect(url).get();
		    Map<String, String> map = new HashMap<String, String> ();
		  
		    // 태그를 찾아서 가져오도록 한다.
		    Elements element = doc.select(".lyric");
		    String lyric = element.html();
		    map.put("lyric", lyric);
		    return map;
		}
		
		
		
		//에러페이지
		@RequestMapping("/error.htm") 
		public String errorpage(HttpServletRequest request, Model model) throws Exception { 
			
			return "index.error"; 
		} 
		

}
