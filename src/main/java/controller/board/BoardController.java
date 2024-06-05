package controller.board;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import data.dto.BoardDto;
import data.dto.UserDto;
import data.service.BoardService;
import data.service.UserService;
import naver.cloud.NcpObjectStorageService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	@Autowired
	private NcpObjectStorageService storageService;
	
	private String bucketName="bitcamp-jsh";
	private String folderName="photocommon";
	
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
	public String writephoto(
			@RequestParam int user_id,
			Model model) {
		model.addAttribute("user_id",user_id);
		
		return "layout/writephoto";
	}
	
	@PostMapping("/inserttext")
	public String insertText(
			@RequestParam int user_id,
			@ModelAttribute BoardDto dto) {
		boardService.insertText(dto);
		return "redirect:./list?user_id="+user_id;
	}
	
	@PostMapping("/insertphoto")
	public String insertphoto(
			@RequestParam int user_id,
			@ModelAttribute BoardDto dto,
			@RequestParam(value = "upload", required = false) MultipartFile upload
			) {
		
		//등록 버튼 클릭시 파일도 전달되는 방식
		if(upload==null)
			return "";
	
		//스토리지에 저장후 파일명 얻기
		String photoname=storageService.uploadFile(bucketName, folderName, upload);
		
		dto.setPhoto(photoname);
		dto.setUser_id(user_id);
		
		//db insert
		boardService.insertPhoto(dto);

	
		return "redirect:./list?user_id="+user_id;
	}
	
	@GetMapping("/hide")
	public String updateHidden(
			@RequestParam int memo_id,
			Model model) {
		
		BoardDto dto = boardService.getBoardByMemoId(memo_id);
		
		int is_hidden = dto.getIs_hidden()==1 ? 0 : 1;
		
		return "layout/writephoto";
	}
	
}
