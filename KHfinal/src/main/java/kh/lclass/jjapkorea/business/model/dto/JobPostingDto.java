package kh.lclass.jjapkorea.business.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class JobPostingDto {
	private String jid;
	private String mid;
	private String recruitField;
	private String userEducation;
	private String salary;
	private String minSalary;
	private String maxSalary;
	private String registDate;
	private String closeDate;
	private String reTitle;
	private String career;
	private String workType;
	private String empTypeCode;
	private int today;
	private int dday;
	private String jpostdetail;
	private Date postTime;
}
