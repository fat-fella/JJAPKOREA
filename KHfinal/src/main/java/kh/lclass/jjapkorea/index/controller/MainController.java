package kh.lclass.jjapkorea.index.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.lclass.jjapkorea.Jobposting.model.service.JobpostingService;
import kh.lclass.jjapkorea.api.WorknetApi;

@Controller
public class MainController {
	@Autowired
	private WorknetApi worknetApi;
    
    @Autowired
	private JobpostingService jobpostingService;
    
    @GetMapping("/main")
    public String main(Model model, HttpSession session) throws Exception {
    	return "index";
    }
}
