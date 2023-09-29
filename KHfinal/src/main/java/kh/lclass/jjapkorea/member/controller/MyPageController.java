package kh.lclass.jjapkorea.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.lclass.jjapkorea.scrap.model.dto.ScrapDto;
import kh.lclass.jjapkorea.scrap.model.service.ScrapService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	@Autowired
	private ScrapService scrapService;
	
	@GetMapping("/")
    public String showMyPage(HttpSession session, Model model) throws Exception{
        String pname = (String) session.getAttribute("pname");
        String pname2 = (String) session.getAttribute("pname2");

        String mid = (String) session.getAttribute("SsLoginId");
        String mid2 = (String) session.getAttribute("SsLoginId2");

        List<ScrapDto> list = scrapService.scrapList(mid);
        List<ScrapDto> list2 = scrapService.scrapList(mid2);

        model.addAttribute("pname", pname);
        model.addAttribute("pname2", pname2);
        model.addAttribute("SsLoginId", mid);
        model.addAttribute("SsLoginId2", mid2);
        model.addAttribute("list", list);
        model.addAttribute("list2", list2);

        return "member/mypage"; // mypage.jsp 파일 경로
    }

    @PostMapping("/")
    public void addScrap(HttpServletRequest request) throws Exception{
        String jid = request.getParameter("jid");

        String mid = (String) request.getSession().getAttribute("SsLoginId");
        String mid2 = (String) request.getSession().getAttribute("SsLoginId2");

        ScrapDto dto = new ScrapDto(mid, jid);
        ScrapDto dto2 = new ScrapDto(mid2, jid);

        if (mid != null && mid2 == null) {
            scrapService.scrap(dto);
        } else if (mid == null && mid2 != null) {
            scrapService.scrap(dto2);
        }
    }
    
    @PostMapping("/cancel")
    public String scrapCancel(@RequestParam("jid") String jid, HttpSession session, Model model) throws Exception {
        String mid = (String) session.getAttribute("SsLoginId");
        String mid2 = (String) session.getAttribute("SsLoginId2");

        ScrapDto dto = new ScrapDto(mid, jid);
        ScrapDto dto2 = new ScrapDto(mid2, jid);

        if (mid != null && mid2 == null) {
            scrapService.scrapCancel(dto);
        } else if (mid == null && mid2 != null) {
            scrapService.scrapCancel(dto2);
        }

        List<ScrapDto> list = scrapService.scrapList(mid);
        List<ScrapDto> list2 = scrapService.scrapList(mid2);

        model.addAttribute("list", list);
        model.addAttribute("list2", list2);

        return "redirect:/mypage"; // 스크랩 취소 후 마이페이지로 리다이렉트
    }
}
