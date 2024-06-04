package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import data.dto.BoardDto;
import data.dto.UserDto;

@Mapper
public interface UserMapperInter {
	
	@Insert("""
			insert into user (email, password, birthday, nickname) values (#{email},#{password},#{birthday},#{nickname})
			""")
	public void insertUser(UserDto dto);
	
	@Select("select count(*) from user where user_id=#{user_id} and password=#{password}")
	public int isEqualPassCheck(Map<String, Object> map);
	
	@Select("""
			select count(*) from user where email=#{email} and password=#{password}
			""")
	public int isLoginCheck(String email,String password);

	@Select("select * from user where email=#{email}")
	public UserDto getDataByEmail(String email);
	
	@Select("select * from user where user_id=#{user_id}")
	public UserDto getDataById(int user_id);
	
	@Select("select count(*) from user where email=#{searchid}")
	public int getIdCheckCount(String searchid);
	
	@Select("select count(*) from user where nickname=#{searchnick}")
	public int getNickCheckCount(String searchnick);
	
	
}
