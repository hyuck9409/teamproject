package data.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import data.dto.BoardDto;
import data.dto.UserDto;

@Mapper
public interface BoardMapperInter {
	
	@Insert("""
			insert into memo (writer, content, created_at) values (#{writer},#{content},now())
			""")
	public void insertText(BoardDto dto);

	@Select("select * from memo where user_id=#{user_id}")
	public UserDto getData(int user_id);
	
}
