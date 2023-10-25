package kh.lclass.jjapkorea.onepick.controller;

import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
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
		
		List<Map<String, Object>> list = jobPostingServiceImpl.list();
		// HTML 태그를 제거하고 텍스트만 추출하여 다시 맵에 담는 작업 수행
        for (Map<String, Object> item : list) {
        	// "JPOSTDETAIL" 키가 존재하는지 확인
            if (item.containsKey("JPOSTDETAIL")) {
                // "JPOSTDETAIL" 키의 HTML 내용 가져오기
                String htmlContent = (String) item.get("JPOSTDETAIL");

                // Jsoup을 사용하여 HTML 파싱
                Document doc = Jsoup.parse(htmlContent);

                // HTML 태그 제거
                String plainText = doc.text();

                // "JPOSTDETAIL" 키에 텍스트 값 설정
                item.put("JPOSTDETAIL", plainText);
            }
        }
		model.addAttribute("list", list);
		
		return "one-pick";
	}
}
