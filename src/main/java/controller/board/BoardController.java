package controller.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import data.service.UserService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/list")
	public String boardlist(@RequestParam int user_id, Model model) {
		List<BoardDto> list = boardService.getBoardsByUserId(user_id);
		UserDto userdto = userService.getDataById(user_id);
		
		model.addAttribute("list",list);
		model.addAttribute("userdto",userdto);
		
		return "layout/boardlist";
	}
	
	@GetMapping("/detail")
	public String detail(
			@RequestParam int user_id,
			@RequestParam int memo_id,
			Model model
			) {
		List<BoardDto> list = boardService.getBoardsByUserId(user_id);
		
		model.addAttribute("user_id",user_id);
		
		BoardDto boardDto = boardService.getBoardByMemoId(memo_id);
        model.addAttribute("dto", boardDto);
        
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
