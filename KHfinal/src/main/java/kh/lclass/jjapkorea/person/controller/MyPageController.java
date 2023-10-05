package kh.lclass.jjapkorea.person.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.lclass.jjapkorea.person.model.dto.ScrapDto;
import kh.lclass.jjapkorea.person.model.service.ScrapService;

@Controller
@RequestMapping("/person")
public class MyPageController {
	@Autowired
	private ScrapService scrapService;
	
	@GetMapping("/scrap")
    public String scrap(Model model) throws Exception{
		String mid = (String) model.getAttribute("mid");
		List<Map<String, Object>> scrapList = scrapService.scrapList(mid);
		model.addAttribute("scrapList", scrapList);
        return "member/myPage";
    }
	
    @PostMapping("/scrap")
    public ResponseEntity<String> scrap(ScrapDto scrapDto) throws Exception{
    	int scrap;
		try {
			scrap = scrapService.scrap(scrapDto);
			if(scrap < 1) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failure");
			} else {
				return ResponseEntity.ok("success");
			}
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failure");
		}
    }
    
    @GetMapping("/scrapCancel")
    public String scrapCancel() throws Exception {
    	return "member/myPage";
    }
    
    @PostMapping("/scrapCancel")
    public ResponseEntity<String> scrapCancel(ScrapDto scrapDto) throws Exception {
    	int scrap;
		try {
			scrap = scrapService.scrapCancel(scrapDto);
			if(scrap < 1) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failure");
			} else {
				return ResponseEntity.ok("success");
			}
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("failure");
		}
    }
}
