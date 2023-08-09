package jjapkorea.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/indexLogin.jsp")
public class LoginFilter implements Filter {
	
	@Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false); // 세션이 없으면 null 반환

        if (session == null || session.getAttribute("SsLoginId") == null) {
            // 로그인되지 않았으면 다른 페이지로 리다이렉트
        	request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response);
        } else {
            // 로그인된 상태이면 요청 허용
            chain.doFilter(request, response);
        }
    }
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 초기화 로직
    }

    @Override
    public void destroy() {
        // 필터 해제 시 수행될 로직
    }
}
