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
}
