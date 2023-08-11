package jjapkorea.scrap.model.dto;

public class ScrapDto {
//	"JID"	NUMBER		NOT NULL,
//	"MID"	VARCHAR2(20)		NOT NULL,
//	"RECRUIT_FIELD"	VARCHAR2(20)		NULL,
//	"COMPANY_NAME"	VARCHAR2(255)		NULL,
//	"BUSINO"	VARCHAR(20)		NULL,
//	"USER_EDUCATION"	VARCHAR(50)		NULL,
//	"SALARY"	VARCHAR(50)		NULL,
//	"MIN_SALARY"	VARCHAR(50)		NULL,
//	"MAX_SALARY"	VARCHAR(50)		NULL,
//	"REGIST_DATE"	VARCHAR(20)		NULL,
//	"CLOSE_DATE"	VARCHAR(20)		NULL,
//	"RE_TITLE"	VARCHAR(255)		NULL,
//	"CAREER"	VARCHAR(50)		NULL,
//	"WORK_TYPE"	VARCHAR(50)		NULL,
//	"EMP_TYPE_CODE"	VARCHAR(20)		NULL

	private String jid;
	private String mid;
	private String recruitField;
	private String companyName;
	private String busiNo;
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
	
	@Override
	public String toString() {
		return "ScrapDto [jid=" + jid + ", mid=" + mid + ", recruitField=" + recruitField + ", companyName="
				+ companyName + ", busiNo=" + busiNo + ", userEducation=" + userEducation + ", salary=" + salary
				+ ", minSalary=" + minSalary + ", maxSalary=" + maxSalary + ", registDate=" + registDate
				+ ", closeDate=" + closeDate + ", reTitle=" + reTitle + ", career=" + career + ", workType=" + workType
				+ ", empTypeCode=" + empTypeCode + "]";
	}
	
	public ScrapDto() {
		super();
	}

	public ScrapDto(String jid, String mid, String recruitField, String companyName, String busiNo, String userEducation,
			String salary, String minSalary, String maxSalary, String registDate, String closeDate, String reTitle,
			String career, String workType, String empTypeCode) {
		super();
		this.jid = jid;
		this.mid = mid;
		this.recruitField = recruitField;
		this.companyName = companyName;
		this.busiNo = busiNo;
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

	public String getJid() {
		return jid;
	}

	public void setJid(String jid) {
		this.jid = jid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
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

	public String getBusiNo() {
		return busiNo;
	}

	public void setBusiNo(String busiNo) {
		this.busiNo = busiNo;
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
	
}
