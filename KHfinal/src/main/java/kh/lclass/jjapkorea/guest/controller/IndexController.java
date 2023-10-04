package kh.lclass.jjapkorea.guest.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.guest.model.service.MemberService;
import kh.lclass.jjapkorea.api.WorknetApi;

@Controller
public class IndexController {
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private WorknetApi worknetApi;
    
    // 기존 데이터를 보관하는 리스트
    private List<JobPostingDto> existingJobPostings = new ArrayList<>();

    // 업데이트된 데이터를 보관하는 리스트
    private List<JobPostingDto> updatedJobPostings = new ArrayList<>();

    @PostConstruct
    public void init() {
        // 빈 초기화 시 기존 데이터를 초기화
        existingJobPostings = worknetApi.getJobPostings();
    }

    @Scheduled(cron = "0 0 0 * * ?")
    public void updateJobPostings() {
        updatedJobPostings = worknetApi.getJobPostings();
    }

    @GetMapping("/index")
    public String index(Model model, HttpSession session) throws Exception {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String mid = authentication.getName();
        String pname = memberService.selectOnePerson(mid);
        model.addAttribute("pname", pname);
        
        // 기존 데이터를 함께 표시
        List<JobPostingDto> combinedList = new ArrayList<>(existingJobPostings);
        combinedList.addAll(updatedJobPostings);
        
        int chunkSize = 8; // 묶을 요소 개수
        int totalItems = combinedList.size();
        for (int startIndex = 0; startIndex < totalItems; startIndex += chunkSize) {
            int endIndex = Math.min(startIndex + chunkSize, totalItems);
            List<JobPostingDto> subList = combinedList.subList(startIndex, endIndex);
            String attributeName = "list" + (startIndex / chunkSize + 1);
            model.addAttribute(attributeName, subList);
        }
        
        // 기존 데이터 갱신
        existingJobPostings = updatedJobPostings;
        
        return "index";
    }
}
