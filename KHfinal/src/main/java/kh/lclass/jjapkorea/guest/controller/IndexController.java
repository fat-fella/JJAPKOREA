package kh.lclass.jjapkorea.guest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return "index";
    }
    
    @PostMapping("/index")
    @ResponseBody
    public Map<String, Object> index(Model model, @RequestParam(name = "jid") String jid) throws Exception {
        String mid = (String) model.getAttribute("mid");
        ScrapDto scrapDto = new ScrapDto();
        scrapDto.setMid(mid);
        scrapDto.setJid(jid);
        // jid 값을 이용하여 필요한 작업을 수행하고, isScrapAction 값을 설정
        boolean isScrapAction = Boolean.parseBoolean(scrapService.selectOneScrap(scrapDto));
        // JSON 응답을 위한 Map 생성
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("isScrapAction", isScrapAction); // JSON 응답 데이터 추가
        return responseMap;
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
