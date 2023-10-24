package kh.lclass.jjapkorea.onepick.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.lclass.jjapkorea.business.model.service.JobPostingService;

@Controller
public class OnePickController {
	@Autowired
	JobPostingService jobPostingServiceImpl;
	
	@RequestMapping(value = "/one-pick", method = RequestMethod.GET)
	public String onePick(Model model) throws Exception {
		List<Map<String, Object>> mostScrappedJob = jobPostingServiceImpl.mostScrappedJob();
		model.addAttribute("mostScrappedJob", mostScrappedJob);
		
		List<Map<String, Object>> mostClickedJob = jobPostingServiceImpl.mostClickedJob();
		model.addAttribute("mostClickedJob", mostClickedJob);
		
		List<Map<String, Object>> highestSalaryJob = jobPostingServiceImpl.highestSalaryJob();
		model.addAttribute("highestSalaryJob", highestSalaryJob);
		
		return "one-pick";
	}
}
