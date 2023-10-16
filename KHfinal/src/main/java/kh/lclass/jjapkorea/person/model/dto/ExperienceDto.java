package kh.lclass.jjapkorea.person.model.dto;

import lombok.Data;

@Data
public class ExperienceDto {
	private int experienceId;
	private int resumeId;
	private String workPeriod;
	private String workPlace;
	private String workDetails;
}
