package kh.lclass.jjapkorea.board.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Component
@ToString
public class BoardDto {

	private int bno;
	private String btitle;
	private String bcontent;
	private String mid;
	private String bwriteDate;
	private int readcnt;
	private String filename;
	private String filepath;
	private int ref;
	private int rstep;
	private int rlevel;

	
}
