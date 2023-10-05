package kh.lclass.jjapkorea.guest.model.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberDto {
	@NotEmpty(message = "아이디를 입력하세요.")
	@Pattern(regexp = "^(?=.*[a-z])[a-z0-9]*$", message = "소문자와 숫자로만 입력하세요. 소문자를 포함해야 합니다.")
	private String mid;
	@NotEmpty(message = "비밀번호를 입력하세요.")
    @Size(min = 8, max = 16, message = "비밀번호는 8자에서 16자 사이여야 합니다.")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!.]).*$", message = "비밀번호는 대문자, 소문자, 특수문자를 포함해야 합니다.")
	private String mpw;
	private String mtype;
	private int enabled;
}
