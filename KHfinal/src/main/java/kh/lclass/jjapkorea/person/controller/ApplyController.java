package kh.lclass.jjapkorea.person.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.business.model.service.ApplyService;

@Controller
@RequestMapping("/apply")
public class ApplyController {
	@Autowired
	ApplyService applyServiceImpl;
	
	@GetMapping("/list")
	public String ApplyList() throws Exception {
		return "jpost/applyList";
	}
}
