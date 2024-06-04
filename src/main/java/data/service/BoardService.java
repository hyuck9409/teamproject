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
	
	public List<BoardDto> getBoardsByUserId(int user_id){
		return boardInter.getBoardsByUserId(user_id);
	}
	
	 public BoardDto getBoardByMemoId(int memo_id) {
	        return boardInter.getBoardByMemoId(memo_id);
	    }
}
