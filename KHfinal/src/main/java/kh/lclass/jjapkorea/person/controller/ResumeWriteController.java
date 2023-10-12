package kh.lclass.jjapkorea.person.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ResumeWriteController {

	@GetMapping("/person/resume/write")
	public String resumeMgr() {

		return "/resume/resumeWrite";

	}
	
	@PostMapping("/person/resume/write")
	public String resumeMgr(String mid) {

		return "/resume/resumeWrite";

	}
}