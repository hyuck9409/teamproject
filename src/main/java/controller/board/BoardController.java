package controller.board;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.dto.BoardDto;
import data.dto.UserDto;
import data.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String boardlist(@RequestParam int user_id, Model model) {
		UserDto dto = boardService.getData(user_id);
		model.addAttribute("dto",dto); // 사실 이것도 생략가능
		return "layout/boardlist";
	}
	@GetMapping("/detail")
	public String detail() {
		return "layout/detail";
	}
	@GetMapping("/writetext")
	public String writetext(
			@RequestParam int user_id, 
			Model model) {
		model.addAttribute("user_id",user_id);
		return "layout/writetext";
	}
	@GetMapping("/writephoto")
	public String writephoto() {
		return "layout/writephoto";
	}
	
	@PostMapping("/inserttext")
	public String insertText(
			@RequestParam int user_id,
			@ModelAttribute BoardDto dto) {
		boardService.insertText(dto);
		return "redirect:./list?user_id="+user_id;
	}
	
	
}
