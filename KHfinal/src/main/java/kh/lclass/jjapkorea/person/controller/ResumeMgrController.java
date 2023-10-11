package kh.lclass.jjapkorea.person.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ResumeMgrController {

	@GetMapping("/person/resume")
	public String resumeMgr() {

		return "/resume/resumeMgr";

	}
}
