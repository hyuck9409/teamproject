package data.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.UserDto;
import data.mapper.UserMapperInter;

@Service
public class UserService {
	
	private static final HashMap String = null;
	@Autowired
	private UserMapperInter userInter; 
	
	public void insertUser(UserDto dto){
		userInter.insertUser(dto);
	}
	
	public boolean isEqualPassCheck(int user_id,String password)
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("password", password);
		int n=userInter.isEqualPassCheck(map);
		return n==1?true:false;
	}
	
	public boolean isLoginCheck(String email, String password)
	{
		return userInter.isLoginCheck(email, password)==1?true:false;
	}

}
