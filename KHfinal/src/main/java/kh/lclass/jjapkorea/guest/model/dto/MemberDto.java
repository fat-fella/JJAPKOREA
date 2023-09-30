package kh.lclass.jjapkorea.guest.model.dto;

import lombok.Data;

@Data
public class MemberDto {
	private String mid;
	private String mpw;
	private String mtype;
	private int enabled;
}
