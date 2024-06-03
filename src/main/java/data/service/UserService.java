package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.UserDto;
import data.mapper.UserMapperInter;

@Service
public class UserService {
	
	@Autowired
	private UserMapperInter userInter; 
	
	public void insertUser(UserDto dto){
		userInter.insertUser(dto);
	}

}
