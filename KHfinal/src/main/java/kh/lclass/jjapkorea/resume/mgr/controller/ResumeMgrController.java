package kh.lclass.jjapkorea.resume.mgr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ResumeMgrController {

	@GetMapping("resume")
	public String resumeMgr() {

		return "/resume/resumeMgr";

	}
}
