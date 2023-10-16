package kh.lclass.jjapkorea.person.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ResumeLisence {
//이력서 자격증!!
	private String llisence; // 자격면허
	private String ldate; //취득일 
	private String lorgani; // 발급기관
}
