package jjapkorea.member.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jjapkorea.scrap.model.dao.ScrapDao;
import jjapkorea.scrap.model.dto.ScrapDto;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/mypage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private ScrapDao scrapDao;
	
    public MyPageServlet() {
        super();
        scrapDao = new ScrapDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ScrapDto> list = scrapDao.scrapList();
		
		String pname = (String) request.getSession().getAttribute("pname");
		request.setAttribute("pname", pname);
		request.getRequestDispatcher("/WEB-INF/view/member/mypage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
