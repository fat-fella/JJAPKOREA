package kh.lclass.jjapkorea.member.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDto {
	private String mid;
	private String mpw;
	private int mtype;
	
	public MemberDto() {
	}
	
	public MemberDto(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}
	
	public MemberDto(String mid, String mpw, int mtype) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mtype = mtype;
	}
}
