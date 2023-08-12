package jjapkorea.scrap.model.dto;

import java.util.List;

import jjapkorea.Jobposting.model.dto.JobpostingDto;

public class ScrapDto {
//	--- -------- ------------ 
//	MID NOT NULL VARCHAR2(20) 
//	JID NOT NULL NUMBER

	private String mid;
	private String jid;
	private List<JobpostingDto> jobPostingList;
	
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
	public List<JobpostingDto> getJobPostingList() {
        return jobPostingList;
    }
    public void setJobPostingList(List<JobpostingDto> jobPostingList) {
        this.jobPostingList = jobPostingList;
    }
}
