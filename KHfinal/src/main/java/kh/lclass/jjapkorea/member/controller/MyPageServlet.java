//package kh.lclass.jjapkorea.member.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import kh.lclass.jjapkorea.scrap.model.dto.ScrapDto;
//import kh.lclass.jjapkorea.scrap.model.service.ScrapService;
//
//@WebServlet("/mypage")
//public class MyPageServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String pname = (String)request.getSession().getAttribute("pname");
//		request.setAttribute("pname", pname);
//		String pname2 = (String)request.getSession().getAttribute("pname2");
//		request.setAttribute("pname2", pname2);
//		
//		String mid = (String)request.getSession().getAttribute("SsLoginId");
//		String mid2 = (String)request.getSession().getAttribute("SsLoginId2");
//		request.setAttribute("SsLoginId", mid);
//		request.setAttribute("SsLoginId2", mid2);
//		
//		ScrapService service = new ScrapService();
//		
//		List<ScrapDto> list = jobpostingService.scrapList(mid);
//		List<ScrapDto> list2 = jobpostingService.scrapList(mid2);
//		
//		request.setAttribute("list", list);
//		request.setAttribute("list2", list2);
//		
//		request.getRequestDispatcher("/WEB-INF/view/member/mypage.jsp").forward(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String pname = (String)request.getSession().getAttribute("pname");
//		request.setAttribute("pname", pname);
//		String pname2 = (String)request.getSession().getAttribute("pname2");
//		request.setAttribute("pname2", pname2);
//		
//		String jid = request.getParameter("jid");
//		
//		String mid = (String)request.getSession().getAttribute("SsLoginId");
//		String mid2 = (String)request.getSession().getAttribute("SsLoginId2");
//		
//		ScrapDto dto = new ScrapDto(mid, jid);
//		ScrapDto dto2 = new ScrapDto(mid2, jid);
//		
//		ScrapService service = new ScrapService();
//		
//		if(mid != null && mid2 == null) {
//			service.scrap(dto);
//		} else if(mid == null && mid2 != null) {
//			service.scrap(dto2);
//		}
//		
//		List<ScrapDto> list = service.scrapList(mid);
//		List<ScrapDto> list2 = service.scrapList(mid2);
//		request.setAttribute("list", list);
//		request.setAttribute("list2", list2);
//	}
//}
