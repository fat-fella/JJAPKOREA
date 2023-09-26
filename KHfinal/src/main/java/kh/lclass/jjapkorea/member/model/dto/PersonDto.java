package kh.lclass.jjapkorea.member.model.dto;

import lombok.Data;

@Data
public class PersonDto {
	private String mid;
	private String pname;
	private String pemail;
	private String pphone;
	
	public PersonDto() {
	}
	
	public PersonDto(String mid, String pname, String pemail, String pphone) {
		super();
		this.mid = mid;
		this.pname = pname;
		this.pemail = pemail;
		this.pphone = pphone;
	}
}
