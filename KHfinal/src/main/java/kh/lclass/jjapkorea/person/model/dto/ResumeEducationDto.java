package kh.lclass.jjapkorea.person.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ResumeEducationDto {
// 이력서 학력!!	
	private String rschool; // 학교명
	private String rdate; // 재학기간
	private String rmajor; // 전공
}
