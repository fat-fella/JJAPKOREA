package kh.lclass.jjapkorea.person.model.dto;

import java.util.List;

import org.springframework.stereotype.Component;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import lombok.Data;

@Data
@Component
public class ScrapDto {
//	--- -------- ------------ 
//	MID NOT NULL VARCHAR2(20) 
//	JID NOT NULL NUMBER

	private String mid;
	private String jid;
	private List<JobPostingDto> jobPostingList;
	
	@Override
	public String toString() {
		return "ScrapDto [mid=" + mid + ", jid=" + jid + "]";
	}

	public ScrapDto() {
		super();
	}

	public ScrapDto(String mid, String jid) {
		super();
		this.mid = mid;
		this.jid = jid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getJid() {
		return jid;
	}

	public void setJid(String jid) {
		this.jid = jid;
	}
	public List<JobPostingDto> getJobPostingList() {
        return jobPostingList;
    }
    public void setJobPostingList(List<JobPostingDto> jobPostingList) {
        this.jobPostingList = jobPostingList;
    }
}
