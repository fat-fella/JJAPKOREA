package kh.lclass.jjapkorea.guest.controller;

import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
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
        List<Map<String, Object>> topTwoInfoByDDay = jobPostingService.topTwoInfoByDDay();
        model.addAttribute("topTwoInfoByDDay", topTwoInfoByDDay);
        List<Map<String, Object>> getNextTwoInfoByDDay = jobPostingService.getNextTwoInfoByDDay();
        model.addAttribute("getNextTwoInfoByDDay", getNextTwoInfoByDDay);
        List<Map<String, Object>> getNextTwoInfoByDDay2 = jobPostingService.getNextTwoInfoByDDay2();
        model.addAttribute("getNextTwoInfoByDDay2", getNextTwoInfoByDDay2);
        List<Map<String, Object>> getNextTwoInfoByDDay3 = jobPostingService.getNextTwoInfoByDDay3();
        model.addAttribute("getNextTwoInfoByDDay3", getNextTwoInfoByDDay3);
        List<Map<String, Object>> getNextTwoInfoByDDay4 = jobPostingService.getNextTwoInfoByDDay4();
        model.addAttribute("getNextTwoInfoByDDay4", getNextTwoInfoByDDay4);
        List<Map<String, Object>> getNextTwoInfoByDDay5 = jobPostingService.getNextTwoInfoByDDay5();
        model.addAttribute("getNextTwoInfoByDDay5", getNextTwoInfoByDDay5);
        
        List<Map<String, Object>> topTwoInfoByLikehit = jobPostingService.topTwoInfoByLikehit();
        
        // HTML 태그를 제거하고 텍스트만 추출하여 다시 맵에 담는 작업 수행
        for (Map<String, Object> item : topTwoInfoByLikehit) {
        	if (item.containsKey("BC")) {
	            // "BC" 키의 HTML 내용 가져오기
	            String htmlContent = (String) item.get("BC");
	            
	            // Jsoup을 사용하여 HTML 파싱
	            Document doc = Jsoup.parse(htmlContent);
	            
	            // HTML 태그 제거
	            String plainText = doc.text();
	            
	            // "BC" 키에 텍스트 값 설정
	            item.put("BC", plainText);
        	}
        }
        
        model.addAttribute("topTwoInfoByLikehit", topTwoInfoByLikehit);
        
        List<Map<String, Object>> getNextTwoInfoByLikehit = jobPostingService.getNextTwoInfoByLikehit();
        
        // HTML 태그를 제거하고 텍스트만 추출하여 다시 맵에 담는 작업 수행
        for (Map<String, Object> item : getNextTwoInfoByLikehit) {
            // "BC" 키의 HTML 내용 가져오기
            String htmlContent = (String) item.get("BC");
            
            // Jsoup을 사용하여 HTML 파싱
            Document doc = Jsoup.parse(htmlContent);
            
            // HTML 태그 제거
            String plainText = doc.text();
            
            // "BC" 키에 텍스트 값 설정
            item.put("BC", plainText);
        }
        
        model.addAttribute("getNextTwoInfoByLikehit", getNextTwoInfoByLikehit);
        
        List<Map<String, Object>> getNextTwoInfoByLikehit2 = jobPostingService.getNextTwoInfoByLikehit2();
        
        // HTML 태그를 제거하고 텍스트만 추출하여 다시 맵에 담는 작업 수행
        for (Map<String, Object> item : getNextTwoInfoByLikehit2) {
            // "BC" 키의 HTML 내용 가져오기
            String htmlContent = (String) item.get("BC");
            
            // Jsoup을 사용하여 HTML 파싱
            Document doc = Jsoup.parse(htmlContent);
            
            // HTML 태그 제거
            String plainText = doc.text();
            
            // "BC" 키에 텍스트 값 설정
            item.put("BC", plainText);
        }
        
        model.addAttribute("getNextTwoInfoByLikehit2", getNextTwoInfoByLikehit2);
        
        List<Map<String, Object>> getNextTwoInfoByLikehit3 = jobPostingService.getNextTwoInfoByLikehit3();
        
        // HTML 태그를 제거하고 텍스트만 추출하여 다시 맵에 담는 작업 수행
        for (Map<String, Object> item : getNextTwoInfoByLikehit3) {
            // "BC" 키의 HTML 내용 가져오기
            String htmlContent = (String) item.get("BC");
            
            // Jsoup을 사용하여 HTML 파싱
            Document doc = Jsoup.parse(htmlContent);
            
            // HTML 태그 제거
            String plainText = doc.text();
            
            // "BC" 키에 텍스트 값 설정
            item.put("BC", plainText);
        }
        
        model.addAttribute("getNextTwoInfoByLikehit3", getNextTwoInfoByLikehit3);
        
        List<Map<String, Object>> getNextTwoInfoByLikehit4 = jobPostingService.getNextTwoInfoByLikehit4();
        
        // HTML 태그를 제거하고 텍스트만 추출하여 다시 맵에 담는 작업 수행
        for (Map<String, Object> item : getNextTwoInfoByLikehit4) {
            // "BC" 키의 HTML 내용 가져오기
            String htmlContent = (String) item.get("BC");
            
            // Jsoup을 사용하여 HTML 파싱
            Document doc = Jsoup.parse(htmlContent);
            
            // HTML 태그 제거
            String plainText = doc.text();
            
            // "BC" 키에 텍스트 값 설정
            item.put("BC", plainText);
        }
        
        model.addAttribute("getNextTwoInfoByLikehit4", getNextTwoInfoByLikehit4);
        
        List<Map<String, Object>> getNextTwoInfoByLikehit5 = jobPostingService.getNextTwoInfoByLikehit5();
        
        // HTML 태그를 제거하고 텍스트만 추출하여 다시 맵에 담는 작업 수행
        for (Map<String, Object> item : getNextTwoInfoByLikehit5) {
            // "BC" 키의 HTML 내용 가져오기
            String htmlContent = (String) item.get("BC");
            
            // Jsoup을 사용하여 HTML 파싱
            Document doc = Jsoup.parse(htmlContent);
            
            // HTML 태그 제거
            String plainText = doc.text();
            
            // "BC" 키에 텍스트 값 설정
            item.put("BC", plainText);
        }
        
        model.addAttribute("getNextTwoInfoByLikehit5", getNextTwoInfoByLikehit5);
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
}
