package kh.lclass.jjapkorea.mail.model.dto;

import org.springframework.stereotype.Component;

@Component
public class MailSendDto {
	private String title;
	private String content;
	private String receiver;
	
	@Override
	public String toString() {
		return "MailSendDto [title=" + title + ", content=" + content + ", receiver=" + receiver + "]";
	}

	public MailSendDto() {
		super();
	}

	public MailSendDto(String title, String content, String receiver) {
		super();
		this.title = title;
		this.content = content;
		this.receiver = receiver;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	
}