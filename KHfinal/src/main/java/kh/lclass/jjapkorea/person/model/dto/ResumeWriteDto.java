package kh.lclass.jjapkorea.person.model.dto;

import lombok.Data;

@Data
public class ResumeWriteDto {
	private int resumeId;
	private String mid;
	private String address;
	private String title;
	private String selfintroduction;
	private String imageUrl;
}
