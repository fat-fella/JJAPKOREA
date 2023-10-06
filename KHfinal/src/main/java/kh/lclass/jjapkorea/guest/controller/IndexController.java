package kh.lclass.jjapkorea.guest.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.lclass.jjapkorea.api.WorknetApi;
import kh.lclass.jjapkorea.business.model.service.JobPostingService;

@Controller
public class IndexController {
	@Autowired
	private WorknetApi worknetApi;
	
    @Autowired
    private JobPostingService jobPostingService;
    
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
