package kh.lclass.jjapkorea.mail.model.dto;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class MailSendDto {
	private int aid; // 이력서작성 지원 아이디
	private String jid; // 채용정보 아이디
	private String mid; // 개인회원 아이디
	private String[] pemail; // 개인회원 이메일
	private String bizName; // 기업회원 회사명
	
	@Override
	public String toString() {
		return "MailSendDto [aid=" + aid + ", jid=" + jid + ", mid=" + mid + ", pemail=" + Arrays.toString(pemail)
				+ ", bizName=" + bizName + "]";
	}

	public MailSendDto(int aid, String jid, String mid, String[] pemail, String bizName) {
		super();
		this.aid = aid;
		this.jid = jid;
		this.mid = mid;
		this.pemail = pemail;
		this.bizName = bizName;
	}

	public MailSendDto() {
		super();
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getJid() {
		return jid;
	}

	public void setJid(String jid) {
		this.jid = jid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String[] getPemail() {
		return pemail;
	}

	public void setPemail(String[] pemail) {
		this.pemail = pemail;
	}

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	
	
}