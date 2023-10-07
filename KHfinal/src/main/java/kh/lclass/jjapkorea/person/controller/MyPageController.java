package kh.lclass.jjapkorea.person.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.lclass.jjapkorea.guest.model.dto.MemberDto;
import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.guest.model.service.MemberService;
import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
@RequestMapping("/person")
public class MyPageController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ScrapService scrapService;
	
	@GetMapping("/myPage")
	public String myPage() throws Exception{
		return "member/myPage";
	}
	
	@PostMapping("/myPage")
	public String myPage(String mid) throws Exception{
		return "redirect:/person/myPage";
	}
	
	@GetMapping("/infoModifyPerson")
	public String infoModifyPerson() throws Exception{
		return "member/infoModifyPerson";
	}
	
	@PostMapping("/infoModifyPerson")
	public String infoModifyPerson(@ModelAttribute MemberDto memberDto, @ModelAttribute PersonDto personDto) throws Exception{
		if (!StringUtils.isEmpty(memberDto.getMpw())) {
			memberService.infoModifyMemberAndPerson(memberDto, personDto);
		}
		return "redirect:/person/infoModifyPerson";
	}
	
	@GetMapping("/scrap")
    public String scrap(Model model) throws Exception{
		String mid = (String) model.getAttribute("mid");
		List<Map<String, Object>> scrapList = scrapService.scrapList(mid);
		model.addAttribute("scrapList", scrapList);
        return "member/scrap";
    }
	
	@RequestMapping(value="/scrap", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> scrap(@RequestBody ScrapDto scrapDto) throws Exception {
	    int scrap;
	    try {
	    	boolean isScrapAction = Boolean.parseBoolean(scrapDto.getIsScrapAction());
	        if (isScrapAction) {
	            scrap = scrapService.scrap(scrapDto); // 스크랩 요청 처리
	        } else {
	            scrap = scrapService.scrapCancel(scrapDto); // 스크랩 해제 요청 처리
	        }
	        if (scrap < 1) {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("클라이언트 오류");
	        } else {
	            if (isScrapAction) {
	                return ResponseEntity.ok("스크랩 성공");
	            } else {
	            	return ResponseEntity.ok("스크랩 해제 성공");
	            }
	        }
	    } catch (Exception e) {
	    	return ResponseEntity.ok("서버 오류");
	    }
	}
}
