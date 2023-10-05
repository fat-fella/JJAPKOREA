package kh.lclass.jjapkorea.guest.model.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class PersonDto {
	private String mid;
	@NotEmpty(message = "이름을 입력하세요.")
	private String pname;
	@NotEmpty(message = "이메일을 입력하세요.")
	@Email(message = "이메일 형식이 맞지 않습니다.")
	private String pemail;
	@NotEmpty(message = "전화번호를 입력하세요.")
	private String pphone;
}
