package kh.lclass.jjapkorea.guest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.lclass.jjapkorea.guest.model.service.MemberService;

@Controller
public class BusinessController {
	@Autowired
	MemberService memberServiceImpl;
	
	@RequestMapping(value = "/businessList", method = RequestMethod.GET)
	public String BusinessList(Model model) throws Exception {
		model.addAttribute("getBusinessWithBusinessform", memberServiceImpl.getBusinessWithBusinessform());
		return "businessList";
	}
}
