package kh.lclass.jjapkorea.guest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FindIdAndPasswordController {
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findId";
	}
}
