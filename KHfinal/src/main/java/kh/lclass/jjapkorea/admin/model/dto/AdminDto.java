package kh.lclass.jjapkorea.admin.model.dto;

import lombok.Data;

@Data
public class AdminDto {
	private int rownum;
	private String mid;
	private String mtype;
	private int enabled;
	
	private String pemail;
	private String pphone;
	private String pname;
	
	private String bizname;
	private String baddress;
	private String bname;
	private String btel;
	private String bemail;
}
