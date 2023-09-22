package kh.lclass.jjapkorea.resume.write.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ResumeWriteController {

	@GetMapping("resume/write")
	public String resumeMgr() {

		return "/resume/resumeWrite";

	}
}