package kh.lclass.jjapkorea.member.model.vo;

public class PersonVo {
//	------ -------- ------------- 
//	MID    NOT NULL VARCHAR2(20)  
//	PNAME  NOT NULL VARCHAR2(50)  
//	PEMAIL NOT NULL VARCHAR2(150) 
//	PPHONE NOT NULL VARCHAR2(20)
	private String mid;
	private String pname;
	private String pemail;
	private String pphone;
	
	public PersonVo() {
	}
	public PersonVo(String mid, String pname, String pemail, String pphone) {
		super();
		this.mid = mid;
		this.pname = pname;
		this.pemail = pemail;
		this.pphone = pphone;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public String getPphone() {
		return pphone;
	}
	public void setPphone(String pphone) {
		this.pphone = pphone;
	}
}