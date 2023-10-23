package kh.lclass.jjapkorea.onepick.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OnePickController {
	@RequestMapping(value = "/onepick", method = RequestMethod.GET)
	public String onePick() throws Exception {
		return "";
	}
}
