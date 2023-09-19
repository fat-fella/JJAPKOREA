package kh.lclass.jjapkorea.board.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Component
public class BoardDto {

	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriteDate;
	private String mid;
	private int bref;
	private int breLevel;
	private int breStep;
	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", btitle=" + btitle + ", bwriteDate=" + bwriteDate
				+ ", mid=" + mid + ", bref=" + bref + ", breLevel=" + breLevel + ", breStep=" + breStep + "]";
	}

	
}
