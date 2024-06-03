package data.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import data.dto.UserDto;

@Mapper
public interface UserMapperInter {
	
	@Insert("""
			insert into memberdb (email, password, birthday, nickname, board_color) values (#{email},#{password},#{passwd},#{birthday})
			""")
	public void insertMember(UserDto dto);

}
