package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("UserDto")
@Builder
@AllArgsConstructor
public class UserDto {
	private int user_id;
	private String email;
	private String password;
	private String nickname;
	private String birthday;

}
