package kh.lclass.jjapkorea.person.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ResumeCareer {
// 이력서 경럭!!
	private String cdate; // 기간
	private String corgani; // 기관 및 장소
	private String cdetail; // 상세내용
}
