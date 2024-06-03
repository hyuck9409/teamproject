package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("BoardDto")
@Builder
@AllArgsConstructor

public class BoardDto {
	
	private int user_id;
	private int memo_id;
	private String writer;
	private String bg_color;
	private String font_color;
	private String type;
	private String photo;
	private String content;
	private Timestamp created_at;
	private boolean is_hidden;
	private int pos_x;
	private int pos_y;
	private String font_family;
}
