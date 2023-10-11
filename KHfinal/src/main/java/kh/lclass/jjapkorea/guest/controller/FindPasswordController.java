package kh.lclass.jjapkorea.guest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.lclass.jjapkorea.guest.model.dto.PersonDto;

@Controller
public class FindPasswordController {
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findId() {
		return "member/findPassword";
	}
	
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findId(PersonDto personDto) {
		return "member/findPassword";
	}
}
