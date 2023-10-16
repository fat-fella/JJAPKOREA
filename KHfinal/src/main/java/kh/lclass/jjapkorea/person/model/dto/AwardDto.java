package kh.lclass.jjapkorea.person.model.dto;

import lombok.Data;

@Data
public class AwardDto {
	private int awardId;
	private int resumeId;
	private String awardName;
	private String awardingAuthority;
	private String awardDate;
}
