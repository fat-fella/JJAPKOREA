package kh.lclass.jjapkorea.person.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	@Autowired
	private ScrapService scrapService;
	
	@GetMapping("/scrap")
    public String scrap(Model model, String mid) throws Exception{
		String viewPage = "member/myPage";
		List<Map<String, Object>> scrapList = scrapService.scrapList(mid);
		model.addAttribute("scrapList", scrapList);
        return viewPage;
    }

    @PostMapping("/scrap")
    public String scrap(Model model, RedirectAttributes redirectAttr, ScrapDto scrapDto) throws Exception{
    	String viewPage = "redirect:/index";
		try {
			scrapService.scrap(scrapDto);
			redirectAttr.addFlashAttribute("msg", "스크랩 성공");
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("msg", "스크랩 실패");
		}
		return viewPage;
    }
    
    @PostMapping("/scrapCancel")
    public String scrapCancel(Model model, RedirectAttributes redirectAttr, ScrapDto scrapDto) throws Exception {
    	String viewPage = "redirect:/index";
		try {
			scrapService.scrapCancel(scrapDto);
			redirectAttr.addFlashAttribute("msg", "스크랩 해제 성공");
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("msg", "스크랩 해제 실패");
		}
		return viewPage;
    }
}
