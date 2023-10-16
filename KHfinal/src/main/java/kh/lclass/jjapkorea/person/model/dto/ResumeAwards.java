package kh.lclass.jjapkorea.person.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ResumeAwards {
// 이력서 수상내역 / 공모전 !!
	private String aname; // 수상명
	private String aorgani; //수여기관
	private String adate; //수상일자
}
