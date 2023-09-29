package kh.lclass.jjapkorea.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object obj1 = request.getSession().getAttribute("loginPerson");
		Object obj2 = request.getSession().getAttribute("loginBusiness");
		if(obj1 == null || obj2 == null) {  // 로그인 되어있지 않은 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			// 타겟 URL요청으로 가지 않음.
			return false;
		}
		// return true : 타겟URL의 mapping된 타겟메소드 호출하러감.
		//return HandlerInterceptor.super.preHandle(request, response, handler);
		return true;
	}
}
