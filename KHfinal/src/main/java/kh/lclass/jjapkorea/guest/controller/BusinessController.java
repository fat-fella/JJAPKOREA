package kh.lclass.jjapkorea.guest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.lclass.jjapkorea.business.model.service.JobPostingUploadService;
import kh.lclass.jjapkorea.guest.model.service.MemberService;

@Controller
public class BusinessController {
	@Autowired
	MemberService memberServiceImpl;
	
	@Autowired
	JobPostingUploadService jobPostingUploadServiceImpl;
	
	@RequestMapping(value = "/businessList", method = RequestMethod.GET)
	public String BusinessList(Model model, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> getBusinessWithBusinessform = memberServiceImpl.getBusinessWithBusinessform();
		model.addAttribute("getBusinessWithBusinessform", getBusinessWithBusinessform);
		return "businessList";
	}
	
	@RequestMapping(value = "/businessInfo", method = RequestMethod.GET)
	public String BusinessInfo(String mid, Model model) throws Exception {
		Map<String, Object> getBusinessWithBusinessformByMid = memberServiceImpl.getBusinessWithBusinessformByMid(mid);
		model.addAttribute("getBusinessWithBusinessformByMid", getBusinessWithBusinessformByMid);
		List<Map<String, Object>> selectListMap = jobPostingUploadServiceImpl.selectListMap(mid);
		model.addAttribute("selectListMap", selectListMap);
		return "businessInfo";
	}
}
