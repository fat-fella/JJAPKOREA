package kh.lclass.jjapkorea.Jobposting.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class JobPostingCategoryDto {
	private String jobscd;
	private String jobscat;
	private String jobsmcd;
	private String jobsmcat;
	private String jobsscd;
	private String jobsscat;
	private String recruitField;
	private String fieldTitle;
	
	
}
