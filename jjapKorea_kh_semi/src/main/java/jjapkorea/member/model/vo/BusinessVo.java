package jjapkorea.member.model.vo;

public class BusinessVo {
//	MID
//	BFORM
//	BRNO
//	BIZNAME
//	BADDRESS
//	BNAME
//	BTEL
//	BEMAIL
	private String mid;
	private String bform;
	private String brno;
	private String bizname;
	private String baddress;
	private String bname;
	private String btel;
	private String bemail;
	public BusinessVo(String mid, String bform, String brno, String bizname, String baddress, String bname, String btel,
			String bemail) {
		super();
		this.mid = mid;
		this.bform = bform;
		this.brno = brno;
		this.bizname = bizname;
		this.baddress = baddress;
		this.bname = bname;
		this.btel = btel;
		this.bemail = bemail;
	}
	public BusinessVo() {
		super();
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getBform() {
		return bform;
	}
	public void setBform(String bform) {
		this.bform = bform;
	}
	public String getBrno() {
		return brno;
	}
	public void setBrno(String brno) {
		this.brno = brno;
	}
	public String getBizname() {
		return bizname;
	}
	public void setBizname(String bizname) {
		this.bizname = bizname;
	}
	public String getBaddress() {
		return baddress;
	}
	public void setBaddress(String baddress) {
		this.baddress = baddress;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBtel() {
		return btel;
	}
	public void setBtel(String btel) {
		this.btel = btel;
	}
	public String getBemail() {
		return bemail;
	}
	public void setBemail(String bemail) {
		this.bemail = bemail;
	}
}
