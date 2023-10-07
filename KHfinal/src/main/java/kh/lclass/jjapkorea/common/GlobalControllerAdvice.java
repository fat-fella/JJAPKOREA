package kh.lclass.jjapkorea.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kh.lclass.jjapkorea.guest.model.dto.PersonDto;
import kh.lclass.jjapkorea.guest.model.service.MemberService;

@ControllerAdvice
public class GlobalControllerAdvice {
	@Autowired
    private MemberService memberService;

    @ModelAttribute
    public void addCommonAttributes(Model model) throws Exception {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String mid = authentication.getName();
        PersonDto selectOnePerson = memberService.selectOnePerson(mid);
        
        model.addAttribute("mid", mid);
        model.addAttribute("selectOnePerson", selectOnePerson);
    }
}
