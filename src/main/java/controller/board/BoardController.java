package controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import data.dto.BoardDto;
import data.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public String boardlist() {
		return "layout/boardlist";
	}
	@GetMapping("/detail")
	public String detail() {
		return "layout/detail";
	}
	@GetMapping("/writetext")
	public String writetext() {
		return "layout/writetext";
	}
	@GetMapping("/writephoto")
	public String writephoto() {
		return "layout/writephoto";
	}
	
	@PostMapping("/inserttext")
	public String insertText(@ModelAttribute BoardDto dto) {
		boardService.insertText(dto);
		return "redirect:./list";
	}
	
	
}
