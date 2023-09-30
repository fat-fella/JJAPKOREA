package kh.lclass.jjapkorea.business.model.dto;

import lombok.Data;

@Data
public class JobPostingDto {
	private String jid;
	private String mid;
	private String recruitField;
	private String companyName;
	private String busino;
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
	
	public JobPostingDto() {
	}
	
	public JobPostingDto(String jid, String recruitField, String companyName, String busino, String userEducation,
			String salary, String minSalary, String maxSalary, String registDate, String closeDate, String reTitle,
			String career, String workType, String empTypeCode) {
		super();
		this.jid = jid;
		this.recruitField = recruitField;
		this.companyName = companyName;
		this.busino = busino;
		this.userEducation = userEducation;
		this.salary = salary;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
		this.registDate = registDate;
		this.closeDate = closeDate;
		this.reTitle = reTitle;
		this.career = career;
		this.workType = workType;
		this.empTypeCode = empTypeCode;
	}

	
}