package kh.lclass.jjapkorea.person.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.lclass.jjapkorea.business.model.service.ApplyService;
import kh.lclass.jjapkorea.person.model.dto.Pagination;

@Controller
@RequestMapping("/person/apply")
public class ApplyController {
	@Autowired
	ApplyService applyServiceImpl;
	
	@GetMapping("/list")
	public String ApplyList(Principal principal, Model model, @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "itemsPerPage", defaultValue = "5") int itemsPerPage) throws Exception {
		String participant = principal.getName();
		List<Map<String, Object>> applyList = applyServiceImpl.applyList(participant);
		for (Map<String, Object> item : applyList) {
		    String reTitle = (String) item.get("RE_TITLE");
		    int reTitleLength = reTitle.length();
		    if (reTitleLength > 100) {
		        String shortReTitle = reTitle.substring(0, 100) + "...";
		        item.put("SHORT_RE_TITLE", shortReTitle);
		    } else {
		    	item.put("SHORT_RE_TITLE", reTitle);
		    }
		}
		model.addAttribute("applyList", applyList);
		
		// 전체 데이터의 총 수를 구한 뒤, 페이징 정보를 생성
	    int totalItems = applyServiceImpl.getTotalItems(participant);
	    Pagination pagination = new Pagination(totalItems, page, itemsPerPage);
	    model.addAttribute("pagination", pagination);
		return "jpost/applyList";
	}
}
