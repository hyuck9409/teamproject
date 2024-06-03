package controller.account;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class accountController {
	@GetMapping("/login")
	public String login() {
		return "layout/login";
	}
	@GetMapping("/signup")
	public String signup() {
		return "layout/signup";
	}
	@GetMapping("/profile")
	public String profile() {
		return "layout/profile";
	}
}
