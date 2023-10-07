package kh.lclass.jjapkorea.guest.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.lclass.jjapkorea.api.WorknetApi;
import kh.lclass.jjapkorea.business.model.service.JobPostingService;
import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
public class IndexController {
	@Autowired
	private WorknetApi worknetApi;
	
    @Autowired
    private JobPostingService jobPostingService;
    
    @Autowired
    private ScrapService scrapService;
    
    @GetMapping("/index")
    public String index(Model model) throws Exception {
        List<Map<String, Object>> jobPostingData = jobPostingService.getJobPostingsWithBusinessInfo();
        int chunkSize = 8; // 묶을 요소 개수
        int totalItems = jobPostingData.size();
        for (int startIndex = 0; startIndex < totalItems; startIndex += chunkSize) {
            int endIndex = Math.min(startIndex + chunkSize, totalItems);
            List<Map<String, Object>> subList = jobPostingData.subList(startIndex, endIndex);
            // 모델에 "list1", "list2", ... 와 같은 속성으로 맵을 추가
            String attributeName = "list" + (startIndex / chunkSize + 1); // 새로운 속성 이름 생성 (list1, list2, ...)
            model.addAttribute(attributeName, subList);
        }
        String mid = (String) model.getAttribute("mid");
        List<ScrapDto> selectListScrap = scrapService.selectListScrap(mid);
        if (selectListScrap != null) {
            // 스크랩 데이터를 JSON 형식으로 변환하여 모델에 추가
            ObjectMapper objectMapper = new ObjectMapper();
            String selectListScrapJson = objectMapper.writeValueAsString(selectListScrap);
            model.addAttribute("selectListScrapJson", selectListScrapJson);
        }
        return "index";
    }
    
    @GetMapping("/indexClone")
    public String indexPyr(Model model) throws Exception {
    	worknetApi.getJobPostings();
    	List<Map<String, Object>> jobPostingData = jobPostingService.getJobPostingsWithBusinessInfo();
        int chunkSize = 8; // 묶을 요소 개수
        int totalItems = jobPostingData.size();
        for (int startIndex = 0; startIndex < totalItems; startIndex += chunkSize) {
            int endIndex = Math.min(startIndex + chunkSize, totalItems);
            List<Map<String, Object>> subList = jobPostingData.subList(startIndex, endIndex);
            // 모델에 "list1", "list2", ... 와 같은 속성으로 맵을 추가
            String attributeName = "list" + (startIndex / chunkSize + 1); // 새로운 속성 이름 생성 (list1, list2, ...)
            model.addAttribute(attributeName, subList);
        }
    	return "index";
    }
}
