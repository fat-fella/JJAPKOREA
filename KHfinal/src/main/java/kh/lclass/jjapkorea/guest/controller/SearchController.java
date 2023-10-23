package kh.lclass.jjapkorea.guest.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.lclass.jjapkorea.business.model.service.JobPostingService;
import kh.lclass.jjapkorea.guest.model.dto.SearchDto;
import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
public class SearchController {
	@Autowired
	private JobPostingService jobPostingServiceImlp;
	
	@Autowired
	private ScrapService scrapServiceImpl;
	
	@GetMapping("/search")
	public String search(SearchDto searchDto, String stext, Model model, Principal principal) throws Exception {
		searchDto.setKeyword(stext);
		List<Map<String, Object>> getJobPostingByKeyword = jobPostingServiceImlp.getJobPostingByKeyword(searchDto.getKeyword());
		model.addAttribute("getJobPostingByKeyword", getJobPostingByKeyword);
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
		return "jpost/searchResult";
	}
	
	@GetMapping("/detailSearch")
	public String detailSearch() throws Exception {
		return "jpost/detailSearch";
	}
	
	@GetMapping("/detailSearchResult")
	public String detailSearchResult(SearchDto searchDto, Model model, Principal principal) throws Exception {
		List<Map<String, Object>> getJobPostingByKeywords = jobPostingServiceImlp.getJobPostingByKeywords(searchDto);
		model.addAttribute("getJobPostingByKeywords", getJobPostingByKeywords);
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
		return "jpost/detailSearch";
	}
}
