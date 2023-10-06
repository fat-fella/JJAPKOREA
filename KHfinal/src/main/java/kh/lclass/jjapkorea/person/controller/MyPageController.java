package kh.lclass.jjapkorea.person.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
@RequestMapping("/person")
public class MyPageController {
	@Autowired
	private ScrapService scrapService;
	
	@GetMapping("/myPage")
	public String myPage() throws Exception{
		return "member/myPage";
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
