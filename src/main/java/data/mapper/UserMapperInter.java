package data.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import data.dto.UserDto;

@Mapper
public interface UserMapperInter {
	
	@Insert("""
			insert into user (email, password, birthday, nickname) values (#{email},#{password},#{birthday},#{birthday})
			""")
	public void insertUser(UserDto dto);

}
