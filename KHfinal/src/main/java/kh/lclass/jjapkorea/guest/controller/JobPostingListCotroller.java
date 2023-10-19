package kh.lclass.jjapkorea.guest.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.lclass.jjapkorea.business.model.service.JobPostingService;
import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
public class JobPostingListCotroller {
	@Autowired
	JobPostingService jobPostingServiceImpl;
	
	@Autowired
	ScrapService scrapServiceImpl;
	
	@RequestMapping(value = "/jobPostingList", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public String jobPostingList(Model model, Principal principal) throws Exception {
		List<Map<String, Object>> list = jobPostingServiceImpl.getJobPostingsWithBusinessInfo();
		model.addAttribute("list", list);
		if (principal != null) {
		    String participant = principal.getName();
		    List<ScrapDto> selectListScrap = scrapServiceImpl.selectListScrap(participant);
	        if (selectListScrap != null) {
	            // 스크랩 데이터를 JSON 형식으로 변환하여 모델에 추가
	            ObjectMapper objectMapper = new ObjectMapper();
	            String selectListScrapJson = objectMapper.writeValueAsString(selectListScrap);
	            model.addAttribute("selectListScrapJson", selectListScrapJson);
	        }
		}
		return "jpost/jpostListAll";
	}
}
