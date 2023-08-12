package jjapkorea.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jjapkorea.scrap.model.dto.ScrapDto;
import jjapkorea.scrap.model.service.ScrapService;

/**
 * Servlet implementation class ScrapCancleServlet
 */
@WebServlet("/cancle")
public class ScrapCancleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapCancleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pname = (String)request.getSession().getAttribute("pname");
		request.setAttribute("pname", pname);
		String pname2 = (String)request.getSession().getAttribute("pname2");
		request.setAttribute("pname2", pname2);
		
		String jid = request.getParameter("jid");
		
		String mid = (String)request.getSession().getAttribute("SsLoginId");
		String mid2 = (String)request.getSession().getAttribute("SsLoginId2");
		
		ScrapDto dto = new ScrapDto(mid, jid);
		ScrapDto dto2 = new ScrapDto(mid2, jid);
		
		ScrapService service = new ScrapService();
		
		if(mid != null && mid2 == null) {
			service.scrapCancle(dto);
		} else if(mid == null && mid2 != null) {
			service.scrapCancle(dto2);
		}
		
		List<ScrapDto> list = service.scrapList(mid);
		List<ScrapDto> list2 = service.scrapList(mid2);
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
	}

}
