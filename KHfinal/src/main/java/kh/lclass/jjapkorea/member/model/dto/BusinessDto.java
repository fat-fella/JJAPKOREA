package kh.lclass.jjapkorea.member.model.dto;

import lombok.Data;

@Data
public class BusinessDto {
	private String mid;
	private String bform;
	private String brno;
	private String bizname;
	private String brepName;
	private String baddress;
	private String bname;
	private String btel;
	private String bemail;
	
	public BusinessDto() {
		super();
	}
	
	public BusinessDto(String mid, String bform, String brno, String bizname, String brepName, String baddress,
			String bname, String btel, String bemail) {
		super();
		this.mid = mid;
		this.bform = bform;
		this.brno = brno;
		this.bizname = bizname;
		this.brepName = brepName;
		this.baddress = baddress;
		this.bname = bname;
		this.btel = btel;
		this.bemail = bemail;
	}
}
