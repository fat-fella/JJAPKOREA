package kh.lclass.jjapkorea.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

@ControllerAdvice
public class GlobalExceptionHandler {
	@Autowired
    private HttpServletRequest request; // HttpServletRequest 주입

    @ExceptionHandler(BindException.class)
    public String handleBindException(BindException ex, RedirectAttributes redirectAttr) throws Exception {
    	// 예외 처리
        List<String> errorMessages = new ArrayList<>();
        for (ObjectError error : ex.getAllErrors()) {
            errorMessages.add(error.getDefaultMessage());
        }
        String jsonErrorMsg = new ObjectMapper().writeValueAsString(errorMessages);
        // 조건에 따라 리다이렉션 경로 선택
        String redirectUrl;
        if (isBusinessMember(request.getRequestURI())) {
            redirectUrl = "redirect:/signup/business"; // 기업 회원 가입 페이지로 리다이렉트
        } else {
            redirectUrl = "redirect:/signup/person"; // 개인 회원 가입 페이지로 리다이렉트
        }
        // Flash 속성에 메시지 추가
        redirectAttr.addFlashAttribute("msg", jsonErrorMsg);
        // 지정한 URL로 리다이렉션
        return redirectUrl;
    }
    
    private boolean isBusinessMember(String requestURI) {
        // 요청 URI를 기준으로 기업 회원 여부를 판단
        return requestURI.contains("/business");
    }
}
