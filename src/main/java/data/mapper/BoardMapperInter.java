package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import data.dto.BoardDto;
import data.dto.UserDto;

@Mapper
public interface BoardMapperInter {
	
	@Insert("""
			insert into memo (user_id, writer, content, created_at) values (#{user_id},#{writer},#{content},now())
			""")
	public void insertText(BoardDto dto);

	@Select("select * from memo where user_id=#{user_id}")
	public List<BoardDto> getBoardsByUserId(int user_id);
	
	@Select("select * from memo where memo_id=#{memo_id}")
	public BoardDto getBoardByMemoId(int memo_id);
}
