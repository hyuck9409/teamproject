package data.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import data.dto.UserDto;

@Mapper
public interface UserMapperInter {
	
	@Insert("""
			insert into user (email, password, birthday, nickname) values (#{email},#{password},#{birthday},#{birthday})
			""")
	public void insertUser(UserDto dto);
	
	@Select("select count(*) from user where num=#{num} and password=#{password}")
	public int isEqualPassCheck(Map<String, Object> map);
	
	@Select("""
			select count(*) from user where email=#{email} and password=#{password}
			""")
	public int isLoginCheck(String email,String password);

	
}
