package jjapkorea.Jobposting.model.dto;

import java.sql.Date;

public class JobpostingDto {
	private String recruitField;
	private String companyName;
	private String Busino;
	private String userEducation;
	private String salary;
	private String minSalary;
	private String maxSalary;
	private Date registDate;
	private Date closeDate;
	private String raTitle;
	private String career;
	private String holidayType;
	private String empTypeCode;
	
	
	
	
	public String getRecruitField() {
		return recruitField;
	}
	public void setRecruitField(String recruitField) {
		this.recruitField = recruitField;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getBusino() {
		return Busino;
	}
	public void setBusino(String busino) {
		Busino = busino;
	}
	public String getUserEducation() {
		return userEducation;
	}
	public void setUserEducation(String userEducation) {
		this.userEducation = userEducation;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getMinSalary() {
		return minSalary;
	}
	public void setMinSalary(String minSalary) {
		this.minSalary = minSalary;
	}
	public String getMaxSalary() {
		return maxSalary;
	}
	public void setMaxSalary(String maxSalary) {
		this.maxSalary = maxSalary;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public Date getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}
	public String getRaTitle() {
		return raTitle;
	}
	public void setRaTitle(String raTitle) {
		this.raTitle = raTitle;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getHolidayType() {
		return holidayType;
	}
	public void setHolidayType(String holidayType) {
		this.holidayType = holidayType;
	}
	public String getEmpTypeCode() {
		return empTypeCode;
	}
	public void setEmpTypeCode(String empTypeCode) {
		this.empTypeCode = empTypeCode;
	}
}
