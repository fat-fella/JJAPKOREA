package kh.lclass.jjapkorea.board.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Component
public class BoardDto {

	private int bno;
	private String btitle;
	private String bcontent;
	private String mid;
	private String bwriteDate;
	private int readcnt;
	private int ref;
	private int rstep;
	private int rlevel;
	private int likehit;
	
	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", btitle=" + btitle + ", mid=" + mid + ", bwriteDate=" + bwriteDate
				+ ", readcnt=" + readcnt + ", ref=" + ref + ", rstep=" + rstep + ", rlevel=" + rlevel + "]";
	}
}
