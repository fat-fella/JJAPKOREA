package kh.lclass.jjapkorea.index.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.lclass.jjapkorea.Jobposting.model.dto.JobpostingDto;
import kh.lclass.jjapkorea.Jobposting.model.service.JobpostingService;

@WebServlet("/index/login")
public class IndexLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JobpostingService service = new JobpostingService();
		List<JobpostingDto> list = service.list();
		int chunkSize = 8; // 묶을 요소 개수
		int totalItems = list.size();
		for (int startIndex = 0; startIndex < totalItems; startIndex += chunkSize) {
		    int endIndex = Math.min(startIndex + chunkSize, totalItems);
		    List<JobpostingDto> subList = list.subList(startIndex, endIndex);
		    String attributeName = "list" + (startIndex / chunkSize + 1); // 새로운 속성 이름 생성 (list1, list2, ...)
		    request.setAttribute(attributeName, subList);
		}
		
		String mid = (String)request.getSession().getAttribute("SsLoginId");
		String mid2 = (String)request.getSession().getAttribute("SsLoginId2");
		request.setAttribute("SsLoginId", mid);
		request.setAttribute("SsLoginId2", mid2);
		String pname = (String) request.getSession().getAttribute("pname");
		request.setAttribute("pname", pname);
		String pname2 = (String) request.getSession().getAttribute("pname2");
		request.setAttribute("pname2", pname2);
		
		request.getRequestDispatcher("/WEB-INF/view/indexLogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
