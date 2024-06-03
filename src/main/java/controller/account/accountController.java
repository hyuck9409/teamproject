package controller.account;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import data.dto.UserDto;
import data.service.UserService;

@Controller
public class accountController {
	@Autowired
	private UserService userService;
	
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
    public String showProfile() {
        return "layout/profile"; // 
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
		if(loginStatus) {
			//아이디와 비번이 맞은경우
			map.put("status", "success");
			map.put("user_id", user_id);
			
			//로그인 성공시 세션에 저장
			session.setAttribute("saveid", saveid.equals("no")?"no":"yes");
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", email);
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
}
