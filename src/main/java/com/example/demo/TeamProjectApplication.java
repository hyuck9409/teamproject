package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"*.member","data.*","tiles.config",
	   "com.example.demo", "controller.*", "naver.cloud"}) // 여러개일때는 {} 사용하여 추가할 수 있음
@MapperScan("data.mapper")
public class TeamProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamProjectApplication.class, args);
	}

}
