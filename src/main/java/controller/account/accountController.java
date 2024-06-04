package controller.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import data.dto.BoardDto;
import data.dto.UserDto;
import data.service.BoardService;
import data.service.UserService;

@Controller
public class accountController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/login")
	public String login() {
		return "layout/login";
	}
	@GetMapping("/signup")
	public String signup() {
		return "layout/signup";
	}
	
	@PostMapping("/insert")
	public String insertUser(@ModelAttribute UserDto dto) {
		userService.insertUser(dto);
		return "redirect:./login";
	}
    
    @GetMapping("/profile")
    public String showProfile(
    		@RequestParam int user_id,
    		Model model
    		) {	
    	List<BoardDto> list = boardService.getBoardsByUserId(user_id);
    	UserDto userdto = userService.getDataById(user_id);
    	
    	model.addAttribute("userdto",userdto);
    	model.addAttribute("list",list);
        return "layout/profile"; 
    }
    
    @ResponseBody
	@PostMapping("/checklogin")
	public Map<String, Object> isLogin(
			@RequestParam(defaultValue = "no") String saveid,/*널값이 넘어올경우 디폴트값이 적용된다*/
			@RequestParam String email,
			@RequestParam String password,
			HttpSession session)
	{
		System.out.println("saveid="+saveid);
		Map<String, Object> map=new HashMap<>();
		//로그인 상태
		boolean loginStatus=userService.isLoginCheck(email, password);
		int user_id=userService.getDataByEmail(email).getUser_id();
		String nickname=userService.getDataByEmail(email).getNickname();
		
		if(loginStatus) {
			//아이디와 비번이 맞은경우
			map.put("status", "success");
			map.put("user_id", user_id);
			
			//로그인 성공시 세션에 저장
			session.setAttribute("saveid", saveid.equals("no")?"no":"yes");
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
			session.setAttribute("nickname", nickname);
		}else {
			//아이디와 비번이 틀린경우
			map.put("status", "fail");
		}
		return map;
	}
	
	//로그아웃시 호출
	@ResponseBody
	@GetMapping("/logout")
	public void memberLogout(HttpSession session) {
		session.removeAttribute("loginok");
	}
	
	@ResponseBody  //json 으로 반환
	@GetMapping("/idcheck")
	public Map<String, Integer> getIdCheck(
			@RequestParam String searchid)
	{
		Map<String, Integer> map=new HashMap<>();
		int count=userService.getIdCheckCount(searchid);
		map.put("count", count);
		return map;
	}
	
	@ResponseBody  //json 으로 반환
	@GetMapping("/nickcheck")
	public Map<String, Integer> getNickCheck(
			@RequestParam String searchnick)
	{
		Map<String, Integer> map=new HashMap<>();
		int count=userService.getNickCheckCount(searchnick);
		map.put("count", count);
		return map;
	}
}
