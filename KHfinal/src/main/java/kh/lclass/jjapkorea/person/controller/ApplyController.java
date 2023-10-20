package kh.lclass.jjapkorea.person.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.business.model.service.ApplyService;

@Controller
@RequestMapping("/apply")
public class ApplyController {
	@Autowired
	ApplyService applyServiceImpl;
	
	@GetMapping("/list")
	public String ApplyList(Principal principal, Model model) throws Exception {
		String participant = principal.getName();
		List<Map<String, Object>> applyList = applyServiceImpl.applyList(participant);
		model.addAttribute("applyList", applyList);
		return "jpost/applyList";
	}
}
