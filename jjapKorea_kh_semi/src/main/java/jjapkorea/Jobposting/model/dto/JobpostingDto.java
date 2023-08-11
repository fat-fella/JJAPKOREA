package jjapkorea.Jobposting.model.dto;

public class JobpostingDto {
	private String jid;
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
	
	@Override
	public String toString() {
		return "JobpostingDto [jid=" + jid + ", recruitField=" + recruitField + ", companyName=" + companyName
				+ ", busino=" + busino + ", userEducation=" + userEducation + ", salary=" + salary + ", minSalary="
				+ minSalary + ", maxSalary=" + maxSalary + ", registDate=" + registDate + ", closeDate=" + closeDate
				+ ", reTitle=" + reTitle + ", career=" + career + ", workType=" + workType + ", empTypeCode="
				+ empTypeCode + ", today=" + today + ", dday=" + dday + "]";
	}

	public String getJid() {
		return jid;
	}

	public void setJid(String jid) {
		this.jid = jid;
	}
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
		return busino;
	}
	public void setBusino(String busino) {
		this.busino = busino;
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
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public String getReTitle() {
		return reTitle;
	}
	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getEmpTypeCode() {
		return empTypeCode;
	}
	public void setEmpTypeCode(String empTypeCode) {
		this.empTypeCode = empTypeCode;
	}
	public int getToday() {
		return today;
	}
	public void setToday(int today) {
		this.today = today;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
}
