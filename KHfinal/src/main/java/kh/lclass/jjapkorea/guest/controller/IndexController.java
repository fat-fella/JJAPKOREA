package kh.lclass.jjapkorea.guest.controller;

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
    
    private List<JobPostingDto> updatedJobPostings; // 업데이트된 데이터를 저장할 변수

    @PostConstruct // 스프링 빈 초기화 시 한 번 호출
    public void init() {
        // 초기 데이터 업데이트
        updateJobPostings();
    }

    // 주기적으로 데이터를 업데이트하는 메소드
    @Scheduled(cron = "0 0 0 * * ?") // 매일 자정에 실행 (cron 표현식)
    public void updateJobPostings() {
        updatedJobPostings = worknetApi.getJobPostings();
    }

    @GetMapping("/index")
    public String index(Model model, HttpSession session) throws Exception {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String mid = authentication.getName();
        String pname = memberService.selectOnePerson(mid);
        model.addAttribute("pname", pname);
        
        // 업데이트된 데이터 사용
        int chunkSize = 8; // 묶을 요소 개수
        int totalItems = updatedJobPostings.size();
        for (int startIndex = 0; startIndex < totalItems; startIndex += chunkSize) {
            int endIndex = Math.min(startIndex + chunkSize, totalItems);
            List<JobPostingDto> subList = updatedJobPostings.subList(startIndex, endIndex);
            String attributeName = "list" + (startIndex / chunkSize + 1); // 새로운 속성 이름 생성 (list1, list2, ...)
            model.addAttribute(attributeName, subList);
        }
        
        return "index";
    }
}
