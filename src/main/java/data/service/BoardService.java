package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.BoardDto;
import data.dto.UserDto;
import data.mapper.BoardMapperInter;

@Service
public class BoardService {
	@Autowired
	private BoardMapperInter boardInter;
	
	public void insertText(BoardDto dto){
		boardInter.insertText(dto);
	}
	
	public List<BoardDto> getBoardsById(int user_id){
		return boardInter.getBoardsById(user_id);
	}
}
