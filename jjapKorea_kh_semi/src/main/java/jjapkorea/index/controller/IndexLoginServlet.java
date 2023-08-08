package jjapkorea.index.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jjapkorea.Jobposting.model.dto.JobpostingDto;
import jjapkorea.worknetapi.WorknetApi;

/**
 * Servlet implementation class IndexLoginServlet
 */
@WebServlet("/index/login")
public class IndexLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private WorknetApi worknetApi;
	
    public IndexLoginServlet() {
        super();
        worknetApi = new WorknetApi();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<JobpostingDto> list = worknetApi.getJobPostings(); // WorknetApi를 통해 DTO 리스트를 가져옴.
		int endIndex = Math.min(list.size(), 8); // 8개 요소 이하인 경우 끝 인덱스를 리스트 크기로 설정
		List<JobpostingDto> firstEightItems = list.subList(0, endIndex);
		request.setAttribute("list", firstEightItems);
		
		String pname = (String) request.getSession().getAttribute("pname");
		request.setAttribute("pname", pname);
		
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
