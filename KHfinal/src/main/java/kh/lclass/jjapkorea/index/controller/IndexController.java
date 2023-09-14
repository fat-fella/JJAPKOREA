package kh.lclass.jjapkorea.index.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;
import kh.lclass.jjapkorea.Jobposting.model.service.JobpostingService;
import kh.lclass.jjapkorea.api.WorknetApi;

@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private WorknetApi worknetApi;
    
    @Autowired
	private JobpostingService jobpostingService;
    
    @GetMapping()
    public String index(Model model) {
        try {
            // WorknetApi를 통해 DTO 리스트를 가져옵니다.
            worknetApi.getJobPostings();

            // JobpostingService를 통해 리스트를 가져옵니다.
            List<JobpostingDto> list = jobpostingService.list();

            int chunkSize = 8; // 묶을 요소 개수
            int totalItems = list.size();
            for (int startIndex = 0; startIndex < totalItems; startIndex += chunkSize) {
                int endIndex = Math.min(startIndex + chunkSize, totalItems);
                List<JobpostingDto> subList = list.subList(startIndex, endIndex);
                String attributeName = "list" + (startIndex / chunkSize + 1); // 새로운 속성 이름 생성 (list1, list2, ...)
                model.addAttribute(attributeName, subList);
            }

            return "index";
        } catch (Exception e) {
        	return "error";
        }
    }
}
