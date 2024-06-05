package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import data.dto.BoardDto;
import data.dto.UserDto;

@Mapper
public interface BoardMapperInter {
	
	@Insert("""
			insert into memo (user_id, writer, content, created_at) values (#{user_id},#{writer},#{content},now())
			""")
	public void insertText(BoardDto dto);
	
	@Insert("""
			insert into memo (user_id, writer, content, type, photo, created_at) 
			values (#{user_id},#{writer},#{content},'photocard',#{photo},now())
			""")
	public void insertPhoto(BoardDto dto);

	@Select("select * from memo where user_id=#{user_id}")
	public List<BoardDto> getBoardsByUserId(int user_id);
	
	@Select("select * from memo where memo_id=#{memo_id}")
	public  BoardDto getBoardByMemoId(int memo_id);
		
	@Update("update memo set is_hidden=#{is_hidden} where memo_id=#{memo_id}")
	public void updateHidden(int memo_id);
	
}
