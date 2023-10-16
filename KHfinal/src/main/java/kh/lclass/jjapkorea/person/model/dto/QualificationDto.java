package kh.lclass.jjapkorea.person.model.dto;

import lombok.Data;

@Data
public class QualificationDto {
	private int qualificationId;
	private int resumeId;
	private String qualificationName;
	private String qualificationDate;
	private String qualificationAuthority;
}
