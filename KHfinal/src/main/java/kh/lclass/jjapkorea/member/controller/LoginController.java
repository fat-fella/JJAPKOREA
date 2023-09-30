package kh.lclass.jjapkorea.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.member.model.service.MemberService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired MemberService memberService;
	
	@GetMapping({"","/"})
	public String login() throws Exception {
		return "member/login";
	}
	
	@GetMapping("/admin")
	public String loginAdmin() throws Exception {
		return "member/loginAdmin";
	}
}
