package kh.lclass.jjapkorea.person.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	@Autowired
	private ScrapService scrapService;
	
	@GetMapping("/scrap")
    public String showMyPage(Model model) throws Exception{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String mid = authentication.getName();
		model.addAttribute("mid", mid);
        
        return "member/myPage";
    }

    @PostMapping("/scrap")
    public void addScrap(HttpServletRequest request) throws Exception{
        String jid = request.getParameter("jid");

        String mid = (String) request.getSession().getAttribute("SsLoginId");
        String mid2 = (String) request.getSession().getAttribute("SsLoginId2");

//        ScrapDto dto = new ScrapDto(mid, jid);
//        ScrapDto dto2 = new ScrapDto(mid2, jid);
//
//        if (mid != null && mid2 == null) {
//            scrapService.scrap(dto);
//        } else if (mid == null && mid2 != null) {
//            scrapService.scrap(dto2);
//        }
    }
    
    @PostMapping("/scrapCancel")
    public String scrapCancel(Model model, HttpSession session, @RequestParam("jid") String jid) throws Exception {
        String mid = (String) session.getAttribute("SsLoginId");
        String mid2 = (String) session.getAttribute("SsLoginId2");

//        ScrapDto dto = new ScrapDto(mid, jid);
//        ScrapDto dto2 = new ScrapDto(mid2, jid);
//
//        if (mid != null && mid2 == null) {
//            scrapService.scrapCancel(dto);
//        } else if (mid == null && mid2 != null) {
//            scrapService.scrapCancel(dto2);
//        }

//        List<ScrapDto> list = scrapService.scrapList(mid);
//        List<ScrapDto> list2 = scrapService.scrapList(mid2);

//        model.addAttribute("list", list);
//        model.addAttribute("list2", list2);

        return "redirect:/index";
    }
}
