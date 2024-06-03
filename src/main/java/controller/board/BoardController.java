package controller.board;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	@GetMapping("list")
	public String boardlist() {
		return "layout/boardlist";
	}
	@GetMapping("detail")
	public String detail() {
		return "layout/detail";
	}
	@GetMapping("writetext")
	public String writetext() {
		return "layout/writetext";
	}
	@GetMapping("writephoto")
	public String writephoto() {
		return "layout/writephoto";
	}
}
