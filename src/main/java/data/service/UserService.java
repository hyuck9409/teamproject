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
	
	public boolean isEqualPassCheck(int num,String passwd)
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("passwd", passwd);
		int n=userInter.isEqualPassCheck(map);
		return n==1?true:false;
	}
	
	public boolean isLoginCheck(String email, String password)
	{
		return userInter.isLoginCheck(email, password)==1?true:false;
	}

}
