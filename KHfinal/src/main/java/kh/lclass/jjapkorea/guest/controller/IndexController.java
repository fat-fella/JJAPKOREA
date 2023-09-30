package kh.lclass.jjapkorea.guest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.business.model.dto.JobPostingDto;
import kh.lclass.jjapkorea.business.model.service.JobPostingService;
import kh.lclass.jjapkorea.guest.model.service.MemberService;
import kh.lclass.jjapkorea.api.WorknetApi;

@Controller
public class IndexController {
    @Autowired
	private MemberService memberService;
    
	@Autowired
	private WorknetApi worknetApi;
    
    @Autowired
	private JobPostingService jobpostingService;
    
    @GetMapping("/index")
    public String index(Model model, HttpSession session) throws Exception {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mid = authentication.getName();
    	String pname = memberService.selectOnePerson(mid);
    	model.addAttribute("pname", pname);
    	return "index";
    }
    
//    @GetMapping("/login")
//    public String indexLogin(HttpServletRequest request, HttpSession session, Model model) throws Exception{
//        List<JobpostingDto> list = jobpostingService.list();
//        int chunkSize = 8; // 묶을 요소 개수
//        int totalItems = list.size();
//        for (int startIndex = 0; startIndex < totalItems; startIndex += chunkSize) {
//            int endIndex = Math.min(startIndex + chunkSize, totalItems);
//            List<JobpostingDto> subList = list.subList(startIndex, endIndex);
//            String attributeName = "list" + (startIndex / chunkSize + 1); // 새로운 속성 이름 생성 (list1, list2, ...)
//            model.addAttribute(attributeName, subList);
//        }
//
//        String mid = (String) session.getAttribute("SsLoginId");
//        String mid2 = (String) session.getAttribute("SsLoginId2");
//        model.addAttribute("SsLoginId", mid);
//        model.addAttribute("SsLoginId2", mid2);
//        String pname = (String) session.getAttribute("pname");
//        model.addAttribute("pname", pname);
//        String pname2 = (String) session.getAttribute("pname2");
//        model.addAttribute("pname2", pname2);
//
//        return "indexLogin"; // indexLogin.jsp 파일 경로
//    }
}
