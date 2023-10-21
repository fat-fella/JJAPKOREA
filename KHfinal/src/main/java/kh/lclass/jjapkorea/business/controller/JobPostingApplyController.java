package kh.lclass.jjapkorea.business.controller;

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
@RequestMapping("/business/apply")
public class JobPostingApplyController {
	@Autowired
	ApplyService applyServiceImpl;
	
	@GetMapping("/list")
	public String JobPostingApplyList(Model model, String jid, @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "itemsPerPage", defaultValue = "5") int itemsPerPage) throws Exception {
		List<Map<String, Object>> applyListAll = applyServiceImpl.applyListAll(jid);
		model.addAttribute("applyListAll", applyListAll);
		
		// 전체 데이터의 총 수를 구한 뒤, 페이징 정보를 생성
	    int totalItems = applyServiceImpl.jobPostingGetTotalItems(jid);
	    Pagination pagination = new Pagination(totalItems, page, itemsPerPage);
	    model.addAttribute("pagination", pagination);
	    
	    return "jpost/jpostApplyList";
	}
}
