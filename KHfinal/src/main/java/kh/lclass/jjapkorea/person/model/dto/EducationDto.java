package kh.lclass.jjapkorea.person.model.dto;

import lombok.Data;

@Data
public class EducationDto {
	private int educationId;
	private int resumeId;
	private String educationPeriod;
	private String schoolName;
	private String major;
}
